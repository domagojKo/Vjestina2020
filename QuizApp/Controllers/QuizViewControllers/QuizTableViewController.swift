//
//  QuizTableViewController.swift
//  QuizApp
//
//  Created by Domagoj Kolaric on 08/06/2020.
//  Copyright © 2020 Domagoj Kolaric. All rights reserved.
//

import UIKit

class QuizTableViewController: UIViewController {
    
    let quizTableView = UITableView()
    var footerView: LogoutTableViewFooter!
    var quizzes = [Quiz]()
    
    var quizCategories: [String] {
        return quizzes.map { $0.category }
    }
    
    var uniqueCategories: [String] {
        return Array(Set(quizCategories)).sorted()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "PopQuiz"
        //self.navigationController?.navigationItem.setHidesBackButton(true, animated: false)
        
        self.setupTableView()
        self.getQuizzes()
    }
    
    func setupTableView() {
        self.setBackgroundColor()
        self.view.addSubview(quizTableView)
        
        quizTableView.backgroundColor = .clear
        quizTableView.separatorStyle = .none
        quizTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            quizTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            quizTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            quizTableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            quizTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        quizTableView.register(QuizCell.self, forCellReuseIdentifier: QuizCell.quizCellIdentifier)
        quizTableView.delegate = self
        quizTableView.dataSource = self
        
        footerView = LogoutTableViewFooter(frame: CGRect(x: 0, y: 0, width: quizTableView.frame.width, height: 100))
        quizTableView.tableFooterView = footerView
        
        footerView.logoutButton.addTarget(self, action: #selector(onLogoutButtonTapped), for: .touchUpInside)
    }
    
    func getQuizzes() {
        QuizAPI.instance.fetchQuizzes { [weak self] data, error in
            guard let self = self else { return }
            if let err = error {
                print("Problem with fetching data: \(err.localizedDescription)")
                return
            }
            guard let quizData = data else { return }
            
            self.quizzes = quizData.quizzes
            
            DispatchQueue.main.async {
                self.quizTableView.reloadData()
            }
            print(self.quizzes)
        }
    }
    
    func quizzesFilter(section: Int) -> [Quiz] {
        return quizzes.filter { $0.category == uniqueCategories[section] }
    }
    
    @objc
    func onLogoutButtonTapped(sender: UIButton) {
        let loginVC = LoginViewController()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = loginVC
        appDelegate.window?.makeKeyAndVisible()
        UserDefaults.standard.set(nil, forKey: "token")
    }
    
    deinit {
        print("Deinit..")
    }
}

extension QuizTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = QuizzesTableSectionHeader()
        
        let category = uniqueCategories[section]
        
        headerView.setupTitleForHeader(category: category)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let quizFiltered = quizzesFilter(section: indexPath.section)
        
        let quiz = quizFiltered[indexPath.row]
        
        let quizVC = StartQuizViewController()
        
        quizVC.quiz = quiz
        
        self.navigationController?.pushViewController(quizVC, animated: true)
    }
}

extension QuizTableViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return uniqueCategories.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizzesFilter(section: section).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: QuizCell.quizCellIdentifier, for: indexPath) as! QuizCell
        
        cell.selectionStyle = .none
        
        let quizFiltered = quizzesFilter(section: indexPath.section)
        
        let quiz = quizFiltered[indexPath.row]
        
        cell.setupQuizzCell(quiz: quiz)
        
        return cell
    }
}
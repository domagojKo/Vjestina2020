//
//  SearchViewController.swift
//  QuizApp
//
//  Created by Domagoj Kolaric on 12/05/2020.
//  Copyright © 2020 Domagoj Kolaric. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    let searchView = SearchBarView()
    let tableView = UITableView()
    
    var quizzes1: [Quizz]?
    var filteredQuizz = [Quizz]()
    
    var searchingStr: String?
    
    var searchTextField: UITextField {
        return searchView.searchBarTF
    }
    
    var quizCategories: [String] {
        return filteredQuizz.map { $0.category! }
    }
    
    var uniqueCategories: [String] {
        return Array(Set(quizCategories)).sorted()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setBackgroundColor()
        self.setupTopView()
        self.setupTableView()
        self.getQuizzes()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func setupTopView() {
        self.view.addSubview(searchView)
        
        searchView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 40),
            searchView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            searchView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            searchView.heightAnchor.constraint(equalToConstant: 80)])
        
        searchView.searchBtn.addTarget(self, action: #selector(onSearchTapped), for: .touchUpInside)
        searchTextField.delegate = self
    }
    
    func setupTableView() {
        self.view.addSubview(tableView)
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        //tableView.allowsSelection = false
        tableView.register(QuizCell.self, forCellReuseIdentifier: QuizCell.quizCellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.searchView.bottomAnchor, constant: -10),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)])
    }
    
    func getQuizzes() {
        self.quizzes1 = CoreDataStack.instance.quizzes ?? []
        tableView.reloadData()
    }
    
    func quizFilter(search: String) {
        guard let quizzes = quizzes1, search.count > 0 else {
            self.filteredQuizz = []
            return
        }
        
        filteredQuizz = quizzes.filter { quiz in
            quiz.title?.lowercased().starts(with: search.lowercased()) == true ||
            quiz.description.lowercased().contains(search.lowercased()) == true
        }
    }
    
    func quizzesFilter(section: Int) -> [Quizz] {
        return filteredQuizz.filter { $0.category == uniqueCategories[section] }
    }
    
    @objc
    func onSearchTapped(_ sender: UIButton) {
        guard let searchingStr = searchTextField.text else { return }
        self.quizFilter(search: searchingStr)
        tableView.reloadData()
        searchView.searchBarBorderView.isHidden = true
    }
}

extension SearchViewController: UITableViewDataSource {
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

extension SearchViewController: UITableViewDelegate {
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

extension SearchViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        searchView.searchBarBorderView.isHidden = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        searchView.searchBarBorderView.isHidden = true
    }
}

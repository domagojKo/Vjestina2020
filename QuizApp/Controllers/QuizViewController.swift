//
//  QuizViewController.swift
//  QuizApp
//
//  Created by Domagoj Kolaric on 10/05/2020.
//  Copyright © 2020 Domagoj Kolaric. All rights reserved.
//

import UIKit
import Kingfisher

class QuizViewController: UIViewController {
    
    let quizView = MainQuizView()
    let customQuizView = CustomQuizView()
    var quizArray: Quizzes? = nil
    
    var quizButton: UIButton {
        return quizView.getQuizButton
    }
    
    var funFactDescription: UILabel {
        return quizView.funFactTxt
    }
    
    var errorLbl: UILabel {
        return quizView.errorLabel
    }
    
    var logoutBtn: UIButton {
        return quizView.logoutButton
    }
    
    var quizTitle: UILabel {
        return customQuizView.titleLabel
    }
    
    var quizDescription: UILabel {
        return customQuizView.descriptionLabel
    }
    
    var quizImage: UIImageView {
        return customQuizView.imageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(quizView)
        self.setBackgroundColor()
        
        quizView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            quizView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            quizView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            quizView.topAnchor.constraint(equalTo: self.view.topAnchor),
            quizView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        quizButton.addTarget(self, action: #selector(onGetQuizzes), for: .touchUpInside)
        logoutBtn.addTarget(self, action: #selector(onLogout), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @objc
    func onGetQuizzes(_ sender: UIButton) {
        self.onSetupQuizzes()
    }
    
    func onSetupQuizzes() {
        QuizAPI.instance.fetchQuizzes { [weak self] data, error in
            guard let self = self else { return }
            if let _ = error {
                DispatchQueue.main.async {
                    self.errorLbl.isHidden = false
                }
                return
            }
            
            guard let quizzes = data else { return }
            
            print(quizzes)
            
            self.quizArray = quizzes
            
            self.setupQuizView()
        }
    }
    
    func setupQuizView() {
        guard let quizzes = quizArray else { return }
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            //stavi van dispatcha jer nije vezano uz UI
            let numNBAMentioned = quizzes.quizzes.map{ $0.questions.filter {
                $0.question.contains("NBA") }
            }.count
            
            self.funFactDescription.text = "There are \(numNBAMentioned) questions that contain the word NBA!"
            self.logoutBtn.isHidden = false
            self.addQuizzes(quizArray: quizzes)
        }
    }
    
    func addQuizzes(quizArray: Quizzes) {
        self.setupCustomQuizView()
        let randomInt = Int.random(in: 0..<quizArray.quizzes.count)
        let imageUrl = quizArray.quizzes[randomInt].image
        
        if let url = imageUrl {
            let imageURL = URL(string: url)
            DispatchQueue.main.async {
                self.quizImage.kf.setImage(with: imageURL)
            }
        }
        
        let textColor = quizArray.quizzes[randomInt].categoryColor()
        
        quizTitle.text = quizArray.quizzes[randomInt].title
        quizTitle.textColor = textColor
        quizDescription.text = quizArray.quizzes[randomInt].description
        quizDescription.textColor = textColor
    }
    
    func setupCustomQuizView() {
        self.view.addSubview(customQuizView)
        customQuizView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            customQuizView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24),
            customQuizView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -24),
            customQuizView.topAnchor.constraint(equalTo: self.funFactDescription.bottomAnchor, constant: 60),
            customQuizView.heightAnchor.constraint(equalToConstant: 140)
        ])
    }
    
    @objc
    func onLogout(_ sender: UIButton) {
        DispatchQueue.main.async {
            self.navigationController?.tabBarController?.dismiss(animated: true)
        }
        UserDefaults.standard.set(nil, forKey: "token")
    }
    
    deinit {
        print("deinit")
    }
}

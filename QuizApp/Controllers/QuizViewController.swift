//
//  QuizViewController.swift
//  QuizApp
//
//  Created by Domagoj Kolaric on 10/05/2020.
//  Copyright © 2020 Domagoj Kolaric. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    let quizView = MainQuizView()
    let customQuizView = CustomQuizView()
    var quizArray: Quizzes? = nil
    
    var getQuizButton: UIButton {
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
        
        getQuizButton.addTarget(self, action: #selector(onGetQuizzes), for: .touchUpInside)
        logoutBtn.addTarget(self, action: #selector(onLogout), for: .touchUpInside)
    }
    
    @objc
    func onGetQuizzes(_ sender: UIButton) {
        QuizAPI.instance.fetchQuizzes { [weak self] data, error in
            guard let self = self else { return }
            guard error == nil else {
                DispatchQueue.main.async {
                    self.errorLbl.isHidden = false
                }
                return
            }
            
            guard let quizzes = data else { return }
            
            print(quizzes)
            
            self.quizArray = quizzes
            
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                let numNBAMentioned = quizzes.quizzes.map{ (quiz:Quiz) -> [Question] in
                    return quiz.questions.filter { (question) -> Bool in
                        return question.question.contains("NBA")
                    }
                }.count
                
                self.funFactDescription.text = "There are \(numNBAMentioned) questions that contain the word NBA!"
                self.logoutBtn.isHidden = false
                guard let quizArray = self.quizArray else { return }
                self.addQuizzes(quizArray: quizArray)
            }
        }
    }
    
    func addQuizzes(quizArray: Quizzes) {
        self.setupCustomQuizView()
        let randomInt = Int.random(in: 0..<quizArray.quizzes.count)
        let imageUrl = quizArray.quizzes[randomInt].image
        
        QuizAPI.instance.fetchQuizImage(imageUrl: imageUrl){ [weak self] (image) in
            guard let self = self else { return }
            
            if image != nil {
                DispatchQueue.main.async {
                    self.quizImage.image = image
                }
            }
        }
        
        quizTitle.text = quizArray.quizzes[randomInt].title
        quizDescription.text = quizArray.quizzes[randomInt].description
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
            let loginVC = LoginViewController()
            self.dismiss(animated: true, completion: nil)
            self.present(loginVC, animated: true, completion: nil)
        }
        UserDefaults.standard.set(nil, forKey: "token")
    }
}

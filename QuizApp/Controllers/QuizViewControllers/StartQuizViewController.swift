//
//  QuizViewController.swift
//  QuizApp
//
//  Created by Domagoj Kolaric on 08/06/2020.
//  Copyright © 2020 Domagoj Kolaric. All rights reserved.
//

import UIKit

class StartQuizViewController: UIViewController {
    
    let quizView = QuizView()
    var quiz: Quiz? = nil
    
    var startQuizBtn: UIButton {
        return quizView.startQuizButton
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setBackgroundColor()
        self.setupQuizView()
        self.setupDataForQuizView()
    }
    
    func setupQuizView() {
        self.view.addSubview(quizView)
        
        quizView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            quizView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            quizView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            quizView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 120),
            quizView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -120)
        ])
    }
    
    func setupDataForQuizView() {
        guard let quizData = quiz else { return }
        self.quizView.setupQuizView(quiz: quizData)
    }
   
    deinit {
        print("deinit")
    }
}

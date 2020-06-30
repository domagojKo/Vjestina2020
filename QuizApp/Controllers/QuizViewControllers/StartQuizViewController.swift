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
    var quiz: Quizz? = nil
    
    var startQuizBtn: UIButton {
        return quizView.startQuizButton
    }
    
    var leaderBtn: UIButton {
        return quizView.leaderboardButton
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.setBackgroundColor()
        self.setupQuizView()
        self.setupDataForQuizView()
    }
    
    func setupQuizView() {
        self.view.addSubview(quizView)
        
        quizView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            quizView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            quizView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            quizView.topAnchor.constraint(equalTo: self.view.topAnchor),
            quizView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        startQuizBtn.addTarget(self, action: #selector(onStartQuiz), for: .touchUpInside)
        leaderBtn.addTarget(self, action: #selector(onLeaderboard), for: .touchUpInside)
    }
    
    func setupDataForQuizView() {
        guard let quizData = quiz else { return }
        self.quizView.setupQuizView(quiz: quizData)
    }
    
    @objc
    func onStartQuiz(_ sender: UIButton) {
        guard let quizData = quiz else { return }
        let scrollableQuizVC = ScrollabeQuizViewController()
        scrollableQuizVC.quiz = quizData
        self.navigationController?.pushViewController(scrollableQuizVC, animated: true)
    }
    
    @objc
    func onLeaderboard(_ sender: UIButton) {
        let leaderboardVC = LeaderboardVC()
        leaderboardVC.rank = quiz!.id
        self.navigationController?.pushViewController(leaderboardVC, animated: true)
    }
   
    deinit {
        print("deinit")
    }
}

//
//  ScrollableQuizView.swift
//  QuizApp
//
//  Created by Domagoj Kolaric on 09/06/2020.
//  Copyright © 2020 Domagoj Kolaric. All rights reserved.
//

import UIKit

class ScrollableQuizView: UIView {
    
    var questionViews = [QuestionView]()
    let scrollView = UIScrollView()
    let sendResultButton = UIButton()
    let quizTimeLabel = UILabel()
    let correctAnsLabel = UILabel()
    
    var isSetup = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Has to be implemented as it is required but will never be used")
    }
    
    func setupViews() {
        self.addSubviews()
        self.styleSubviews()
        self.setupLayout()
    }
    
    func addSubviews() {
        self.addSubview(scrollView)
        self.addSubview(sendResultButton)
        self.addSubview(quizTimeLabel)
        self.addSubview(correctAnsLabel)
    }
    
    func styleSubviews() {
        scrollView.alpha = 0
        scrollView.isScrollEnabled = false
        
        quizTimeLabel.font = UIFont(name: "Arial", size: 60)
        quizTimeLabel.textColor = .white
        quizTimeLabel.textAlignment = .center
        quizTimeLabel.alpha = 0
        
        correctAnsLabel.font = UIFont(name: "Arial", size: 50)
        correctAnsLabel.textColor = .white
        correctAnsLabel.textAlignment = .center
        correctAnsLabel.alpha = 0
        
        sendResultButton.setupButton(title: "Send Result", opacity: 1)
        sendResultButton.alpha = 0
    }
    
    func setupLayout() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100),
            scrollView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.0),
            scrollView.centerXAnchor.constraint(equalTo: self.centerXAnchor)])
        
        correctAnsLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            correctAnsLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            correctAnsLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            ])
        
        quizTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            quizTimeLabel.topAnchor.constraint(equalTo: self.correctAnsLabel.bottomAnchor, constant: 50),
            quizTimeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            ])
        
        sendResultButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sendResultButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            sendResultButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            sendResultButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100),
            sendResultButton.heightAnchor.constraint(equalToConstant: 45)])
    }
}

extension ScrollableQuizView {
    func setupQuestion(quiz: Quiz) {
        let width = self.frame.size.width
        var length: CGFloat = 0.0
        self.scrollView.contentSize.width = CGFloat(quiz.questions.count) * width
        
        quiz.questions.forEach{question in
            let questionView = QuestionView()
            questionView.setupQuestion(question: question)

            questionViews.append(questionView)

            scrollView.addSubview(questionView)
            questionView.frame = CGRect(x: 0, y: 0, width: scrollView.frame.width * 0.90, height: scrollView.frame.height * 0.9)

            questionView.center.x = scrollView.center.x
            questionView.transform = CGAffineTransform(translationX: length, y: 0)

            length = length + width
        }
    }
}

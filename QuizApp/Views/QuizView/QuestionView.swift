//
//  QuestionView.swift
//  QuizApp
//
//  Created by Domagoj Kolaric on 09/06/2020.
//  Copyright © 2020 Domagoj Kolaric. All rights reserved.
//

import UIKit

class QuestionView: UIView {

    let numberOfQuestion = UILabel()
    let numberOfQuestionStackView = UIStackView()
    let buttonsStackView = UIStackView()
    let questionLabel = UILabel()
    let firstButton = UIButton()
    let secondButton = UIButton()
    let thirdButton = UIButton()
    let fourthButton = UIButton()
    
    var answerButtons = [UIButton]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Has to be implemented as it is required but will never be used")
    }
    
    func setupViews() {
        answerButtons += [firstButton, secondButton, thirdButton, fourthButton]
        self.addSubviews()
        self.setupStylesOfSubviews()
        self.setupLayout()
    }
    
    func addSubviews() {
        self.addSubview(questionLabel)
        answerButtons.forEach { btn in
            self.buttonsStackView.addArrangedSubview(btn)
        }
        self.addSubview(buttonsStackView)
    }
    
    func setupStylesOfSubviews() {
        questionLabel.font = UIFont(name: "Arial", size: 20.0)
        questionLabel.numberOfLines = 0
        questionLabel.textColor = .white
        
        buttonsStackView.axis = .vertical
        buttonsStackView.alignment = .fill
        buttonsStackView.distribution = .fill
        buttonsStackView.spacing = 10.0
        buttonsStackView.backgroundColor = .clear
        
        answerButtons.forEach { btn in
            btn.backgroundColor = .white
            btn.setTitleColor(UIColor.black, for: .normal)
            btn.titleLabel?.font = UIFont(name: "Arial", size: 16.0)
            btn.layer.opacity = 0.3
            btn.layer.cornerRadius = 22
        }
        
        firstButton.tag = 0
        secondButton.tag = 1
        thirdButton.tag = 2
        fourthButton.tag = 3
    }
    
    func setupLayout() {
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 60),
            questionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            questionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)])
        
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonsStackView.topAnchor.constraint(equalTo: self.questionLabel.bottomAnchor, constant: 30),
            buttonsStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            buttonsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor)])
        
        
        answerButtons.forEach { btn in
            btn.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                btn.heightAnchor.constraint(equalToConstant: 45)])
        }
    }
}

extension QuestionView {
    func setupQuestion(question: Questionn) {
        self.questionLabel.text = question.question
        guard var answers = question.answers?.allObjects as? [Answer] else { return }
        answers = answers.sorted { $0.index < $1.index }
        self.firstButton.setTitle(answers[0].answer, for: .normal)
        self.secondButton.setTitle(answers[1].answer, for: .normal)
        self.thirdButton.setTitle(answers[2].answer, for: .normal)
        self.fourthButton.setTitle(answers[3].answer, for: .normal)
    }
}

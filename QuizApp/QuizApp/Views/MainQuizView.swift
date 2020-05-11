//
//  MainQuizView.swift
//  QuizApp
//
//  Created by Domagoj Kolaric on 10/05/2020.
//  Copyright © 2020 Domagoj Kolaric. All rights reserved.
//

import UIKit

class MainQuizView: UIView {
    
    let titleLabel = UILabel()
    let getQuizButton = UIButton()
    let funFactLabel = UILabel()
    let funFactTxt = UILabel()
    let errorLabel = UILabel()
    let logoutButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Has to be implemented as it is required but will never be used")
    }
    
    func setupViews() {
        self.addSubviews()
        self.setupStyleOfSubviews()
        self.setupLayout()
    }
    
    func addSubviews() {
        self.addSubview(titleLabel)
        self.addSubview(getQuizButton)
        self.addSubview(funFactLabel)
        self.addSubview(funFactTxt)
        self.addSubview(errorLabel)
        self.addSubview(logoutButton)
    }
    
    func setupStyleOfSubviews() {
        titleLabel.text = "PopQuiz"
        titleLabel.font = UIFont(name: "Arial", size: 24)!
        titleLabel.textColor = .white
        
        getQuizButton.setupButton(title: "Get Quiz", opacity: 1)
        getQuizButton.isEnabled = true
        
        funFactLabel.text = "Fun Fact"
        funFactLabel.textAlignment = .left
        funFactLabel.font = UIFont(name: "Arial", size: 24)
        funFactLabel.textColor = .white
        
        funFactTxt.font = UIFont(name: "Arial", size: 18)
        funFactTxt.textAlignment = .left
        funFactTxt.textColor = .white
        funFactTxt.numberOfLines = 0
        
        errorLabel.text = "Error"
        errorLabel.font = UIFont(name: "Arial", size: 28)
        errorLabel.textColor = .white
        errorLabel.textAlignment = .center
        errorLabel.isHidden = true
        
        logoutButton.setupButton(title: "Logout", opacity: 1)
        logoutButton.isHidden = true
    }
    
    func setupLayout() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 40)])
        
        getQuizButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            getQuizButton.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 35),
            getQuizButton.heightAnchor.constraint(equalToConstant: 45),
            getQuizButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            getQuizButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32)
        ])
        
        funFactLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            funFactLabel.topAnchor.constraint(equalTo: self.getQuizButton.bottomAnchor, constant: 47),
            funFactLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            funFactLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24)
        ])
        
        funFactTxt.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            funFactTxt.topAnchor.constraint(equalTo: self.funFactLabel.bottomAnchor, constant: 0),
            funFactTxt.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            funFactTxt.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            funFactTxt.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24)
        ])
        
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            errorLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            errorLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            errorLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8)
        ])
        
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoutButton.heightAnchor.constraint(equalTo: self.getQuizButton.heightAnchor),
            logoutButton.leadingAnchor.constraint(equalTo: self.getQuizButton.leadingAnchor),
            logoutButton.trailingAnchor.constraint(equalTo: self.getQuizButton.trailingAnchor),
            logoutButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20)
        ])
    }
}

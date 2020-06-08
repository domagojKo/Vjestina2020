//
//  LoginView.swift
//  QuizApp
//
//  Created by Domagoj Kolaric on 25/04/2020.
//  Copyright © 2020 Domagoj Kolaric. All rights reserved.
//

import Foundation
import UIKit

class LoginView: UIView {
    
    let titleLabel = UILabel()
    let usernameContainerView = UIView()
    let usernameFieldWithBorder = UIView()
    let usernameTextField = UITextField()
    let passFieldWithBorder = UIView()
    let passTextField = UITextField()
    let loginButton = UIButton()
    let stackView = UIStackView()
    let visibilityBtn = UIButton()
    let containerView = UIView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Has to be implemented as it is required but will never be used")
    }
    
    func setupViews() {
        self.addSubviews()
        self.setupStyleOfSubviews()
        self.setupLayout()
    }
    
    func addSubviews() {
        self.addSubview(titleLabel)
        stackView.addArrangedSubview(usernameContainerView)
        stackView.addArrangedSubview(containerView)
        stackView.addArrangedSubview(loginButton)
        self.addSubview(stackView)
        usernameContainerView.addSubview(usernameTextField)
        usernameContainerView.addSubview(usernameFieldWithBorder)
        containerView.addSubview(passTextField)
        containerView.addSubview(passFieldWithBorder)
        containerView.addSubview(visibilityBtn)
    }
    
    func setupStyleOfSubviews() {
        titleLabel.text = "PopQuiz"
        titleLabel.font = UIFont(name: "Arial", size: 32.0)!
        titleLabel.textColor = .white
        
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 18.0
        
        usernameContainerView.backgroundColor = .clear
        
        usernameFieldWithBorder.layer.cornerRadius = 22
        usernameFieldWithBorder.backgroundColor = .clear
        usernameFieldWithBorder.layer.borderWidth = 1
        usernameFieldWithBorder.layer.borderColor = UIColor.white.cgColor
        usernameFieldWithBorder.isHidden = true
        
        usernameTextField.placeholder = "Email"
        usernameTextField.backgroundColor = .white
        usernameTextField.layer.opacity = 0.3
        usernameTextField.layer.cornerRadius = 22
        usernameTextField.setLeftPadding(spacing: 20.0)
        
        passFieldWithBorder.layer.cornerRadius = 22
        passFieldWithBorder.backgroundColor = .clear
        passFieldWithBorder.layer.borderWidth = 1
        passFieldWithBorder.layer.borderColor = UIColor.white.cgColor
        passFieldWithBorder.isHidden = true
        
        passTextField.placeholder = "Password"
        passTextField.backgroundColor = .white
        passTextField.layer.opacity = 0.3
        passTextField.layer.cornerRadius = 22
        passTextField.setLeftPadding(spacing: 20)
        passTextField.isSecureTextEntry = true
        
        loginButton.setupButton(title: "Login", opacity: 0.6)
        
        visibilityBtn.setImage(UIImage(named: "visibility_24px")!, for: .normal)
    }
    
    func setupLayout() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 40.0)])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([stackView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 170.0),
                                     stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32.0),
                                     stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32.0)])
        
        usernameContainerView.translatesAutoresizingMaskIntoConstraints = false
        usernameContainerView.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([usernameTextField.topAnchor.constraint(equalTo: self.usernameContainerView.topAnchor),
                                     usernameTextField.leadingAnchor.constraint(equalTo: self.usernameContainerView.leadingAnchor),
                                     usernameTextField.trailingAnchor.constraint(equalTo: self.usernameContainerView.trailingAnchor),
                                     usernameTextField.bottomAnchor.constraint(equalTo: self.usernameContainerView.bottomAnchor)])
        
        usernameFieldWithBorder.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([usernameFieldWithBorder.topAnchor.constraint(equalTo: self.usernameContainerView.topAnchor),
                                     usernameFieldWithBorder.leadingAnchor.constraint(equalTo: self.usernameContainerView.leadingAnchor),
                                     usernameFieldWithBorder.trailingAnchor.constraint(equalTo: self.usernameContainerView.trailingAnchor),
                                     usernameFieldWithBorder.bottomAnchor.constraint(equalTo: self.usernameContainerView.bottomAnchor)])
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.heightAnchor.constraint(equalTo: self.usernameContainerView.heightAnchor).isActive = true
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.heightAnchor.constraint(equalTo: self.usernameContainerView.heightAnchor).isActive = true
        
        passTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([passTextField.topAnchor.constraint(equalTo: self.containerView.topAnchor),
                                     passTextField.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor),
                                     passTextField.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor),
                                     passTextField.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor)])
        
        visibilityBtn.translatesAutoresizingMaskIntoConstraints = false
        visibilityBtn.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -22.0).isActive = true
        visibilityBtn.centerYAnchor.constraint(equalTo: self.containerView.centerYAnchor).isActive = true
        
        passFieldWithBorder.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([passFieldWithBorder.topAnchor.constraint(equalTo: self.containerView.topAnchor),
                                     passFieldWithBorder.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor),
                                     passFieldWithBorder.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor),
                                     passFieldWithBorder.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor)])
    }
}


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
        addSubview(titleLabel)
        addSubview(usernameContainerView)
        addSubview(containerView)
        addSubview(loginButton)
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
        titleLabel.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        
        usernameContainerView.backgroundColor = .clear
        
        usernameFieldWithBorder.layer.cornerRadius = 22
        usernameFieldWithBorder.backgroundColor = .clear
        usernameFieldWithBorder.layer.borderWidth = 1
        usernameFieldWithBorder.layer.borderColor = UIColor.white.cgColor
        usernameFieldWithBorder.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        usernameFieldWithBorder.alpha = 0
        usernameFieldWithBorder.isHidden = true
        
        usernameTextField.placeholder = "Email"
        usernameTextField.backgroundColor = .white
        usernameTextField.layer.opacity = 0
        usernameTextField.layer.cornerRadius = 22
        usernameTextField.setLeftPadding(spacing: 20.0)
        
        passFieldWithBorder.layer.cornerRadius = 22
        passFieldWithBorder.backgroundColor = .clear
        passFieldWithBorder.layer.borderWidth = 1
        passFieldWithBorder.layer.borderColor = UIColor.white.cgColor
        passFieldWithBorder.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        passFieldWithBorder.alpha = 0
        passFieldWithBorder.isHidden = true
        
        passTextField.placeholder = "Password"
        passTextField.backgroundColor = .white
        passTextField.layer.opacity = 0
        passTextField.layer.cornerRadius = 22
        passTextField.setLeftPadding(spacing: 20)
        passTextField.isSecureTextEntry = true
        
        loginButton.setupButton(title: "Login", opacity: 0)
        
        visibilityBtn.setImage(UIImage(named: "visibility_24px")!, for: .normal)
        visibilityBtn.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        visibilityBtn.alpha = 0
    }
    
    func setupLayout() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 40.0)])
        
        usernameContainerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            usernameContainerView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 170),
            usernameContainerView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            usernameContainerView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.85),
            usernameContainerView.heightAnchor.constraint(equalToConstant: 44.0)])
        
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: self.usernameContainerView.topAnchor),
            usernameTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -400),
            usernameTextField.widthAnchor.constraint(equalTo: self.usernameContainerView.widthAnchor),
            usernameTextField.heightAnchor.constraint(equalToConstant: 44.0)])
        
        usernameFieldWithBorder.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            usernameFieldWithBorder.topAnchor.constraint(equalTo: self.usernameContainerView.topAnchor),
            usernameFieldWithBorder.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            usernameFieldWithBorder.widthAnchor.constraint(equalTo: self.usernameContainerView.widthAnchor),
            usernameFieldWithBorder.heightAnchor.constraint(equalToConstant: 44.0)])

        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.usernameContainerView.bottomAnchor, constant: 18),
            containerView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            containerView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.85),
            containerView.heightAnchor.constraint(equalToConstant: 44.0)])
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: 18),
            loginButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.85),
            loginButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -400),
            loginButton.heightAnchor.constraint(equalTo: self.usernameContainerView.heightAnchor)])
        
        passTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passTextField.topAnchor.constraint(equalTo: self.containerView.topAnchor),
            passTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -400),
            passTextField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.85),
            passTextField.heightAnchor.constraint(equalToConstant: 44.0)])
        
        visibilityBtn.translatesAutoresizingMaskIntoConstraints = false
        visibilityBtn.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -22.0).isActive = true
        visibilityBtn.centerYAnchor.constraint(equalTo: self.containerView.centerYAnchor).isActive = true
        
        passFieldWithBorder.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passFieldWithBorder.topAnchor.constraint(equalTo: self.containerView.topAnchor),
            passFieldWithBorder.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            passFieldWithBorder.widthAnchor.constraint(equalTo: self.containerView.widthAnchor),
            passFieldWithBorder.heightAnchor.constraint(equalToConstant: 44.0)])
    }
    
    func animateViewElementsIn() {
        UIView.animate(withDuration: 1.45, delay: 0,options: .curveEaseOut, animations: {
            self.usernameTextField.transform = CGAffineTransform(translationX: 400, y: 0)
            self.usernameTextField.layer.opacity = 0.3
        }) { _ in
        }
        
        
        UIView.animate(withDuration: 1.45, delay: 0.55,options: .curveEaseOut, animations: {
            self.passTextField.transform = CGAffineTransform(translationX: 400, y: 0)
            self.passTextField.layer.opacity = 0.3
        }) { _ in
        }
        
        UIView.animate(withDuration: 1.45, delay: 1.10,options: .curveEaseOut, animations: {
            self.loginButton.transform = CGAffineTransform(translationX: 400, y: 0)
            self.loginButton.layer.opacity = 0.6
        }) { _ in
        }
        
        UIView.animate(withDuration: 0.79, delay: 1.5, animations: {
            self.titleLabel.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.titleLabel.alpha = 1
            self.visibilityBtn.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.visibilityBtn.alpha = 1
            self.usernameFieldWithBorder.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.usernameFieldWithBorder.alpha = 1
            self.passFieldWithBorder.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.passFieldWithBorder.alpha = 1
        }) { _ in
        }
    }
    
    func animateViewElementsOut() {
        UIView.animate(withDuration: 1.8, delay: 0,options: .curveEaseOut, animations: {
            self.usernameTextField.transform = CGAffineTransform(translationX: 400, y: -300)
            self.usernameTextField.layer.opacity = 0.3
        }) { _ in
        }
        
        
        UIView.animate(withDuration: 1.8, delay: 0.55,options: .curveEaseOut, animations: {
            self.passTextField.transform = CGAffineTransform(translationX: 400, y: -400)
            self.passTextField.layer.opacity = 0.3
        }) { _ in
        }
        
        UIView.animate(withDuration: 1.8, delay: 1.10,options: .curveEaseOut, animations: {
            self.loginButton.transform = CGAffineTransform(translationX: 400, y: -500)
            self.loginButton.layer.opacity = 0.6
        }) { _ in
        }
        
        UIView.animate(withDuration: 0.5, delay: 0, animations: {
            self.titleLabel.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
            self.titleLabel.alpha = 0
            self.visibilityBtn.transform = CGAffineTransform(scaleX: 0.1, y: 0.01)
            self.visibilityBtn.alpha = 0
            self.usernameFieldWithBorder.alpha = 0
            self.passFieldWithBorder.alpha = 0
        }) { _ in
        }
    }
}


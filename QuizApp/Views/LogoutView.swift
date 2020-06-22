//
//  LogoutView.swift
//  QuizApp
//
//  Created by Domagoj Kolaric on 22/06/2020.
//  Copyright © 2020 Domagoj Kolaric. All rights reserved.
//

import Foundation
import UIKit

class LogoutView: UIView {
    
    let user = UILabel()
    let username = UILabel()
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
        self.addSubview(user)
        self.addSubview(username)
        self.addSubview(logoutButton)
    }
    
    func setupStyleOfSubviews() {
        user.text = "Username: "
        user.textColor = .white
        user.font = UIFont(name: "Arial", size: 16)
        
        username.textColor = .white
        username.font = UIFont(name: "Arial", size: 20)
        username.textAlignment = .left
        
        logoutButton.setupButton(title: "Logout", opacity: 1)
        logoutButton.isHidden = false
    }
    
    func setupLayout() {
        user.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            user.topAnchor.constraint(equalTo: self.topAnchor, constant: 70),
            user.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20)])
        
        username.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            username.topAnchor.constraint(equalTo: self.user.bottomAnchor, constant: 20),
            username.leadingAnchor.constraint(equalTo: self.user.leadingAnchor),
            username.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)])
        
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoutButton.heightAnchor.constraint(equalToConstant: 45),
            logoutButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            logoutButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            logoutButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100)])
    }
}

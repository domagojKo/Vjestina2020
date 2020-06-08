//
//  LogoutTableViewFooter.swift
//  QuizApp
//
//  Created by Domagoj Kolaric on 08/06/2020.
//  Copyright © 2020 Domagoj Kolaric. All rights reserved.
//

import UIKit

class LogoutTableViewFooter: UIView {
    
    let logoutButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(logoutButton)
        self.setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupButton() {
        logoutButton.setupButton(title: "Logout", opacity: 1)
        logoutButton.isHidden = false
        
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoutButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            logoutButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            logoutButton.heightAnchor.constraint(equalToConstant: 45),
            logoutButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            logoutButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
        ])
    }
}

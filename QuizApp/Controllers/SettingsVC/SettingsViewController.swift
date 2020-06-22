//
//  SettingsViewController.swift
//  QuizApp
//
//  Created by Domagoj Kolaric on 12/05/2020.
//  Copyright © 2020 Domagoj Kolaric. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let logoutView = LogoutView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setBackgroundColor()
        self.setupLogoutView()
        
        logoutView.logoutButton.addTarget(self, action: #selector(onLogoutTapped), for: .touchUpInside)
    }
    
    func setupLogoutView() {
        self.view.addSubview(logoutView)
        
        logoutView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoutView.topAnchor.constraint(equalTo: self.view.topAnchor),
            logoutView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            logoutView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            logoutView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)])
        
        guard let username = UserDefaults.standard.string(forKey: "username") else { return }
        
        logoutView.username.text = username
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @objc
    func onLogoutTapped(_ sender: UIButton) {
        UserDefaults.standard.set(nil, forKey: "token")
        UserDefaults.standard.set(nil, forKey: "id")
        UserDefaults.standard.set(nil, forKey: "username")
        
        self.presentLoginVC()
    }
    
}

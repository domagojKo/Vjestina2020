//
//  ViewController.swift
//  QuizApp
//
//  Created by Domagoj Kolaric on 25/04/2020.
//  Copyright © 2020 Domagoj Kolaric. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    let loginView = LoginView()
    
    var passField: UITextField {
        return loginView.passTextField
    }
    
    var userField: UITextField {
        return loginView.usernameTextField
    }
    
    var loginButton: UIButton {
        return loginView.loginButton
    }
    
    var nameFieldCheck = false {
        didSet {
            correctInputs = nameFieldCheck && passCheck
        }
    }
    
    var passCheck = false {
        didSet {
            correctInputs = nameFieldCheck && passCheck
        }
    }
    
    var correctInputs = false {
        didSet {
            loginButton.isEnabled = correctInputs
            loginButton.alpha = correctInputs ? 1.0 : 0.6
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(loginView)
        
        self.setBackgroundColor()
        
        self.setupLogin()
        
        passField.delegate = self
        userField.delegate = self
    }
    
    @objc
    func onLoginAction(_ sender: UIButton) {
        guard let username = userField.text else { return }
        
        guard let pass = passField.text else { return }
        
        self.fetchingToken(username: username, password: pass)
    }
    
    func fetchingToken(username: String, password: String) {
        LoginAPI.instance.fetchToken(username: username, password: password) { data, error in
            if let err = error {
                DispatchQueue.main.async {
                    self.showAlert(description: err.localizedDescription)
                }
                return
            }
            guard let token = data else { return }
            
            UserDefaults.standard.setValue(token.token, forKey: "token")
            UserDefaults.standard.setValue(token.id, forKey: "id")
            
            DispatchQueue.main.async {
                UserDefaults.standard.set(self.userField.text ?? "", forKey: "username")
                self.presentTabBar()
            }
        }
    }
    
    @objc
    func onVisibility(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            passField.isSecureTextEntry = false
        } else {
            passField.isSecureTextEntry = true
        }
    }
    
    @objc
    func checkPassword() {
        guard let pass = passField.text, pass.count == 10 else {
            passCheck = false
            return
        }
        passCheck = true
    }
    
    @objc
    func checkUsername() {
        guard let user = userField.text, user.count == 10 else {
            nameFieldCheck = false
            return
        }
        nameFieldCheck = true
    }
    
    deinit {
        print("Deinit")
    }
}

extension LoginViewController {
    func setupLogin() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        loginView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            loginView.topAnchor.constraint(equalTo: self.view.topAnchor),
            loginView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        let dismissKeyboard = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        
        self.view.addGestureRecognizer(dismissKeyboard)
        
        loginButton.isEnabled = false
        
        loginButton.addTarget(self, action: #selector(onLoginAction), for: .touchUpInside)
        loginView.visibilityBtn.addTarget(self, action: #selector(onVisibility), for: .touchUpInside)
        
        userField.addTarget(self, action: #selector(checkUsername), for: .editingChanged)
        passField.addTarget(self, action: #selector(checkPassword), for: .editingChanged)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == userField {
            loginView.usernameFieldWithBorder.isHidden = false
            loginView.passFieldWithBorder.isHidden = true
        } else if textField == passField {
            loginView.usernameFieldWithBorder.isHidden = true
            loginView.passFieldWithBorder.isHidden = false
        }
    }
}

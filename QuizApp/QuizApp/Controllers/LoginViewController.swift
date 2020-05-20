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

        loginView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            loginView.topAnchor.constraint(equalTo: self.view.topAnchor),
            loginView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
            ])
        
        passField.delegate = self
        userField.delegate = self
        
        let dismissKeyboard = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        
        self.view.addGestureRecognizer(dismissKeyboard)
        
        loginButton.isEnabled = false
        
        loginButton.addTarget(self, action: #selector(onLoginAction), for: .touchUpInside)
        loginView.visibilityBtn.addTarget(self, action: #selector(onVisibility), for: .touchUpInside)
        
        userField.addTarget(self, action: #selector(checkUsername), for: .editingChanged)
        passField.addTarget(self, action: #selector(checkPassword), for: .editingChanged)
    }
    
    @objc
    func onLoginAction(_ sender: UIButton) {
        guard let username = userField.text else { return }
        
        guard let pass = passField.text else { return }
        
        LoginAPI.instance.fetchToken(username: username, password: pass) { data, error in
            guard error == nil else {
                if let err = error {
                    DispatchQueue.main.async {
                        self.showAlert(description: err.localizedDescription)
                    }
                }
                return
            }
            
            guard let token = data else { return }
            
            UserDefaults.standard.setValue(token.token, forKey: "token")
            UserDefaults.standard.setValue(token.id, forKey: "id")

            DispatchQueue.main.async {
                let vc = QuizViewController()
                self.dismiss(animated: true, completion: nil)
                self.present(vc, animated: true, completion: nil)
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

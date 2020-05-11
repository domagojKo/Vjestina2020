//
//  UIViewControllerExtension.swift
//  QuizApp
//
//  Created by Domagoj Kolaric on 05/05/2020.
//  Copyright © 2020 Domagoj Kolaric. All rights reserved.
//

import UIKit

extension UIViewController {
    func setBackgroundColor() {
        let colorTop =  UIColor(red: 116.0/255.0, green: 79.0/255.0, blue: 103.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 39.0/255.0, green: 47.0/255.0, blue: 118.0/255.0, alpha: 1.0).cgColor

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [colorTop, colorBottom]

        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func showAlert(description: String) {
        let alertController = UIAlertController(title: "Login error!", message: description, preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        self.present(alertController, animated: true, completion: nil)
    }
}

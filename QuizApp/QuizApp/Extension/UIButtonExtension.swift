//
//  UIButtonExtension.swift
//  QuizApp
//
//  Created by Domagoj Kolaric on 10/05/2020.
//  Copyright © 2020 Domagoj Kolaric. All rights reserved.
//

import UIKit

extension UIButton {
    func setupButton(title: String, opacity: Float) {
        self.backgroundColor = .white
        self.setTitleColor(UIColor(red: 99.0 / 255.0, green: 41.0 / 255.0, blue: 222.0 / 255.0, alpha: 1.0), for: .normal)
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = UIFont(name: "Arial", size: 16.0)
        self.layer.opacity = opacity
        self.layer.cornerRadius = 22
    }
}

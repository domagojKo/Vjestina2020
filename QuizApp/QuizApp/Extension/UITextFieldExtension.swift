//
//  UITextFieldExtension.swift
//  QuizApp
//
//  Created by Domagoj Kolaric on 05/05/2020.
//  Copyright © 2020 Domagoj Kolaric. All rights reserved.
//

import UIKit

extension UITextField {
    func setLeftPadding(spacing: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}

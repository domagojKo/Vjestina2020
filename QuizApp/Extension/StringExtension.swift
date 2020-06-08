//
//  UIColorExtension.swift
//  QuizApp
//
//  Created by Domagoj Kolaric on 08/06/2020.
//  Copyright © 2020 Domagoj Kolaric. All rights reserved.
//

import UIKit

extension String {
    func setupColorForCategory() -> UIColor {
        switch self {
        case "SPORTS":
            return UIColor(red:0.1, green:0.54, blue:0.1, alpha:1.0)
        case "SCIENCE":
            return UIColor(red:0.1, green:0.1, blue:0.54, alpha:1.0)
        default:
            return UIColor.black
        }
    }
}

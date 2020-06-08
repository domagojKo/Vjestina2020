//
//  QuizzesTableSectionHeader.swift
//  QuizApp
//
//  Created by Domagoj Kolaric on 08/06/2020.
//  Copyright © 2020 Domagoj Kolaric. All rights reserved.
//

import UIKit

class QuizzesTableSectionHeader: UIView {
    
    let categoryLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        self.addSubview(categoryLabel)
        self.setupLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLabel() {
        categoryLabel.font = UIFont(name: "Arial", size: 16)
        categoryLabel.numberOfLines = 0
        
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            categoryLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            categoryLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            categoryLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20)
        ])
    }
    
    func setupTitleForHeader(category: String) {
        self.categoryLabel.text = category
        self.categoryLabel.textColor = category.setupColorForCategory()
    }
}

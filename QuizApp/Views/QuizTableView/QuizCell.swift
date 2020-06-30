//
//  QuizCell.swift
//  QuizApp
//
//  Created by Domagoj Kolaric on 08/06/2020.
//  Copyright © 2020 Domagoj Kolaric. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class QuizCell: UITableViewCell {
    
    static let quizCellIdentifier = "QuizTableViewCell"
    
    let mainContainerView = UIView()
    let containerView = UIView()
    let titleLabel = UILabel()
    let quizImageView = UIImageView()
    let descriptionLabel = UILabel()
    let quizDifficultyLvlLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.titleLabel.text = ""
        self.descriptionLabel.text = ""
        self.quizDifficultyLvlLabel.text = ""
    }
    
    func setupViews() {
        self.addSubviews()
        self.setupStyleOfSubviews()
        self.setupLayout()
    }
    
    func addSubviews() {
        self.addSubview(mainContainerView)
        self.addSubview(containerView)
        self.addSubview(titleLabel)
        self.addSubview(quizImageView)
        self.addSubview(descriptionLabel)
        self.addSubview(quizDifficultyLvlLabel)
    }
    
    func setupStyleOfSubviews() {
        self.backgroundColor = .clear
        
        containerView.backgroundColor = .white
        containerView.alpha = 0.3
        containerView.layer.cornerRadius = 10
        
        titleLabel.font = UIFont(name: "Arial", size: 20)
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 0
        
        descriptionLabel.font = UIFont(name: "Arial", size: 14)
        descriptionLabel.textColor = .white
        descriptionLabel.numberOfLines = 0
        
        quizImageView.contentMode = .scaleAspectFill
        quizImageView.clipsToBounds = true
        quizImageView.layer.cornerRadius = 10
        
        quizDifficultyLvlLabel.font = UIFont.systemFont(ofSize: 20)
    }
    
    func setupLayout() {
        mainContainerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainContainerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            mainContainerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            mainContainerView.topAnchor.constraint(equalTo: self.topAnchor),
            mainContainerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            mainContainerView.heightAnchor.constraint(equalToConstant: 140)
        ])
        
        quizImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            quizImageView.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 7),
            quizImageView.heightAnchor.constraint(equalToConstant: 90),
            quizImageView.widthAnchor.constraint(equalToConstant: 90),
            quizImageView.centerYAnchor.constraint(equalTo: self.containerView.centerYAnchor)
        ])
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.mainContainerView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.mainContainerView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.mainContainerView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.mainContainerView.trailingAnchor)
        ])
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 120)
        ])
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.titleLabel.trailingAnchor)
        ])
        
        quizDifficultyLvlLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            quizDifficultyLvlLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            quizDifficultyLvlLabel.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -10),
            quizDifficultyLvlLabel.heightAnchor.constraint(equalToConstant: 20)])
    }
}

extension QuizCell {
    func setupQuizzCell(quiz: Quizz) {
        self.titleLabel.text = quiz.title
        self.descriptionLabel.text = quiz.descriptionn
        self.quizDifficultyLvlLabel.text = String(repeating: "✩", count: Int(quiz.level))
        
        if let url = quiz.image,
            let imageURL = URL(string: url) {
            self.quizImageView.kf.setImage(with: imageURL)
        }
    }
}

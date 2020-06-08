//
//  QuizView.swift
//  QuizApp
//
//  Created by Domagoj Kolaric on 08/06/2020.
//  Copyright © 2020 Domagoj Kolaric. All rights reserved.
//

import UIKit

class QuizView: UIView {
    let containerView = UIView()
    let titleLabel = UILabel()
    let imageView = UIImageView()
    let descriptionLabel = UILabel()
    let startQuizButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Has to be implemented as it is required but will never be used")
    }
    
    func setupViews() {
        self.addSubviews()
        self.setupStyleOfSubviews()
        self.setupLayout()
    }
    
    func addSubviews() {
        self.addSubview(containerView)
        self.addSubview(titleLabel)
        self.addSubview(imageView)
        self.addSubview(descriptionLabel)
        self.addSubview(startQuizButton)
    }
    
    func setupStyleOfSubviews() {
        self.backgroundColor = .clear
        
        containerView.backgroundColor = .white
        containerView.alpha = 0.3
        containerView.layer.cornerRadius = 10
        
        titleLabel.font = UIFont(name: "Arial", size: 20)
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        
        descriptionLabel.font = UIFont(name: "Arial", size: 14)
        descriptionLabel.textColor = .white
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        
        startQuizButton.setupButton(title: "Start Quiz", opacity: 1)
    }
    
    func setupLayout() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -20),
            titleLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 20)
        ])
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.titleLabel.trailingAnchor)
        ])
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -10),
            imageView.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: 10),
            imageView.bottomAnchor.constraint(equalTo: self.startQuizButton.topAnchor, constant: -20)
        ])
        
        startQuizButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            startQuizButton.leadingAnchor.constraint(equalTo: self.imageView.leadingAnchor),
            startQuizButton.trailingAnchor.constraint(equalTo: self.imageView.trailingAnchor),
            startQuizButton.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: -20),
            startQuizButton.heightAnchor.constraint(equalToConstant: 45)])
    }
    
    func setupQuizView(quiz: Quiz){
        self.titleLabel.text = quiz.title
        self.descriptionLabel.text = quiz.description
        
        if let url = quiz.image,
            let imageURL = URL(string: url) {
            self.imageView.kf.setImage(with: imageURL)
        }
    }
}

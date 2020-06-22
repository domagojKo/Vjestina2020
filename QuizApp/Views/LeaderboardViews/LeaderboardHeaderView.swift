//
//  LeaderboardTopView.swift
//  QuizApp
//
//  Created by Domagoj Kolaric on 20/06/2020.
//  Copyright © 2020 Domagoj Kolaric. All rights reserved.
//

import UIKit

class LeaderboardHeaderView: UIView {
    
    let playerLabel = UILabel()
    let pointsLabel = UILabel()

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
        self.addSubview(playerLabel)
        self.addSubview(pointsLabel)
    }
    
    func setupStyleOfSubviews() {
        self.playerLabel.textColor = .white
        self.playerLabel.font = UIFont(name: "Arial", size: 12)
        self.playerLabel.numberOfLines = 0
        self.playerLabel.text = "Number"
        
        self.pointsLabel.textColor = .white
        self.pointsLabel.font = UIFont(name: "Arial", size: 12)
        self.pointsLabel.numberOfLines = 0
        self.pointsLabel.text = "Points"
    }
    
    func setupLayout() {
        playerLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            playerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            playerLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)])
        
        pointsLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pointsLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            pointsLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)])
    }
}

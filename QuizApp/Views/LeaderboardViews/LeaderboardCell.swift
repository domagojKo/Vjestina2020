//
//  LeaderboardCell.swift
//  QuizApp
//
//  Created by Domagoj Kolaric on 20/06/2020.
//  Copyright © 2020 Domagoj Kolaric. All rights reserved.
//

import UIKit
import PureLayout

class LeaderboardCell: UITableViewCell {
    
    static let leaderboardCellIdentifier = "LeaderBoardTableViewCell"
    
    let userNmb = UILabel()
    let userName = UILabel()
    let userPoints = UILabel()
    let bottomLine = UIView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.userNmb.text = ""
        self.userName.text = ""
        self.userPoints.text = ""
    }
    
    func setupViews() {
        self.addSubviews()
        self.setupStyleOfSubviews()
        self.setupLayout()
    }
    
    func addSubviews() {
        self.addSubview(userNmb)
        self.addSubview(userName)
        self.addSubview(userPoints)
        self.addSubview(bottomLine)
    }
    
    func setupStyleOfSubviews() {
        self.backgroundColor = .clear
        
        userNmb.textColor = .white
        userNmb.font = UIFont(name: "Arial", size: 16)
        userNmb.numberOfLines = 0
        
        userName.textColor = .white
        userName.font = UIFont(name: "Arial", size: 16)
        userName.numberOfLines = 0
        
        userPoints.textColor = .white
        userPoints.font = UIFont(name: "Arial", size: 18)
        userPoints.numberOfLines = 0
        
        bottomLine.backgroundColor = .white
        bottomLine.alpha = 0.3
    }
    
    func setupLayout() {
        userNmb.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userNmb.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            userNmb.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20)])
        
        userName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userName.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            userName.leadingAnchor.constraint(equalTo: self.userNmb.trailingAnchor, constant: 20)])
        
        userPoints.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userPoints.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            userPoints.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)])
        
        bottomLine.autoSetDimension(.height, toSize: 1)
        bottomLine.autoPinEdge(toSuperviewEdge: .leading)
        bottomLine.autoPinEdge(toSuperviewEdge: .trailing)
        bottomLine.autoPinEdge(toSuperviewEdge: .top)
    }
}

extension LeaderboardCell {
    func setupRankingCell(rank: Rank, index: Int) {
        guard let score = Double(rank.score ?? "") else { return }
        self.userPoints.text = String(format: "%.2f", score)
        self.userNmb.text = "\(index + 1)."
        self.userName.text = rank.username
    }
}

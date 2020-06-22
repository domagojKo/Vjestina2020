//
//  LeaderboardVC.swift
//  QuizApp
//
//  Created by Domagoj Kolaric on 20/06/2020.
//  Copyright © 2020 Domagoj Kolaric. All rights reserved.
//

import UIKit
import PureLayout

class LeaderboardVC: UIViewController {
    
    var didSetupConstraints = false
    let tableView = UITableView()
    var headerView: LeaderboardHeaderView!
    
    var rank: Int?
    
    var usersRank = [Rank]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Leaderboard"
        
        self.setBackgroundColor()
        self.setupTableView()
        self.getRankingData()
    }
    
    func setupTableView() {
        self.view.addSubview(tableView)
        
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.allowsSelection = false
        
        tableView.register(LeaderboardCell.self, forCellReuseIdentifier: LeaderboardCell.leaderboardCellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        headerView = LeaderboardHeaderView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
        tableView.tableHeaderView = headerView
    }
    
    func getRankingData() {
        guard let rank = rank else { return }
        
        QuizAPI.instance.fetchRank(quizId: rank) { [weak self] data, error in
            guard let self = self else { return }
            
            if let err = error {
                print("Problem with fetching data: \(err.localizedDescription)")
                return
            }
            
            guard let ranks = data else { return }
            
            self.firstTwentyInRank(ranks: ranks)
        }
    }
    
    func firstTwentyInRank(ranks: [Rank]) {
        let sortedRank = ranks.sorted { Double($0.score ?? "0") ?? 0 > Double($1.score ?? "0") ?? 0}.prefix(20)
        self.usersRank = Array(sortedRank)
    }
}

extension LeaderboardVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersRank.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LeaderboardCell.leaderboardCellIdentifier,
                                                 for: indexPath) as! LeaderboardCell
        
        let userRank = usersRank[indexPath.row]
        
        cell.setupRankingCell(rank: userRank, index: indexPath.row)
        
        return cell
    }
}

extension LeaderboardVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

//
//  SearchBarView.swift
//  QuizApp
//
//  Created by Domagoj Kolaric on 22/06/2020.
//  Copyright © 2020 Domagoj Kolaric. All rights reserved.
//

import Foundation
import UIKit

class SearchBarView: UIView {
    
    let searchBarTF = UITextField()
    let searchBarContainer = UIView()
    let searchBarBorderView = UIView()
    let searchBtn = UIButton()
    
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
        self.addSubview(searchBtn)
        self.addSubview(searchBarContainer)
        self.searchBarContainer.addSubview(searchBarTF)
        self.searchBarContainer.addSubview(searchBarBorderView)
    }
    
    func setupStyleOfSubviews() {
        searchBarContainer.backgroundColor = .clear
        
        searchBarBorderView.layer.cornerRadius = 22
        searchBarBorderView.backgroundColor = .clear
        searchBarBorderView.layer.borderWidth = 1
        searchBarBorderView.layer.borderColor = UIColor.white.cgColor
        searchBarBorderView.isHidden = true
        
        searchBarTF.placeholder = "Type here"
        searchBarTF.backgroundColor = .white
        searchBarTF.layer.opacity = 0.3
        searchBarTF.layer.cornerRadius = 22
        searchBarTF.setLeftPadding(spacing: 20.0)
        
        searchBtn.setTitle("Search", for: .normal)
        searchBtn.setTitleColor(.white, for: .normal)
        searchBtn.titleLabel?.font = UIFont(name: "Arial", size: 16)
    }
    
    func setupLayout() {
        searchBarContainer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchBarContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            searchBarContainer.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            searchBarContainer.trailingAnchor.constraint(equalTo: self.searchBtn.leadingAnchor, constant: -20),
            searchBarContainer.heightAnchor.constraint(equalToConstant: 44)])
        
        searchBarBorderView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchBarBorderView.topAnchor.constraint(equalTo: searchBarContainer.topAnchor),
            searchBarBorderView.leadingAnchor.constraint(equalTo: searchBarContainer.leadingAnchor),
            searchBarBorderView.trailingAnchor.constraint(equalTo: searchBarContainer.trailingAnchor),
            searchBarBorderView.bottomAnchor.constraint(equalTo: searchBarContainer.bottomAnchor)])
        
        searchBarTF.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchBarTF.topAnchor.constraint(equalTo: searchBarContainer.topAnchor),
            searchBarTF.leadingAnchor.constraint(equalTo: searchBarContainer.leadingAnchor),
            searchBarTF.trailingAnchor.constraint(equalTo: searchBarContainer.trailingAnchor),
            searchBarTF.bottomAnchor.constraint(equalTo: searchBarContainer.bottomAnchor)])
        
        searchBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchBtn.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            searchBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            searchBtn.heightAnchor.constraint(equalToConstant: 44)])
    }
}

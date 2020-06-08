//
//  SearchViewController.swift
//  QuizApp
//
//  Created by Domagoj Kolaric on 12/05/2020.
//  Copyright © 2020 Domagoj Kolaric. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setBackgroundColor()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

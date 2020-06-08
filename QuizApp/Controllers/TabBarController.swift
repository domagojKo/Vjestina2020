//
//  TabBarController.swift
//  QuizApp
//
//  Created by Domagoj Kolaric on 12/05/2020.
//  Copyright © 2020 Domagoj Kolaric. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        
//        if !userLoggedIn() {
//            let loginVC = LoginViewController()
//            let navController = UINavigationController(rootViewController: loginVC)
//            self.present(navController, animated: true, completion: nil)
//        }
        
        self.setupTabBarControllers()
    }
    
    func setupTabBarControllers() {
        let quizVC = QuizTableViewController()
        let quizNavController = UINavigationController(rootViewController: quizVC)
        quizNavController.tabBarItem = UITabBarItem(title: "Quiz", image: UIImage(named: "Frame 1"), tag: 1)
        
        let searchVC = SearchViewController()
        let seachNavController = UINavigationController(rootViewController: searchVC)
        seachNavController.tabBarItem = UITabBarItem(title: "Search", image: UIImage(named: "Frame 2"), tag: 2)
        
        let settingsVC = SettingsViewController()
        let settingsNavController = UINavigationController(rootViewController: settingsVC)
        settingsNavController.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(named: "Settings"), tag: 1)
        
        viewControllers = [quizNavController, seachNavController, settingsNavController]
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        tabBar.tintColor = .black
    }
    
    func userLoggedIn() -> Bool {
        return !(UserDefaults.standard.object(forKey: "token") == nil)
    }

}

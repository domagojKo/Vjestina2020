//
//  AppDelegate.swift
//  QuizApp
//
//  Created by Domagoj Kolaric on 25/04/2020.
//  Copyright © 2020 Domagoj Kolaric. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        if let window = window {
            let loginViewController = LoginViewController()
            let navController = UINavigationController(rootViewController: loginViewController)
            window.rootViewController = navController
            window.makeKeyAndVisible()
            
            if isUserLoggedIn() {
                let mainTabBarController = TabBarController()
                navController.pushViewController(mainTabBarController, animated: false)
            }
        }
        window?.makeKeyAndVisible()
        
        return true
    }
    
    func isUserLoggedIn() -> Bool {
        return !(UserDefaults.standard.object(forKey: "token") == nil)
    }
}


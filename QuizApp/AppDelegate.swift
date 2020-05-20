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
    
    var navigationController: UINavigationController?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        if let window = window {
            let loginVC = LoginViewController()
            window.rootViewController = loginVC
            window.makeKeyAndVisible()
            
            if userLoggedIn() {
                let tabBar = TabBarController()
                loginVC.present(tabBar, animated: true, completion: nil)
            }
        }
        return true
    }
    
    func userLoggedIn() -> Bool {
        return !(UserDefaults.standard.object(forKey: "token") == nil)
    }
    
    
}


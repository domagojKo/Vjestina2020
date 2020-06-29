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
        
        if !isUserLoggedIn() {
            let loginVC = LoginViewController()
            let navController = UINavigationController(rootViewController: loginVC)
            //self.present(navController, animated: true, completion: nil)
            window?.rootViewController = navController
            window?.makeKeyAndVisible()
        } else {
            let tabBarVC = TabBarController()
            window?.rootViewController = tabBarVC
            window?.makeKeyAndVisible()
        }
        
        return true
    }
    
    func isUserLoggedIn() -> Bool {
        return !(UserDefaults.standard.object(forKey: "token") == nil)
    }
}


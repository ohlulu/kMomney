//
//  AppDelegate.swift
//  kMoney
//
//  Created by ohlulu on 2019/4/14.
//  Copyright © 2019 ohlulu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        initialTheme()
        
        initialWindow()
        
        
        return true
    }
}

// MARK: Initail func

extension AppDelegate {
    
    func initialTheme() {
        UINavigationBar.appearance().titleTextAttributes = [
            .foregroundColor : UIColor.mainBlue,
            .font: UIFont.systemFont(ofSize: 24)
        ]
    }
    
    func initialWindow() {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let tabbar = DashboardTabBarController()
        
        window!.rootViewController = tabbar
        window!.makeKeyAndVisible()
    }
}


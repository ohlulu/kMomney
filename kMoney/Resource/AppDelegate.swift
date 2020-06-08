//
//  AppDelegate.swift
//  kMoney
//
//  Created by ohlulu on 2019/4/14.
//  Copyright © 2019 ohlulu. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        printDebug(documentsPath)
        
        initialUserDefault()
        
        initialIQKeyboard()
        
        RealmHelper.migration()
        
        RealmHelper.initial()
        
        initialWindow()
        
        return true
    }
}

// MARK: Initail func

extension AppDelegate {
    
    func initialWindow() {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let tabbar = DashboardTabBarController()
        
        window!.rootViewController = tabbar
        window!.makeKeyAndVisible()
    }
    
    func initialUserDefault() {
        let defaults = [
            "oprne": false
        ]
        
        UserDefaults.standard.register(defaults: defaults)
    }
    
    func initialIQKeyboard() {
        let manager = IQKeyboardManager.shared
        manager.enable = true
        manager.enableAutoToolbar = false
        manager.shouldResignOnTouchOutside = true
        manager.disabledDistanceHandlingClasses = [
            DetailViewController.self
        ]
    }
}


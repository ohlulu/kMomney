//
//  DashboardTabBarController.swift
//  kMoney
//
//  Created by ohlulu on 2019/4/14.
//  Copyright © 2019 ohlulu. All rights reserved.
//

import UIKit

class DashboardTabBarController: UITabBarController {
    
    // MARK: UI
    private lazy var allControllers: [UIViewController] = [
        reportVC, homeVC, settingVC
    ]
    private let reportVC = BaseNavigationController(rootVC: ReportViewController())
    private let homeVC = BaseNavigationController(rootVC: HomeViewController())
    private let settingVC = BaseNavigationController(rootVC: SettingViewController())
    
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialVCs()
        setupUI()
    }
}

// MARK: Setup UI methods

fileprivate extension DashboardTabBarController {
    
    func setupUI() {
        tabBar.tintColor = .white
        tabBar.barTintColor = .black
        tabBar.shadowImage = UIImage()
        tabBar.isTranslucent = false
    }
}

extension DashboardTabBarController {
    
    func initialVCs() {
        
        homeVC.tabBarItem
            = UITabBarItem(title: "Home", image: .home, selectedImage: nil)
        reportVC.tabBarItem
            = UITabBarItem(title: "財報", image: nil, selectedImage: nil)
        settingVC.tabBarItem
            = UITabBarItem(title: "設定", image: nil, selectedImage: nil)

        viewControllers = allControllers
        selectedIndex = 1
    }
}

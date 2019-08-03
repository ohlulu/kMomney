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
        tabBar.tintColor = .lavenderBlue
        tabBar.unselectedItemTintColor = .pureWhite
        tabBar.barTintColor = .black90
        tabBar.shadowImage = UIImage()
        tabBar.isTranslucent = false
    }
}

extension DashboardTabBarController {
    
    func initialVCs() {
        homeVC.tabBarItem
            = UITabBarItem(title: "錢呢", image: .home, selectedImage: .home)
        reportVC.tabBarItem
            = UITabBarItem(title: "財報", image: .report, selectedImage: .report)
        settingVC.tabBarItem
            = UITabBarItem(title: "設定", image: .setting, selectedImage: .setting)
        viewControllers = allControllers
        selectedIndex = 1
        
    }
}

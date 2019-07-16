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
    
    let homeVC = HomeViewController()
    
    let reportVC = ReportViewController()
    
    let settingVC = SettingViewController()
    
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
        tabBar.tintColor = .mainBlue
    }
}

extension DashboardTabBarController {
    
    func initialVCs() {
        
        let vc1 = BaseNavigationController(rootVC: homeVC)
        let vc2 = BaseNavigationController(rootVC: reportVC)
        let vc3 = BaseNavigationController(rootVC: settingVC)
        vc1.tabBarItem
            = UITabBarItem(title: "總覽", image: nil, selectedImage: nil)
        vc2.tabBarItem
            = UITabBarItem(title: "財報", image: nil, selectedImage: nil)
        vc3.tabBarItem
            = UITabBarItem(title: "設定", image: nil, selectedImage: nil)
        viewControllers = [
            vc1, vc2, vc3
        ]

    }
}

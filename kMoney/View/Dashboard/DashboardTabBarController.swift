//
//  DashboardTabBarController.swift
//  kMoney
//
//  Created by ohlulu on 2019/4/14.
//  Copyright © 2019 ohlulu. All rights reserved.
//

import UIKit

class DashboardTabBarController: UITabBarController {
    
    let overviewVC = OverviewViewController()
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
    
        button.setBackgroundImage(UIImage.add, for: .normal)
        view.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.top.equalTo(tabBar.snp.top).offset(10)
            make.centerX.equalToSuperview()
            make.size.equalTo(49)
        }
    }
}

extension DashboardTabBarController {
    
    func initialVCs() {
        
        let whiteVC = UIViewController()
        
        viewControllers = [
            BaseNavigationController(rootViewController: overviewVC),
            whiteVC,
            BaseNavigationController(rootViewController: settingVC)
        ]
        
        viewControllers?[0].tabBarItem
            = UITabBarItem(title: "總覽", image: nil, selectedImage: nil)
        
        viewControllers?[2].tabBarItem
            = UITabBarItem(title: "設定", image: nil, selectedImage: nil)
        
        tabBar.items?[1].isEnabled = false
    }
}

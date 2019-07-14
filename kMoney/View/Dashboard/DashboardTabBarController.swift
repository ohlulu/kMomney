//
//  DashboardTabBarController.swift
//  kMoney
//
//  Created by ohlulu on 2019/4/14.
//  Copyright © 2019 ohlulu. All rights reserved.
//

import UIKit

class DashboardTabBarController: UITabBarController {
    
    let reportVC = UIViewController()
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
        let vc1 = BaseNavigationController(rootViewController: reportVC)
        let vc2 = BaseNavigationController(rootViewController: settingVC)
        vc1.tabBarItem
            = UITabBarItem(title: "總覽", image: nil, selectedImage: nil)
        vc2.tabBarItem
            = UITabBarItem(title: "設定", image: nil, selectedImage: nil)
        viewControllers = [
            vc1,
            whiteVC,
            vc2
        ]
        
        tabBar.items?[1].isEnabled = false
    }
}

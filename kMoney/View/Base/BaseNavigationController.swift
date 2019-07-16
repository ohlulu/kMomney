//
//  BaseNavigationController.swift
//  kMoney
//
//  Created by ohlulu on 2019/4/14.
//  Copyright © 2019 ohlulu. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - UIGestureRecognizerDelegate

extension BaseNavigationController: UIGestureRecognizerDelegate {
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if viewControllers.count <= 1 {
            return false
        } else {
            return true
        }
    }
}

// MARK: Setup UI methods

fileprivate extension BaseNavigationController {
    func setupUI() {
        
        clearBarBackgroundColor()
        
        interactivePopGestureRecognizer?.delegate = self
        
        navigationBar.tintColor = .mainBlue
        navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.mainBlue
        ]
    }
}

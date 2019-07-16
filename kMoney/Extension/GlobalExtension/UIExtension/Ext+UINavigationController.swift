//
//  Ext+UINavigationController.swift
//  kMoney
//
//  Created by ohlulu on 2019/7/16.
//  Copyright © 2019 ohlulu. All rights reserved.
//

import UIKit

/*
 make shorter
 replace rootViewController to rootVC
 */
extension UINavigationController {
    
    convenience init(rootVC: UIViewController) {
        self.init(rootViewController: rootVC)
    }
}

/*
 make UI setting convenience
 */
extension UINavigationController {
    
    func clearBarBackgroundColor() {
        navigationBar.setBackgroundImage(UIColor.clear.createImage(), for: .default)
        
        navigationBar.shadowImage = UIColor.clear.createImage()
    }
}

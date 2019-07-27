//
//  TintColorExtension.swift
//  kMoney
//
//  Created by ohlulu on 2019/4/14.
//  Copyright © 2019 ohlulu. All rights reserved.
//

import UIKit


extension UIColor {
    
    static var white: UIColor {
        return UIColor.rgba(red: 251, green: 251, blue: 251)
    }
    
    static var black: UIColor {
        return UIColor.rgba(red: 37, green: 37, blue: 37)
    }

    static var pureBlack: UIColor {
        return UIColor.rgba(red: 0, green: 0, blue: 0)
    }
    
    static var lavenderBlue: UIColor {
        return UIColor.rgba(red: 125, green: 144, blue: 243)
    }
    
    static var charcoalGrey: UIColor {
        return UIColor.rgba(red: 49, green: 49, blue: 49)
    }
}

extension UIColor {
    
    struct Gradient {
        static var black: [UIColor] {
            return [
                UIColor.rgba(red: 74, green: 74, blue: 87),
                UIColor.rgba(red: 29, green: 29, blue: 37)
            ]
        }
        
        static var mainPurper: [UIColor] {
            return [
                UIColor.rgba(red: 134, green: 153, blue: 255),
                UIColor.rgba(red: 105, green: 127, blue: 245)
            ]
        }
    }
}

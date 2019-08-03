//
//  TintColorExtension.swift
//  kMoney
//
//  Created by ohlulu on 2019/4/14.
//  Copyright © 2019 ohlulu. All rights reserved.
//

import UIKit



// MARK: - Pure color
extension UIColor {
    static var pureBlack: UIColor {
        return UIColor.rgba(red: 0, green: 0, blue: 0)
    }
    
    static var pureWhite: UIColor {
        return UIColor.rgba(red: 255, green: 255, blue: 255)
    }
}


// MARK: - Custom color
extension UIColor {
    
    @nonobjc class var lavenderBlue: UIColor {
        return UIColor(red: 125.0 / 255.0, green: 144.0 / 255.0, blue: 243.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var charcoalGrey: UIColor {
        return UIColor(red: 49.0 / 255.0, green: 49.0 / 255.0, blue: 59.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var seafoamBlue: UIColor {
        return UIColor(red: 92.0 / 255.0, green: 200.0 / 255.0, blue: 202.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var gunmetal: UIColor {
        return UIColor(red: 74.0 / 255.0, green: 74.0 / 255.0, blue: 87.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var blueGrey: UIColor {
        return UIColor(red: 140.0 / 255.0, green: 140.0 / 255.0, blue: 164.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var cornflower: UIColor {
        return UIColor(red: 105.0 / 255.0, green: 127.0 / 255.0, blue: 245.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var black90: UIColor {
        return UIColor(white: 37.0 / 255.0, alpha: 0.9)
    }
}

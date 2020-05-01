//
//  ColorFactory.swift
//  kMoney
//
//  Created by ohlulu on 2019/4/14.
//  Copyright © 2019 ohlulu. All rights reserved.
//

import UIKit
import ChameleonFramework

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
    
    @nonobjc class var pinkishGrey: UIColor {
        return .rgba(red: 206, green: 206, blue: 206, alpha: 1)
    }
    
    @nonobjc class var background: UIColor {
        return .rgba(red: 48, green: 48, blue: 52, alpha: 1)
    }
    
    @nonobjc class var veryLightPink: UIColor {
        return .rgba(red: 222, green: 222, blue: 222, alpha: 1)
    }
    
    @nonobjc class var fromPurple: UIColor {
        return .rgba(red: 125, green: 129, blue: 222, alpha: 1)
    }
    
    @nonobjc class var toPurple: UIColor {
        return .rgba(red: 81, green: 90, blue: 211, alpha: 1)
    }
    
    class var detailTopColor: UIColor {
        return .init(gradientStyle: .topToBottom,
                     withFrame: .init(x: 0, y: 0, width: UIScreen.width, height: 180),
                     andColors: [.fromPurple, toPurple])
    }
}

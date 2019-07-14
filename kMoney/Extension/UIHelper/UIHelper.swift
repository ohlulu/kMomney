//
//  UIHelper.swift
//  kMoney
//
//  Created by ohlulu on 2019/4/14.
//  Copyright © 2019 ohlulu. All rights reserved.
//


import UIKit

enum APPFont {
    case spFont(size: CGFloat, weight: UIFont.Weight)
    
    var font: UIFont {
        switch self {
        case .spFont(let size, let weight):
            return UIFont(name: "courier-\(weight.weightName)", size: size)!
        }
    }
}

extension UIFont.Weight {
    var weightName: String {
        switch self {
        case .medium: return "Medium"
        case .regular: return "Regular"
        case .bold: return "Bold"
        case .semibold: return "Semibold"
        default:
            fatalError()
        }
    }
}

extension UILabel {
    
    // UILabel(style: [.spFont(18), .color: .textColor])
    // UILabel(font: .spFont(18), .color: .textColor)
    convenience init(font: APPFont = APPFont.spFont(size: 13, weight: .regular)) {
        self.init()
    }
    
}

//
//  KMFont.swift
//  kMoney
//
//  Created by ohlulu on 2019/7/16.
//  Copyright © 2019 ohlulu. All rights reserved.
//

import UIKit
import OhSwifter

enum KMFont {
    case text(Weight, CGFloat)
    case numbdr(Weight, CGFloat)
    
    var rawValue: UIFont {
        switch self {
        case .text(let weight, let size):
            return UIFont.systemFont(ofSize: size, weight: weight.uiFontWight)
        case .numbdr(let weight, let size):
            return UIFont.systemFont(ofSize: size, weight: weight.uiFontWight)
        }
    }
}

extension KMFont {
    enum Weight: String {
        case regular = "Regular"
        case medium = "Medium"
        case bold = "Bold"
        
        var uiFontWight: UIFont.Weight {
            switch self {
            case .regular: return .regular
            case .medium: return .medium
            case .bold: return .bold
            }
        }
    }
}

extension OhSwifter where Base: SwiftOriginFontExclamationMark {
    func kFont(_ font: KMFont) -> OhSwifter {
        base.font = font.rawValue
        return self
    }
}

extension OhSwifter where Base: SwiftOriginFontQuestionMark {
    func kFont(_ font: KMFont) -> OhSwifter {
        base.font = font.rawValue
        return self
    }
}

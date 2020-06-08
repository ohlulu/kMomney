//
//  ThanosButtonStyleTemplete.swift
//  iOS-UILib
//
//  Created by Teddy on 2020/3/5.
//  Copyright © 2020 GOONS. All rights reserved.
//

import Foundation

struct SaveButtonStyle: ThanosSettable {
    
    // default style
    var buttonStyles: [ButtonStyle] = [.fill, .text]
    var scale: CGFloat = 0.95
    
    // text style
    var textFont: UIFont = UIFont.systemFont(ofSize: 18, weight: .bold)
    var textNormalColor: UIColor = .white
    var textPressedColor: UIColor = UIColor.white.withAlphaComponent(0.8)
    
    
    var fillNormalColor: UIColor = .seafoamBlue
    var fillPressedColor: UIColor = UIColor.seafoamBlue.alpha(0.8)
    var fillDisableColor: UIColor? = .lightGray
}

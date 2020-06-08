//
//  CGRectExtension.swift
//  kMoney
//
//  Created by Ohlulu on 2020/5/1.
//  Copyright © 2020 ohlulu. All rights reserved.
//

import CoreGraphics

public extension CGRect {
    
    init(size: CGSize) {
        self.init(x: 0, y: 0, width: size.width, height: size.height)
    }

}

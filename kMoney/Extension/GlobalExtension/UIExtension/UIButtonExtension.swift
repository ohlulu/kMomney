//
//  ButtonProtocol.swift
//  Deloitte
//
//  Created by ohlulu on 2018/12/17.
//  Copyright © 2018 Goons. All rights reserved.
//

import UIKit

enum ButtonImagePosition {
    case right
}

extension UIButton {
    func setImagePosition(_ position: ButtonImagePosition) {
        switch position {
        case .right:
            setImagePositionToRight()
        }
    }
    
    func setImagePositionToRight() {
        layoutIfNeeded()
        guard let titleFrame = titleLabel?.frame,
            let imageFrame = imageView?.frame else {
            return
        }
        let space = titleFrame.minX - imageFrame.maxX
        
        self.imageEdgeInsets = UIEdgeInsets(
            top: 0,
            left: titleFrame.size.width + space,
            bottom: 0,
            right: -(titleFrame.size.width + space))
        
        self.titleEdgeInsets = UIEdgeInsets(
            top: 0,
            left: -(imageFrame.width + space),
            bottom: 0,
            right: imageFrame.width + space)
    }
}

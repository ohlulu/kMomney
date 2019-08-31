//
//  Temp.swift
//  kMoney
//
//  Created by ohlulu on 2019/8/20.
//  Copyright © 2019 ohlulu. All rights reserved.
//

import Foundation
import OhSwifter

public extension CGRect {
    
    static func size(_ length: Double) -> CGRect {
        return CGRect(x: 0, y: 0, width: length, height: length)
    }
}

extension UICollectionViewFlowLayout: OhConfigurator {
    
}

extension OhConfigureWrapper where Base: UICollectionViewFlowLayout {
    
    @discardableResult
    func minimumLineSpacing(_ spacing: CGFloat) -> OhConfigureWrapper {
        base.minimumLineSpacing = spacing
        return self
    }
    
    @discardableResult
    func minimumInteritemSpacing(_ spacing: CGFloat) -> OhConfigureWrapper {
        base.minimumInteritemSpacing = spacing
        return self
    }
    
    @discardableResult
    func spacing(forV v: CGFloat, h: CGFloat) -> OhConfigureWrapper {
        base.minimumInteritemSpacing = h
        base.minimumLineSpacing = v
        return self
    }
    
    @discardableResult
    func sectionInset(_ inset: UIEdgeInsets) -> OhConfigureWrapper {
        base.sectionInset = inset
        return self
    }

}

//
//  ColorSet.swift
//  kMoney
//
//  Created by ohlulu on 2019/7/19.
//  Copyright © 2019 ohlulu. All rights reserved.
//

import RealmSwift

@objc class ColorSet: Object {
    
    dynamic var id: Int = 0
    
    dynamic var hex: String = "#FFFFFF"
}

//
//  ColorSet.swift
//  kMoney
//
//  Created by ohlulu on 2019/7/19.
//  Copyright © 2019 ohlulu. All rights reserved.
//

import RealmSwift

class ColorSet: Object, GetAllable {
    
    @objc dynamic var id: Int = 0
    
    @objc dynamic var normalHex: String = "#FFFFFF"
    
    @objc dynamic var pressedHex: String = "#FFFFFF"
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

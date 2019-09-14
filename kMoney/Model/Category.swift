//
//  Category.swift
//  kMoney
//
//  Created by ohlulu on 2019/7/19.
//  Copyright © 2019 ohlulu. All rights reserved.
//

import RealmSwift

class Category: Object, GetAllable {
    
    @objc dynamic var name = ""
    
    @objc dynamic var iconInfo: IconSet? = IconSet()
    
    @objc dynamic var colorInfo: ColorSet? = ColorSet()
    
    override static func primaryKey() -> String? {
        return "name"
    }
    
    var color: UIColor {
        return UIColor(hexString: colorInfo!.normalHex)!
    }
    
    var iconImage: UIImage {
        return UIImage(named: iconInfo!.name)!
    }
}

//
//  Category.swift
//  kMoney
//
//  Created by ohlulu on 2019/7/19.
//  Copyright © 2019 ohlulu. All rights reserved.
//

import RealmSwift

@objc class Category: Object {
    
    dynamic var name = ""
    
    dynamic var icon = IconSet()
    
    dynamic var color = ColorSet()
}

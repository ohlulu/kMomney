//
//  Realm+Ext.swift
//  kMoney
//
//  Created by ohlulu on 2019/9/14.
//  Copyright © 2019 ohlulu. All rights reserved.
//

import RealmSwift

protocol GetAllable {
    
}
extension GetAllable where Self: Object {
    static func getAll() -> Results<Self> {
        return try! Realm().objects(Self.self)
    }
}

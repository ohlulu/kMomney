//
//  IconSet.swift
//  kMoney
//
//  Created by ohlulu on 2019/7/19.
//  Copyright © 2019 ohlulu. All rights reserved.
//


import RealmSwift

class IconSet: Object {
    
    @objc dynamic var index: Int = 0
    
    @objc dynamic var name: String = ""
    
    override static func indexedProperties() -> [String] {
        return ["index"]
    }
    
    override static func primaryKey() -> String? {
        return "index"
    }
}

// MARK: - convenience usage
extension IconSet {
    var image: UIImage {
        return UIImage(named: name)!
    }
}

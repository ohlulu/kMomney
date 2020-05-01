//
//  Records.swift
//  kMoney
//
//  Created by ohlulu on 2019/7/19.
//  Copyright © 2019 ohlulu. All rights reserved.
//

import Foundation
import RealmSwift

class Record: Object {
    
    @objc dynamic var id: String = UUID().uuidString
    
    @objc dynamic var time = Date().timeIntervalSince1970
    
    @objc dynamic var category: Category? = nil
    
    @objc dynamic var money = 0
    
    @objc dynamic var tag = ""
    
    static override func primaryKey() -> String? {
        return "id"
    }
    
    static override func indexedProperties() -> [String] {
        return ["id"]
    }
}

// MARK: - Getter / Setter

extension Record {
    var date: Date {
        get { time.dateSince1970 }
        set { time = newValue.timeIntervalSince1970}
    }
}

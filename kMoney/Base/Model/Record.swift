//
//  Records.swift
//  kMoney
//
//  Created by ohlulu on 2019/7/19.
//  Copyright © 2019 ohlulu. All rights reserved.
//

import Foundation
import RealmSwift

@objc class Record: Object {
    
    dynamic var time = Date().timeIntervalSince1970
    
    dynamic var category: Category? = nil
    
    dynamic var money = 0
    
    dynamic var tag = ""
}

// MARK: - Getter / Setter

extension Record {
    var date: Date {
        get { time.dateSince1970 }
        set { time = newValue.timeIntervalSince1970}
    }
}

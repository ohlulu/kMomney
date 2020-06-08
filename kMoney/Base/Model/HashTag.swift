//
//  HashTag.swift
//  kMoney
//
//  Created by Ohlulu on 2020/6/8.
//  Copyright © 2020 ohlulu. All rights reserved.
//

import Foundation

@objcMembers class HashTag: Object {
    
    dynamic var text: String = ""
    
    var records = LinkingObjects(fromType: Record.self, property: "tagList")
    
    static override func primaryKey() -> String? {
        return "text"
    }
}

extension String {
    var tagIsExist: Bool {
        !tagIsNotExist
    }
    
    var tagIsNotExist: Bool {
        Realm.getAll(HashTag.self).filter("text CONTAINS[c] %@", self).isEmpty
    }
    
    func getTagFromRealm() -> HashTag? {
        Realm.getAll(HashTag.self).filter("text CONTAINS[c] %@", self).first
    }
}

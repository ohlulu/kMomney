//
//  ModelInitial.swift
//  kMoney
//
//  Created by ohlulu on 2019/8/20.
//  Copyright © 2019 ohlulu. All rights reserved.
//

import RealmSwift

struct ModelUtility {
    
    static func initModel() {
        initIconSet()
    }
    
    private static func initIconSet() {
        let realm = try! Realm()
        
        var iconSet = Set<IconSet>()
        
        iconSet.insert(IconSet(value: [0, "clothes"]))
        iconSet.insert(IconSet(value: [0, "drink"]))
        iconSet.insert(IconSet(value: [0, "cookie"]))
        iconSet.insert(IconSet(value: [0, "hospital"]))
        iconSet.insert(IconSet(value: [0, "food"]))
        iconSet.insert(IconSet(value: [0, "airplane"]))
        iconSet.insert(IconSet(value: [0, "candy"]))
        
        for (index, icon) in iconSet.enumerated() {
            icon.index = index
        }
        
        do {
            try realm.write {
                realm.add(iconSet, update: .modified)
            }
        } catch {
            printDebug(error)
        }
        
    }
}

//
//  RealmHelper.swift
//  kMoney
//
//  Created by ohlulu on 2019/8/20.
//  Copyright © 2019 ohlulu. All rights reserved.
//

import RealmSwift

var kRealm = _kRealm.`default`

private class _kRealm {
    static var `default`: Realm = {
       return try! Realm()
    }()
}

struct RealmHelper {
    
    private init() { }
    
    static func migration() {
        
        let newSchemaVersion: UInt64 = 3
        
        var config = Realm.Configuration(
            schemaVersion: newSchemaVersion,
            migrationBlock: { migration, oldSchemaVersion in
                
        })
        
        config.fileURL = config.fileURL!
            .deletingLastPathComponent()
            .appendingPathComponent("kMoney.realm")
        
        // 通知Realm為默認的Realm數據庫使用這個新的配置對象
        Realm.Configuration.defaultConfiguration = config
        
        do {
            _ = try Realm()
        } catch {
            printDebug(error)
        }
    }
    
    /*
     第一次開啟APP，初始化資料庫
     */
    static func initial() {
        var colorSet = [ColorSet]()
        let hexs = ["#A4BFFA", "#7776B4"]
        for (i, hex) in hexs.enumerated() {
            let color = ColorSet()
            color.id = i
            color.normalHex = hex
            colorSet.append(color)
        }
        
        do {
            let rm = kRealm
            try rm.write {
                rm.add(colorSet, update: .all)
            }
        } catch {
            printDebug(error)
        }
    }
}

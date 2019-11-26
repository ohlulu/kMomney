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
        
        let newSchemaVersion: UInt64 = 4
        
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
        var categorys = [Category]()
        
        let categoryNames = ["食物", "旅行", "零食", "衣服"]
        let hexs = ["#A4BFFA", "#7776B4", "#FFA56B", "#C361E8"]
        let icons = ["food", "airplane", "candy", "clothes"]
        for (i, categoryName) in categoryNames.enumerated() {
            let color = ColorSet(value: [i, hexs[i]])
            
            let icon = IconSet(value: [i, icons[i]])
            
            let category = Category(value: [categoryName, icon, color])

            categorys.append(category)
        }
        
        do {
            let rm = kRealm
            try rm.write {
                rm.add(categorys, update: .all)
            }
        } catch {
            printDebug(error)
        }
    }
}

//
//  RealmHelper.swift
//  kMoney
//
//  Created by ohlulu on 2019/8/20.
//  Copyright © 2019 ohlulu. All rights reserved.
//

import RealmSwift

struct RealmHelper {
    
    static func migration() {
        
        let newSchemaVersion: UInt64 = 1
        
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
}

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

extension Realm {
    
    static var shared: Realm {
        return try! Realm()
    }
    
    static func getAll<O: Object>(_ type: O.Type) -> Results<O> {
        return try! Realm().objects(type.self)
    }
    
    static func getFirst<O: Object>(_ type: O.Type) -> O {
        return try! Realm().objects(type.self).first!
    }
    
    static func deleteAll<O: Object>(_ type: O.Type) {
        let realm = Realm.shared
        let all = Realm.getAll(type)
        try! realm.write {
            realm.delete(all)
        }
    }
    
    static func write(_ closure: (Realm) -> Void) {
        let realm = try! Realm()
        try! realm.write { closure(realm) }
    }
}

extension Results {
    func toArray() -> [Element] {
        return Array(self)
    }
}

struct RealmHelper {
    
    private init() { }
    
    static func migration() {
        
        let newSchemaVersion: UInt64 = 5
        
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
        
        let url = Bundle.main.url(forResource: "CategoryList", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let list = try! JSONDecoder().decode(CategoryListModel.self, from: data)

        for (i, c) in list.datas.enumerated() {
            let color = ColorSet(value: [i, c.hex])
            
            let icon = IconSet(value: [i, c.icon])
            
            let category = Category(value: [i, c.name, icon, color])

            categorys.append(category)
        }
        
        Realm.deleteAll(Category.self)
        
        Realm.write {
            $0.add(categorys, update: .all)
        }
    }
}

private struct CategoryListModel: Decodable {
    
    let datas: [List]
    
    struct List: Decodable {
        let name: String
        let hex: String
        let icon: String
    }
}

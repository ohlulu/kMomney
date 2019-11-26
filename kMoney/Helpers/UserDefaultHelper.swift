//
//  UserDefaultHelper.swift
//  kMoney
//
//  Created by ohlulu on 2019/9/8.
//  Copyright © 2019 ohlulu. All rights reserved.
//

import Foundation

@propertyWrapper
struct UserDefault<Type> {
    let key: String
    let defaultValue: Type
    
    init(key: String, defaultValue: Type) {
        self.key = key
        self.defaultValue = defaultValue
        UserDefaults.standard.register(defaults: [key: defaultValue])
    }
    var wrappedValue: Type {
        get {
            UserDefaults.standard.object(forKey: key) as! Type
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
            UserDefaults.standard.synchronize()
        }
    }
}
struct UserDefaultHelper {
    @UserDefault(key: "firstOpen", defaultValue: "")
    static var firstOpen: String
}
//extension UserDefaults {
//
//    struct First: UserDefaultsSettable {
//        enum defaultKeys: String {
//            case open
//        }
//    }
//}

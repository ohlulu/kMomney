//
//  UserDefaultHelper.swift
//  kMoney
//
//  Created by ohlulu on 2019/9/8.
//  Copyright © 2019 ohlulu. All rights reserved.
//

import Foundation

extension UserDefaults {

    struct First: UserDefaultsSettable {
        enum defaultKeys: String {
            case open
        }
    }
}

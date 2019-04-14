//
//  DoubleExtension.swift
//  Deloitte
//
//  Created by ohlulu on 2019/1/23.
//  Copyright © 2019 Goons. All rights reserved.
//

import Foundation

extension Double {
    var clean: String {
        return self.truncatingRemainder(dividingBy: 1) == 0
            ? String(format: "%.0f", self)
            : String(self)
    }
}

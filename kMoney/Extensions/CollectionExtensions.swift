//
//  CollectionExtensions.swift
//  kMoney
//
//  Created by Ohlulu on 2020/5/1.
//  Copyright © 2020 ohlulu. All rights reserved.
//

import Foundation

extension Collection {
    func group(by size: Int) -> [[Element]] {
        // Inspired by: https://lodash.com/docs/4.17.4#chunk
        guard size > 0, !isEmpty else { return [] }
        var start = startIndex
        var slices = [[Element]]()
        while start != endIndex {
            let end = index(start, offsetBy: size, limitedBy: endIndex) ?? endIndex
            slices.append(Array(self[start..<end]))
            start = end
        }
        return slices
    }
}

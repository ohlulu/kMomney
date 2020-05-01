//
//  DetailViewModel.swift
//  kMoney
//
//  Created by Ohlulu on 2020/4/20.
//  Copyright © 2020 ohlulu. All rights reserved.
//

import Foundation

final class DetailViewModel: BaseViewModel {

    // Relay or Subject
    var categorysStream: Observable<[[Category]]> {
        return categorysRelay.asObservable()
    }
    
    var selectedCategoryStream: Observable<Category?> {
        return recordRelay.map { $0.category }
    }
    
    var dateTextStream: Observable<String> {
        return recordRelay.map { $0.date.string(format: "yyyy 年 MM 月 dd 日") }
    }

    // Property
    private let recordRelay = BehaviorRelay<Record>(value: Record())
    private let categorysRelay = BehaviorRelay<[[Category]]>(value: Category.getAll().group(by: 10))

    // life cycle
    override init() {
        super.init()
    }
}

// MARK: - Output

extension DetailViewModel {
    
}

// MARK: - Input

extension DetailViewModel {
    func onTapCategory(at indexPath: IndexPath) {
        guard let category = categorysRelay.value.safe[indexPath.section]?.safe[indexPath.row] else {
            return
        }
        
        modifyRecord { $0.category = category }
    }
    
    func changeRecord(date: Date) {
        modifyRecord { $0.date = date }
    }
    
    func changeRecord(tag: String) {
        modifyRecord { $0.tag = tag }
    }
}

// MARK: - Helper

private extension DetailViewModel {
    func modifyRecord(_ closure: (Record) -> Void) {
        let record = recordRelay.value
        closure(record)
        recordRelay.accept(record)
    }
}

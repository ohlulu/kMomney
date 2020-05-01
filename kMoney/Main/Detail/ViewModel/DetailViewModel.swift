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
        return selectedCategoryRelay.asObservable()
    }
    
    var dateTextStream: Observable<String> {
        return dateRelay.map { $0.string(format: "yyyy 年 MM 月 dd 日")}
    }

    // Property
    let recordModel = Record()
    private let categorysRelay = BehaviorRelay<[[Category]]>(value: Category.getAll().group(by: 10))
    private let selectedCategoryRelay = BehaviorRelay<Category?>(value: nil)
    private let dateRelay = BehaviorRelay<Date>(value: Date())

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
        
        selectedCategoryRelay.accept(category)
        recordModel.category = category
    }
    
    func changeRecord(date: Date) {
        recordModel.date = date
        dateRelay.accept(date)
    }
    
    func changeRecord(tag: String) {
        recordModel.tag = tag
    }
}

// MARK: - Helper

private extension DetailViewModel {
    
}

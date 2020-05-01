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

    // Property
    private let categorysRelay = BehaviorRelay<[[Category]]>(value: Category.getAll().group(by: 10))
    private let selectedCategoryRelay = BehaviorRelay<Category?>(value: nil)

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
    }
}

// MARK: - Helper

private extension DetailViewModel {
    
}

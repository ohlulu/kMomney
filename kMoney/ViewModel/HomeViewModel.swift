//
//  HomeViewModel.swift
//  kMoney
//
//  Created by ohlulu on 2019/7/21.
//  Copyright © 2019 ohlulu. All rights reserved.
//

import Foundation

class HomeViewModel {

    // MARK: Public Output
    
    var recordStream: Observable<[Record]> {
        return recordSubject.asObservable()
    }

    // MARK: Private Subject
    
    private let recordSubject = ReplaySubject<[Record]>.create(bufferSize: 1)

    // MARK: Private property

    init() {
        observerSequence()
        selected(Date())
    }
}

extension HomeViewModel {
    
    func selected(_ date: Date) {
        
    }
    
    func edit(record: Record) {
        
    }
}

// MARK: - Observer sequence

fileprivate extension HomeViewModel {
    
    func observerSequence() {
        
    }
}

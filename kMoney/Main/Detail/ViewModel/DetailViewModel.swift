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
    let categorysStream: Observable<[[Category]]>
    let selectedCategoryStream: Driver<Category?>
    let dateTextStream: Driver<String>
    let saveButtonIsEnable: Driver<Bool>
    
    var moneyZeroShakeStream: Driver<Void> { moneyZeroShakeRelay.asDriver(onErrorJustReturn: ()) }

    // Property
    private let recordRelay = BehaviorRelay<Record>(value: Record())
    private let categorysRelay = BehaviorRelay<[[Category]]>(value: Category.getAll().group(by: 10))
    private let moneyZeroShakeRelay = PublishRelay<Void>()

    // life cycle
    override init() {
        
        categorysStream = categorysRelay.asObservable()
        
        selectedCategoryStream = recordRelay.map { $0.category }
            .asDriver(onErrorJustReturn: nil)
        
        dateTextStream = recordRelay.map { $0.date.string(format: "yyyy 年 MM 月 dd 日") }
            .asDriver(onErrorJustReturn: "")
        
        saveButtonIsEnable = recordRelay.map { $0.money != 0 && $0.category != nil }
            .debug()
            .asDriver(onErrorJustReturn: false)
            .distinctUntilChanged()
        
        super.init()
        
        onTapCategory(at: IndexPath(item: 0, section: 0))
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
    
    func changeRecord(money: Int) {
        modifyRecord { $0.money = money }
    }
    
    func changeRecord(date: Date) {
        modifyRecord { $0.date = date }
    }
    
    func changeRecord(tag: String) {
        modifyRecord { $0.tagRawString = tag}
    }
    
    @discardableResult
    func didTapSaveButton() -> Observable<Bool> {
        let record = recordRelay.value
        if record.money == 0 {
            moneyZeroShakeRelay.accept(())
            return .just(false)
        }
        
        let tagList = record.tagRawString.components(separatedBy: ",")
            .map { $0.trimmingCharacters(in: .whitespaces) }
            .filter { !$0.isEmpty }
        
        let tagListToRealm = List<HashTag>()
        tagList.forEach {
            let tag: HashTag
            if let oldTag = $0.getTagFromRealm() {
                tag = oldTag
            } else {
                let newTag = HashTag(value: [$0])
                tag = newTag
            }
            
            tagListToRealm.append(tag)
        }
        
        Realm.write {
            $0.add(tagListToRealm, update: .modified)
        }
        
        modifyRecord { record in
            record.tagList.removeAll()
            tagListToRealm.forEach { tag in
                record.tagList.append(tag)
            }
        }
        
        printDebug(record)
        Realm.write {
            $0.add(record, update: .all)
        }
        
        return .just(true)
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

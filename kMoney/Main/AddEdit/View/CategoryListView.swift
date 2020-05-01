//
//  CategoryListView.swift
//  kMoney
//
//  Created by Ohlulu on 2020/3/8.
//  Copyright © 2020 ohlulu. All rights reserved.
//

import UIKit

// MARK: - Flow layout

private class CategoryListFlowLayout: UICollectionViewFlowLayout {
    
    private var computedContentSize: CGSize = .zero
    private var cached: [IndexPath: UICollectionViewLayoutAttributes] = [:]
    
    override var collectionViewContentSize: CGSize {
        computedContentSize
    }
    
    override func prepare() {
        
        guard let collectionView = collectionView else {
            return
        }
        
        computedContentSize = .zero
        cached = [:]
        let itemSize = CGSize.init(width: collectionView.frame.width / 5,
                                   height: 60)
        var count: CGFloat = 0
        for section in 0 ..< collectionView.numberOfSections {
            for item in 0 ..< collectionView.numberOfItems(inSection: section) {
                let xOffset: CGFloat = itemSize.width * (item % 5).cgfloat
                    + section.cgfloat * collectionView.frame.width
                let yOffset: CGFloat = item % 10 < 5 ? 0 : 60 + 16
                let itemFrame = CGRect.init(x: xOffset, y: yOffset, width: itemSize.width, height: itemSize.height)
                let indexPath = IndexPath(item: item, section: section)
                let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
                attributes.frame = itemFrame
                cached[indexPath] = attributes
                count += 1
            }
        }
        computedContentSize = CGSize.init(width: ceil((count + 1) / 10) * collectionView.frame.width,
                                          height: 136)
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return cached.filter { _, attribute in
            attribute.frame.intersects(rect)
        }.map { $0.value }
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cached[indexPath]
    }
}

// MARK: - view

class CategoryListView: UIView {
    
    var collectionView: UICollectionView! = nil
    let datasRelay = PublishRelay<[[Category]]>()
    
    private let bag = DisposeBag()
    
    init() {
        super.init(frame: .zero)
        configureHierarchy()
        configureDataSource()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Configure

extension CategoryListView {
    func configureHierarchy() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: CategoryListFlowLayout())
        collectionView.oh
            .backgroundColor(.background)
            .isPagingEnabled(true)
            .showsVerticalIndicator(false)
            .showsHorizontalIndicator(false)
        addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(136)
        }
    }
    
    func configureDataSource() {
        collectionView.register(cell: CategorySelecteCell.self)
        
        let dataSource = RxCollectionDataSource<SectionModel<String, Category>>(
            configureCell: { _, cv, ip, model in
                let cell: CategorySelecteCell = cv.dequeueReuseableCell(indexPath: ip)
                cell.configCell(model)
                return cell
        })
        
        datasRelay
            .map { $0.map { SectionModel(model: "", items: $0) } }
            .bind(to: collectionView.rx.items(dataSource: dataSource))
            .disposed(by: bag)
    }
}

//// MARK: - Delegate
//
//extension CategoryListView: UICollectionViewDataSource {
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return datas.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return datas[section].count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell: CategorySelecteCell = collectionView.dequeueReuseableCell(indexPath: indexPath)
//        cell.configCell(datas[indexPath.section][indexPath.row])
//        return cell
//    }
//}

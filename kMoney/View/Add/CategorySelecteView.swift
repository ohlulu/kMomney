//
//  CategorySelecteView.swift
//  kMoney
//
//  Created by ohlulu on 2019/8/25.
//  Copyright © 2019 ohlulu. All rights reserved.
//

import UIKit
import RealmSwift

/*
 Layout
 */
private final class CategorySelectorLayout: UICollectionViewLayout {
    
    override var collectionViewContentSize: CGSize {
        guard let collectionView = collectionView else {
            return .zero
        }
        let numberOfItem = Int(ceil(collectionView.numberOfItems(inSection: 0).double / 10))
        
        let width = ((collectionView.bounds.size.width)
            * numberOfItem.cgfloat)
            - collectionView.contentInset.left
            - collectionView.contentInset.right
        
        let height = 172.cgfloat + 20
            - topInset
            - collectionView.contentInset.bottom
        
        return CGSize(width: width, height: height)
    }
    
    private lazy var topInset = collectionView?.contentInset.top ?? 0
    private let itemSize = CGSize(width: (UIScreen.width - 32) / 5,
                                  height: 62)
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        
        let xOffset: CGFloat = ((itemSize.width) * (indexPath.item % 5).cgfloat)
            + Int(indexPath.item.cgfloat / 10).cgfloat * UIScreen.widthf
            + 16
        
        let yOffset: CGFloat = (indexPath.item % 10 < 5 ? 0 : itemSize.height + 16) + 16
        
        let point = CGPoint(x: xOffset, y: yOffset)
        
        let frame = CGRect(origin: point, size: itemSize)
        
        attributes.frame = frame
        
        return attributes
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let indexPaths = indexPathsForElementsInRect(rect)
        let layoutAttributes = indexPaths
            .map {
                self.layoutAttributesForItem(at: $0)
            }
            .filter { $0 != nil }
            .map { $0! }
        return layoutAttributes
    }
    
    fileprivate func indexPathsForElementsInRect(_ rect: CGRect) -> [IndexPath] {
        var indexPaths: [IndexPath] = []
        
        if let numItems = collectionView?.numberOfItems(inSection: 0), numItems > 0 {
            for i in 0..<numItems {
                indexPaths.append(IndexPath(item: i, section: 0))
            }
        }
        
        return indexPaths
    }
}

/**
 Collection View
 */
private final class CategorySelecteCollectionView: UICollectionView {
    
    private var datas: Results<Category>
    
    init(datas: Results<Category>) {
        self.datas = datas
        let flowLayout = CategorySelectorLayout()

        super.init(frame: .init(x: 0, y: 0, width: UIScreen.width, height: 124),
                   collectionViewLayout: flowLayout)
        
        oh.regiter(CategorySelecteCell.self)
            .dataSource(self)
            .delegate(self)
            .backgroundColor(.clear)
            .showsVerticalIndicator(false)
            .showsHorizontalIndicator(false)
            .isPagingEnabled(true)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - UICollectionViewDelegate

extension CategorySelecteCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

// MARK: - UICollectionViewDataSource

extension CategorySelecteCollectionView: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CategorySelecteCell = collectionView.dequeueReuseableCell(indexPath: indexPath)
        let currentData = datas[indexPath.row]
        cell.configCell(currentData)
        return cell
    }
}

final class CategorySelectorView: UIView {
    
    var datas = Category.getAll()
    
    private lazy var collectionView = CategorySelecteCollectionView(datas: datas)
    
    private lazy var pageControl = UIPageControl().oh
        .numberOfPages(datas.count / 10)
        .pageIndicatorTintColor(.blueGrey)
        .currentPageIndicatorTintColor(.cornflower)
        .done()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


private extension CategorySelectorView {
    
    func setupUI() {
        // category selector view
        addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(172)
        }
        
        addSubview(pageControl)
        pageControl.snp.makeConstraints { (make) in
            make.top.equalTo(collectionView.snp.bottom)
            make.centerX.equalToSuperview()
        }
    }
}

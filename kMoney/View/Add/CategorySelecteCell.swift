//
//  CategorySelecteCell.swift
//  kMoney
//
//  Created by ohlulu on 2019/8/26.
//  Copyright © 2019 ohlulu. All rights reserved.
//

import UIKit

class CategorySelecteCell: UICollectionViewCell {
    
    private let categoryView = CategoryView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - setupUI
private extension CategorySelecteCell {
    
    func setupUI() {
        contentView.addSubview(categoryView)
        categoryView.snp.makeConstraints { (make) in
            make.top.centerX.equalToSuperview()
            make.size.equalTo(40)
        }
    }
}

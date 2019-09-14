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
    
    private let nameLabel = UILabel().oh
        .font(12, weight: .regular)
        .textColor(.greyText186)
        .textAlignment(.center)
        .done()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Input

extension CategorySelecteCell {
    
    func configCell(_ category: Category) {
        categoryView.category = category
        nameLabel.text = category.name
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
        
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.bottom.leading.trailing.equalToSuperview()
            make.top.equalTo(categoryView.snp.bottom).offset(4)
        }
    }
}

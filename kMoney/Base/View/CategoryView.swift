//
//  CategoryView.swift
//  kMoney
//
//  Created by ohlulu on 2019/8/20.
//  Copyright © 2019 ohlulu. All rights reserved.
//

import UIKit

class CategoryView: UIView {
    
    // public property
    var category: Category? {
        didSet { categoryDidChagne() }
    }
    
    // private property
    private lazy var imageView = UIImageView().oh
        .contentMode(.scaleAspectFill)
        .done()
    private let bag = DisposeBag()
    
    // life cycle
    init(_ category: Category? = nil) {
        self.category = category
        super.init(frame: .init(square: 44))
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.oh.cornerRadius(frame.size.height / 2)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// private observer stream
private extension CategoryView {
    
    func categoryDidChagne() {
        if let category = category {
            imageView.oh
                .borderWidth(0)
            imageView.image = category.iconImage
            imageView.backgroundColor = category.color
        } else {
            imageView.oh
                .border(color: .white, width: 1)
        }
    }
}

private extension CategoryView {
    
    func setupUI() {
        addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        categoryDidChagne()
    }
}

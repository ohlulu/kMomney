//
//  CategoryView.swift
//  kMoney
//
//  Created by ohlulu on 2019/8/20.
//  Copyright © 2019 ohlulu. All rights reserved.
//

import UIKit

class CategoryView: UIView {

    // override
//    override var intrinsicContentSize: CGSize {
//        return frame.size
//    }
    
    // public property
    var category: Category? {
        didSet { categoryDidChagne() }
    }
    
    // private property
    private lazy var imageView = UIImageView()
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
            imageView.image = category.icon.image
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

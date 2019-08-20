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
    override var intrinsicContentSize: CGSize {
        return frame.size
    }
    
    // public property
    private(set) var category: Category
    
    // life cycle
    init(_ category: Category) {
        self.category = category
        super.init(frame: .size(44))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

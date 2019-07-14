//
//  UILabelExtension.swift
//  Deloitte
//
//  Created by ohlulu on 2018/12/17.
//  Copyright © 2018 Goons. All rights reserved.
//

import UIKit

extension UIView {
    func setVerticalContent(_ priority: UILayoutPriority) {
        setContentHuggingPriority(priority, for: .vertical)
        setContentCompressionResistancePriority(priority, for: .vertical)
    }
    
    func setHorizontalContent(_ priority: UILayoutPriority) {
        setContentHuggingPriority(priority, for: .horizontal)
        setContentCompressionResistancePriority(priority, for: .horizontal)
    }
    
    func setVerticalContent(_ priorityFloat: Float) {
        setContentHuggingPriority(UILayoutPriority(priorityFloat), for: .vertical)
        setContentCompressionResistancePriority(UILayoutPriority(priorityFloat), for: .vertical)
    }
    
    func setHorizontalContent(_ priorityFloat: Float) {
        setContentHuggingPriority(UILayoutPriority(priorityFloat), for: .horizontal)
        setContentCompressionResistancePriority(UILayoutPriority(priorityFloat), for: .horizontal)
    }
}

@IBDesignable class PaddingLabel: UILabel {
    
    @IBInspectable var inset: UIEdgeInsets = .zero {
        didSet {
            topInset = inset.top
            bottomInset = inset.bottom
            leftInset = inset.left
            rightInset = inset.right
        }
    }
    
    @IBInspectable var topInset: CGFloat = 0.0
    @IBInspectable var bottomInset: CGFloat = 0.0
    @IBInspectable var leftInset: CGFloat = 0.0
    @IBInspectable var rightInset: CGFloat = 0.0
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }
    
    override var intrinsicContentSize : CGSize {
        var intrinsicSuperViewContentSize = super.intrinsicContentSize
        intrinsicSuperViewContentSize.height += topInset + bottomInset
        intrinsicSuperViewContentSize.width += leftInset + rightInset
        return intrinsicSuperViewContentSize
    }
}


//
//  UIimageViewExtension.swift
//  EazySwift
//
//  Created by ohlulu on 2019/4/12.
//  Copyright © 2019 ohlulu. All rights reserved.
//

import UIKit

extension UIImageView: Copy {
    func copySelf() -> Self {
        return copyView()
    }
    
    private func copyView<T: UIView>() -> T {
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject:self, requiringSecureCoding:false)
            return try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as! T
        } catch {
            fatalError()
        }
        
    }
}

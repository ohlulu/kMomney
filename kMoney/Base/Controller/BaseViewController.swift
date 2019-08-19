//
//  BaseViewController.swift
//  kMoney
//
//  Created by ohlulu on 2019/4/14.
//  Copyright © 2019 ohlulu. All rights reserved.
//

import UIKit
import ChameleonFramework

class BaseViewController: UIViewController {

    final lazy var backgroundImageView = UIImageView(image: .background)
    
    final lazy var bag = DisposeBag()
    
    // UI
    lazy var closeButton = UIButton().oh
        .image(.close, for: .normal)
        .done()
    
    // private property
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - Usage

extension BaseViewController {
    
    @discardableResult
    func addBackgroundImage() -> Self {
        view.addSubview(backgroundImageView)
        backgroundImageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        return self
    }
    
    func addCloseButton() {
        
        let rightButton = UIBarButtonItem(customView: closeButton)
        var items = [UIBarButtonItem]()
        if let _items = navigationItem.rightBarButtonItems {
            items = _items
        }
        items.append(rightButton)
        navigationItem.rightBarButtonItems = items
    }
}

// MARK: - Setup UI methods

fileprivate extension BaseViewController {
    
    func setupUI() {
        
    }
}

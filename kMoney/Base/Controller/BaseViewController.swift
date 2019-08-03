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

    private lazy var backgroundImage = UIImage.background
    internal lazy var bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - Usage

extension BaseViewController {
    
    @discardableResult
    func addBackgroundImage() -> Self {
        let imageView = UIImageView(image: backgroundImage)
        view.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        return self
    }
}

// MARK: - Setup UI methods

fileprivate extension BaseViewController {
    
    func setupUI() {
        
    }
}

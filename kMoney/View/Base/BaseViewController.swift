//
//  BaseViewController.swift
//  kMoney
//
//  Created by ohlulu on 2019/4/14.
//  Copyright © 2019 ohlulu. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: Setup UI methods

fileprivate extension BaseViewController {
    func setupUI() {
        view.backgroundColor = .white
    }
}

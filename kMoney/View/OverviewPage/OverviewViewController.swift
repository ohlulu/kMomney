//
//  OverviewViewController.swift
//  kMoney
//
//  Created by ohlulu on 2019/4/14.
//  Copyright © 2019 ohlulu. All rights reserved.
//

import UIKit

class OverviewViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: Setup UI methods

fileprivate extension OverviewViewController {
    
    func setupUI() {
        title = "2019/04"
    }
}

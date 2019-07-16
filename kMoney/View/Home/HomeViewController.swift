//
//  HomeViewController.swift
//  kMoney
//
//  Created by ohlulu on 2019/7/16.
//  Copyright © 2019 ohlulu. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    // MARK: UI element

    // MARK: Private property

    // MARK: - Life cycle

    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        observerSequence()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Observer sequence

fileprivate extension HomeViewController {
    
    func observerSequence() {
        
    }
}

// MARK: - Setup UI methods

fileprivate extension HomeViewController {

    func setupUI() {
        navigationItem.title = "7月"
    }
}

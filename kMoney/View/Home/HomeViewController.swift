//
//  HomeViewController.swift
//  kMoney
//
//  Created by ohlulu on 2019/7/16.
//  Copyright © 2019 ohlulu. All rights reserved.
//

import UIKit
import ChameleonFramework

class HomeViewController: BaseViewController {

    // MARK: UI element
    
    private let calendarView = CalendarView()
    private let addButton = UIButton(size: CGSize(width: 40, height: 40))

    // MARK: Private property
    
    private let viewModel = HomeViewModel()

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
        navigationItem.title = "COIN"
        addBackgroundImage()
        
        view.addSubview(calendarView)
        calendarView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.height.equalToSuperview().dividedBy(2.3)
        }
        
        let separatorView = UIView()
        separatorView.backgroundColor = .charcoalGrey
        view.addSubview(separatorView)
        separatorView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(calendarView.snp.bottom)
            make.height.equalTo(4)
        }
        
        view.addSubview(addButton)
        addButton.layer.cornerRadius = 20
        addButton.layer.masksToBounds = true
        addButton.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
                .offset(-18)
            make.size.equalTo(40)
            make.bottom
                .equalTo(view.safeAreaLayoutGuide.snp.bottom)
                .offset(-18)
        }
    }
}

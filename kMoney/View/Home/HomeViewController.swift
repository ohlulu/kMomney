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
    private let searchButton = UIButton()

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
        addButton.rx.tap
            .subscribe(onNext: { [unowned self] _ in
                let vc = DetailViewController(diffusionPoint: self.addButton.center)
                self.present(vc, animated: true, completion: nil)
            }).disposed(by: bag)
    }
}

// MARK: - Setup UI methods

fileprivate extension HomeViewController {

    func setupUI() {
        addBackgroundImage()
        
        searchButton.setImage(.search, for: .normal)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: searchButton)
        
        view.addSubview(calendarView)
        calendarView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(-4)
            make.height.equalToSuperview().dividedBy(2.6)
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
        addButton.setImage(.addNormal, for: .normal)
        addButton.setImage(.addPressed, for: .highlighted)
        addButton.snp.makeConstraints { (make) in
            make.right.equalToSuperview()   .offset(-18)
            make.size.equalTo(40)
            make.bottom
                .equalTo(view.safeAreaLayoutGuide.snp.bottom)
                .offset(-18)
        }
    }
}

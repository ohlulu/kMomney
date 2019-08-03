//
//  DetailViewController.swift
//  kMoney
//
//  Created by ohlulu on 2019/8/3.
//  Copyright © 2019 ohlulu. All rights reserved.
//

import UIKit

class DetailViewController: BaseViewController {
    
    // MARK: UI element
    
    private let closeButton = UIButton()
    
    // MARK: Private property
    
    private lazy var transitionAnimation = DiffusionTransition()
    private let viewModel = HomeViewModel()
    
    // MARK: - Life cycle
    
    init(diffusionPoint: CGPoint? = nil) {
        super.init(nibName: nil, bundle: nil)
        if let diffusionPoint = diffusionPoint {
            transitionAnimation.targetPoint = diffusionPoint
            transitionAnimation.interaction.wireGesture(on: self)
            transitioningDelegate = transitionAnimation
            modalPresentationStyle = .custom
        }
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

fileprivate extension DetailViewController {
    
    func observerSequence() {
        closeButton.rx.tap
            .subscribe(onNext: { [unowned self] _ in
                self.dismissSelf()
            }).disposed(by: bag)
    }
}

// MARK: - Setup UI methods

fileprivate extension DetailViewController {
    
    func setupUI() {
        addBackgroundImage()
        
        closeButton.setImage(.close, for: .normal)
        view.addSubview(closeButton)
        closeButton.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.right.equalTo(-16)
            make.size.equalTo(44)
        }
        
    }
}

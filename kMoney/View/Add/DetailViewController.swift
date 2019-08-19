//
//  DetailViewController.swift
//  kMoney
//
//  Created by ohlulu on 2019/8/3.
//  Copyright © 2019 ohlulu. All rights reserved.
//

import UIKit
import ChameleonFramework

class DetailViewController: BaseViewController {
    
    // UI element
    
    private let moneyLabel = UILabel().oh
        .kFont(.numbdr(.regular, 40))
        .textColor(.pureWhite)
        .textAlignment(.right)
        .isUserInteractionEnabled(true)
        .text("$ 1,000")
        .done()
    
    private let textField = UITextField().oh
        .isHidden(true)
        .keyboardType(.numberPad)
        .createConfigurator {
            $0.keyboardAppearance = UIKeyboardAppearance.dark
        }
        .done()
    
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
        textField.becomeFirstResponder()
        // closeButton Pressed
        closeButton.rx.tap
            .subscribe(onNext: { [unowned self] _ in
                self.dismiss()
            }).disposed(by: bag)
        
        backgroundImageView.rx.tapGesture()
            .when(.recognized)
            .subscribe(onNext: { [unowned self] _ in
                self.textField.resignFirstResponder()
            }).disposed(by: bag)
        
        moneyLabel.rx.tapGesture()
            .when(.recognized)
            .debug()
            .subscribe(onNext: { [unowned self] _ in
                self.textField.becomeFirstResponder()
            }).disposed(by: bag)
        
        view.rx.touchDownGesture()
            .when(.began)
            .subscribe(onNext: { [unowned self] _ in
                self.textField.resignFirstResponder()
            }).disposed(by: bag)
    }
}

// MARK: - Setup UI methods

fileprivate extension DetailViewController {
    
    func setupUI() {
        
        addBackgroundImage()
        addCloseButton()
        
        let topView = UIView().oh
            .backgroundColor(.detailTopColor)
            .roundCorners([.bottomLeft, .bottomRight], radius: 20)
            .addShadow(color: .white, radius: 20, y: 5, opacity: 0.6)
            .done()
        
        backgroundImageView.addSubview(topView)
        topView.snp.makeConstraints { (make) in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalTo(146)
        }
        
        topView.addSubview(moneyLabel)
        moneyLabel.snp.makeConstraints { (make) in
            make.right.bottom.equalToSuperview().inset(16)
        }
        
        topView.addSubview(textField)
        textField.snp.makeConstraints { (make) in
            make.edges.equalTo(moneyLabel)
        }
    }
}

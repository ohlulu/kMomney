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
        .done()
    
    private let moneyHiddenTextField = UITextField().oh
        .isHidden(true)
        .keyboardType(.numberPad)
        .keyboardAppearance(.dark)
        .done()
    
    private let categoryView = CategoryView()
    
    private let categorySelectorView = CategoryListView()
    
    private let dateLabel = UILabel().oh
        .textColor(.white)
        .font(.systemFont(ofSize: 15, weight: .medium))
        .done()
    
    private lazy var dateSelectorView = DateSelectorView()
    private lazy var dateHiddenTextField = UITextField().oh
        .isHidden(true)
        .inputView(dateSelectorView)
        .keyboardAppearance(.dark)
        .done()
    
    private let hashTagTextField = UITextField().oh
        .textColor(.white)
        .tintColor(.white)
        .font(.systemFont(ofSize: 15, weight: .medium))
        .keyboardAppearance(.dark)
        .attributedPlaceholder("＃標籤", attribute: [
            .font: UIFont.systemFont(ofSize: 15, weight: .medium),
            .foregroundColor: UIColor.greyText186
            ])
        .done()
    
    // MARK: Private property
    
    private lazy var transitionAnimation = DiffusionTransition()
    private let viewModel = DetailViewModel()
    
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
        outputStream()
        observerStream()
    }
    
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        moneyHiddenTextField.resignFirstResponder()
        super.dismiss(animated: flag, completion: completion)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - output stream

private extension DetailViewController {
    
    func outputStream() {
        
        categorySelectorView.collectionView.rx
            .itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                guard let self = self else { return }
                self.viewModel.onTapCategory(at: indexPath)
            }).disposed(by: bag)
        
        dateSelectorView.selectedDateStream
            .subscribe(onNext: { [weak self] date in
                guard let self = self else { return }
                self.viewModel.changeRecord(date: date)
            }).disposed(by: bag)
        
        // date label did tap
        dateLabel.rx.tapGesture().when(.recognized)
            .subscribe(onNext: { [weak self] _ in
                guard let self = self else { return }
                self.dateHiddenTextField.becomeFirstResponder()
            }).disposed(by: bag)
        
        // tag text -> record
        hashTagTextField.rx.text.orEmpty
            .subscribe(onNext: { [weak self] tag in
                guard let self = self else { return }
                self.viewModel.changeRecord(tag: tag)
            }).disposed(by: bag)
    }
}

// MARK: - Observer Stream

private extension DetailViewController {
    
    func observerStream() {
        
        // closeButton Pressed
        closeButton.rx.tap
            .subscribe(onNext: { [unowned self] _ in
                self.dismiss()
            }).disposed(by: bag)
        
        moneyHiddenTextField.rx.text
            .orEmpty
            .distinctUntilChanged()
            .flatMap { e -> Observable<Int> in
                return (Int(e) ?? 0).rx.asObservable()
            }
            .filter { $0 < 99999999 }
            .map {
                let formatter = NumberFormatter()
                formatter.numberStyle = .decimal
                formatter.positivePrefix = "$ "
                return formatter.string(from: NSNumber(value: $0)) ?? "error"
            }
            .bind(to: moneyLabel.rx.text)
            .disposed(by: bag)
        
        moneyLabel.rx.tapGesture()
            .when(.recognized)
            .subscribe(onNext: { [unowned self] _ in
                self.moneyHiddenTextField.becomeFirstResponder()
            }).disposed(by: bag)

        viewModel.categorysStream
            .bind(to: categorySelectorView.datasRelay)
            .disposed(by: bag)
        
        viewModel.selectedCategoryStream
            .subscribe(onNext: { [weak self] selected in
                guard let self = self else { return }
                self.categoryView.category = selected
            }).disposed(by: bag)
        
        // date label text
        viewModel.dateTextStream
            .bind(to: dateLabel.rx.text)
            .disposed(by: bag)
    }
}


// MARK: - Setup UI methods

fileprivate extension DetailViewController {
    
    func setupUI() {
        
        addCloseButton()
        moneyHiddenTextField.becomeFirstResponder()
        
        let topView = UIView().oh
            .backgroundColor(.detailTopColor)
            .roundCorners([.bottomLeft, .bottomRight], radius: 20)
            .done()
        
        view.addSubview(topView)
        topView.snp.makeConstraints { (make) in
            make.leading.trailing.top.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.top)
                .offset(80)
        }
        
        // categoryView
        topView.addSubview(categoryView)
        categoryView.snp.makeConstraints { (make) in
            make.left.bottom.equalToSuperview().inset(18)
            make.size.equalTo(44)
        }
        
        // moneyLabel
        topView.addSubview(moneyLabel)
        moneyLabel.snp.makeConstraints { (make) in
            make.left.equalTo(categoryView.snp.right).offset(24)
            make.right.equalToSuperview().inset(24)
            make.centerY.equalTo(categoryView)
            make.height.equalTo(44)
        }
        
        // money hidden textField
        topView.addSubview(moneyHiddenTextField)
        moneyHiddenTextField.snp.makeConstraints { (make) in
            make.edges.equalTo(moneyLabel)
        }
        
        // category selector view
        view.addSubview(categorySelectorView)
        categorySelectorView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(topView.snp.bottom).offset(16)
            make.height.equalTo(150)
        }
        
        let calendarIcon = UIImageView(image: .calendar)
        view.addSubview(calendarIcon)
        calendarIcon.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().inset(20)
            make.top.equalTo(categorySelectorView.snp.bottom).offset(12)
            make.size.equalTo(24)
        }
        
        // date label
        view.addSubview(dateLabel)
        dateLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(calendarIcon.snp.trailing).offset(13)
            make.centerY.equalTo(calendarIcon)
        }
        
        view.addSubview(dateHiddenTextField)
        dateHiddenTextField.snp.makeConstraints { (make) in
            make.edges.equalTo(dateLabel)
        }
        
        let tagIcon = UIImageView(image: .hashtag)
        view.addSubview(tagIcon)
        tagIcon.snp.makeConstraints { (make) in
            make.size.leading.equalTo(calendarIcon)
            make.top.equalTo(calendarIcon.snp.bottom).offset(13)
        }
        
        view.addSubview(hashTagTextField)
        hashTagTextField.snp.makeConstraints { (make) in
            make.leading.equalTo(dateLabel)
            make.trailing.equalToSuperview().inset(25)
            make.centerY.equalTo(tagIcon)
        }
        
        let lineView = UIView().oh
            .backgroundColor(.greyText186)
            .done()
        view.addSubview(lineView)
        lineView.snp.makeConstraints { (make) in
            make.leading.trailing.equalTo(hashTagTextField)
            make.height.equalTo(1)
            make.top.equalTo(hashTagTextField.snp.bottom)
        }
    }
}


extension Int: ReactiveCompatible {
    
}

extension Reactive where Base == Int {
    func asObservable() -> Observable<Base> {
        return Observable.just(base)
    }
}

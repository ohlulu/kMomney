//
//  DateSelectorView.swift
//  kMoney
//
//  Created by Ohlulu on 2020/5/1.
//  Copyright © 2020 ohlulu. All rights reserved.
//

import UIKit
import FSCalendar

final class DateSelectorView: UIView {
    
    // UI
    private lazy var calendar = FSCalendar(frame: .init(size: calendarSize))
    
    // property
    let selectedDateStream = PublishRelay<Date>()
    private let calendarSize = CGSize.init(width: UIScreen.width, height: Int(UIScreen.height * 0.3).double)
    
    // MARK: - Life cycle
    override init(frame: CGRect) {
        let viewSize = CGSize.init(width: calendarSize.width, height: calendarSize.height + UIScreen.safeAreaInset.bottom)
        super.init(frame: .init(size: viewSize))
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - FSCalendarDataSource

extension DateSelectorView: FSCalendarDataSource {
    
}

// MARK: - FSCalendarDelegate

extension DateSelectorView: FSCalendarDelegate {
    
    func calendar(_ calendar: FSCalendar, willDisplay cell: FSCalendarCell, for date: Date, at monthPosition: FSCalendarMonthPosition) {
        if monthPosition == .next && monthPosition == .previous {
            cell.titleLabel.textColor = UIColor.gunmetal.alpha(0.6)
        }
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        selectedDateStream.accept(date)
    }
}


// MARK: - SetupUI

private extension DateSelectorView {
    
    func setupUI() {
        addSubview(calendar)
        
        calendar.select(Date())
        
        calendar.scrollDirection = .horizontal
        calendar.locale = Locale(identifier: "zh-TW")
        calendar.placeholderType = .fillHeadTail
        calendar.appearance.weekdayFont = UIFont.systemFont(ofSize: 14, weight: .bold)
        calendar.delegate = self
        calendar.appearance.weekdayTextColor = .white
        calendar.appearance.headerTitleColor = .white
        calendar.appearance.headerMinimumDissolvedAlpha = 0
        calendar.appearance.headerDateFormat = "M 月"
        calendar.appearance.caseOptions = .weekdayUsesSingleUpperCase
        calendar.appearance.titleOffset = CGPoint(x: 0, y: 0)
        calendar.appearance.titleDefaultColor = .white
        calendar.appearance.titleTodayColor = .lavenderBlue
        calendar.appearance.todayColor = .clear
        calendar.appearance.selectionColor = .lavenderBlue
        calendar.appearance.titleSelectionColor = .white
        calendar.appearance.titleFont = UIFont.systemFont(ofSize: 14, weight: .medium)
    }
}

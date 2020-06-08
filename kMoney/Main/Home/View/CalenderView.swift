//
//  CalendarView.swift
//  kMoney
//
//  Created by ohlulu on 2019/7/21.
//  Copyright © 2019 ohlulu. All rights reserved.
//

import Foundation
import FSCalendar

class CalendarView: UIView {
    
    let _calendar = FSCalendar(frame: .init(width: UIScreen.height/2.6,
                                            height: UIScreen.width))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CalendarView: FSCalendarDelegateAppearance {
    
}

extension CalendarView: FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, willDisplay cell: FSCalendarCell, for date: Date, at monthPosition: FSCalendarMonthPosition) {
        if monthPosition == .next && monthPosition == .previous {
            cell.titleLabel.textColor = UIColor.white.alpha(0.6)
        }
        
    }
    
    func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
        let crrentMonth = calendar.currentPage.add(.day, value: 1)
        if !Calendar.current.isDate(crrentMonth, equalTo: Date(), toGranularity: .year) {
            _calendar.appearance.headerDateFormat = "yyyy 年 M 月"
            calendar.appearance.headerMinimumDissolvedAlpha = 0.4
        } else {
            _calendar.appearance.headerDateFormat = "M 月"
            calendar.appearance.headerMinimumDissolvedAlpha = 0
        }
    }
}

extension CalendarView: FSCalendarDataSource {

}


extension CalendarView {
    
    func setupUI() {
        addSubview(_calendar)
        _calendar.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        _calendar.scrollDirection = .horizontal
        _calendar.scrollEnabled = true
        _calendar.dataSource = self
        _calendar.delegate = self
        _calendar.locale = Locale(identifier: "zh-TW")
        _calendar.placeholderType = .fillHeadTail
        _calendar.appearance.weekdayFont = UIFont.systemFont(ofSize: 14, weight: .bold)
        _calendar.appearance.weekdayTextColor = .white
        _calendar.appearance.headerTitleColor = .white
        _calendar.appearance.headerMinimumDissolvedAlpha = 0
        _calendar.appearance.headerDateFormat = "M 月"
        _calendar.appearance.caseOptions = .weekdayUsesSingleUpperCase
        _calendar.appearance.titleOffset = CGPoint(x: 0, y: 0)
        _calendar.appearance.titleDefaultColor = .white
        _calendar.appearance.titleTodayColor = .lavenderBlue
        _calendar.appearance.todayColor = .clear
        _calendar.appearance.selectionColor = .lavenderBlue
        _calendar.appearance.titleSelectionColor = .white
        _calendar.appearance.titleFont = UIFont.systemFont(ofSize: 14, weight: .medium)
        
    }
    
    var weekdayLabelCreator: (String) -> (UILabel) {
        return { text -> UILabel in
            let label = UILabel()
            label.text = text
            return label
        }
    }
}

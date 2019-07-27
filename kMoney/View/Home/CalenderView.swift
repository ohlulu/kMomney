//
//  CalendarView.swift
//  kMoney
//
//  Created by ohlulu on 2019/7/21.
//  Copyright © 2019 ohlulu. All rights reserved.
//

import Foundation
import FSCalendar

class CalendarView: FSCalendar {

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
            cell.titleLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            cell.titleLabel.textColor = UIColor.white.setAlpha(0.5)
        }
    }
}

extension CalendarView: FSCalendarDataSource {

}


extension CalendarView {
    
    func setupUI() {
        dataSource = self
        delegate = self
        locale = Locale(identifier: "zh-TW")
        placeholderType = .fillHeadTail
        appearance.weekdayFont = UIFont.systemFont(ofSize: 14, weight: .regular)
        appearance.weekdayTextColor = .white
        appearance.headerTitleColor = .white
        appearance.headerMinimumDissolvedAlpha = 0
        appearance.headerDateFormat = "M 月"
        appearance.caseOptions = .weekdayUsesSingleUpperCase
        appearance.titleOffset = CGPoint(x: 0, y: 0)
        appearance.titleDefaultColor = .white
        appearance.titleTodayColor = .lavenderBlue
        appearance.todayColor = .clear
        appearance.selectionColor = .lavenderBlue
        appearance.titleSelectionColor = .white
        appearance.titleFont = UIFont.systemFont(ofSize: 14, weight: .semibold)
        
    }
    
    var weekdayLabelCreator: (String) -> (UILabel) {
        return { text -> UILabel in
            let label = UILabel()
            label.text = text
            return label
        }
    }
}

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
    
    let _calnedar = FSCalendar(frame: .init(width: UIScreen.height/2.6,
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
            cell.titleLabel.textColor = UIColor.gunmetal.alpha(0.6)
        }
    }
}

extension CalendarView: FSCalendarDataSource {

}


extension CalendarView {
    
    func setupUI() {
        addSubview(_calnedar)
//        _calnedar.snp.makeConstraints { (make) in
//            make.edges.equalToSuperview()
//        }
        
//        _calnedar.scrollDirection = .horizontal
//        _calnedar.scrollEnabled = true
        _calnedar.dataSource = self
        _calnedar.delegate = self
        _calnedar.locale = Locale(identifier: "zh-TW")
        _calnedar.placeholderType = .fillHeadTail
        _calnedar.appearance.weekdayFont = UIFont.systemFont(ofSize: 14, weight: .bold)
        _calnedar.appearance.weekdayTextColor = .white
        _calnedar.appearance.headerTitleColor = .white
        _calnedar.appearance.headerMinimumDissolvedAlpha = 0
        _calnedar.appearance.headerDateFormat = "M 月"
        _calnedar.appearance.caseOptions = .weekdayUsesSingleUpperCase
        _calnedar.appearance.titleOffset = CGPoint(x: 0, y: 0)
        _calnedar.appearance.titleDefaultColor = .white
        _calnedar.appearance.titleTodayColor = .lavenderBlue
        _calnedar.appearance.todayColor = .clear
        _calnedar.appearance.selectionColor = .lavenderBlue
        _calnedar.appearance.titleSelectionColor = .white
        _calnedar.appearance.titleFont = UIFont.systemFont(ofSize: 14, weight: .medium)
        
    }
    
    var weekdayLabelCreator: (String) -> (UILabel) {
        return { text -> UILabel in
            let label = UILabel()
            label.text = text
            return label
        }
    }
}

//
//  WeekdayView.swift
//  kMoney
//
//  Created by ohlulu on 2019/7/21.
//  Copyright © 2019 ohlulu. All rights reserved.
//

import Foundation
import FSCalendar

class WeekdayView: FSCalendarWeekdayView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        weekdayLabels.forEach {
            $0.text = "2"
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

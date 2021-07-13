//
//  WeekBar.swift
//  OneMonitor
//
//  Created by 衍则 on 2021/6/1.
//

import SwiftUI

struct WeekBar: View {
    var dayNumber: Int
    var body: some View {
        VStack {
            Text(String(format: "%.1f", (timeWeek[dayNumber])))
            if timeWeek[dayNumber] < 3.5 {
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 40.0, height: CGFloat(timeWeek[dayNumber]*25))
                    .foregroundColor(.green)
            } else if timeWeek[dayNumber] < 6 {
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 40.0, height: CGFloat(timeWeek[dayNumber]*25))
                    .foregroundColor(.orange)
            } else {
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 40.0, height: CGFloat(timeWeek[dayNumber]*25))
                    .foregroundColor(.red)
            }
        }
    }
}

struct WeekBar_Previews: PreviewProvider {
    static var previews: some View {
        WeekBar(dayNumber: 1)
    }
}

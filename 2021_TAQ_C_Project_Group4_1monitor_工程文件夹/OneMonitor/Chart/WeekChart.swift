//
//  WeekChart.swift
//  OneMonitor
//
//  Created by 衍则 on 2021/6/1.
//

import SwiftUI

struct WeekChart: View {
    var body: some View {
        VStack {
            Text("本周使用时间")
                .font(.title)
                .padding(.bottom, 40.0)
            HStack(alignment: .bottom, spacing: 25.0) {
                VStack {
                    WeekBar(dayNumber: 0)
                    Text("星期天")
                }
                VStack {
                    WeekBar(dayNumber: 1)
                    Text("星期一")
                }
                VStack {
                    WeekBar(dayNumber: 2)
                    Text("星期二")
                }
                VStack {
                    WeekBar(dayNumber: 3)
                    Text("星期三")
                }
                VStack {
                    WeekBar(dayNumber: 4)
                    Text("星期四")
                }
                VStack {
                    WeekBar(dayNumber: 5)
                    Text("星期五")
                }
                VStack {
                    WeekBar(dayNumber: 6)
                    Text("星期六")
                }
            }
        }
    }
}

struct WeekChart_Previews: PreviewProvider {
    static var previews: some View {
        WeekChart()
            .frame(width: 800.0, height: 450.0)
    }
}

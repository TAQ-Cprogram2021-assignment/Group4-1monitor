//
//  DayChart.swift
//  OneMonitor
//
//  Created by 衍则 on 2021/6/1.
//

import SwiftUI

struct DayChart: View {
    var body: some View {
        VStack {
            Text("今日电脑使用时间")
                .font(.title)
                .padding(.bottom, 40.0)
            HStack(alignment: .bottom, spacing: 10.0) {
                HStack(alignment: .bottom, spacing: 10.0) {
                    DayBar(hourNumber: 0)
                    DayBar(hourNumber: 1)
                    DayBar(hourNumber: 2)
                    DayBar(hourNumber: 3)
                    DayBar(hourNumber: 4)
                    DayBar(hourNumber: 5)
                    DayBar(hourNumber: 6)
                    DayBar(hourNumber: 7)

           
                }
                HStack(alignment: .bottom, spacing: 10.0) {
                    DayBar(hourNumber: 8)
                    DayBar(hourNumber: 9)
                    DayBar(hourNumber: 10)
                    DayBar(hourNumber: 11)
                    DayBar(hourNumber: 12)
                    DayBar(hourNumber: 13)
                    DayBar(hourNumber: 14)
                    DayBar(hourNumber: 15)

                }
                HStack(alignment: .bottom, spacing: 10.0) {
                    DayBar(hourNumber: 16)
                    DayBar(hourNumber: 17)
                    DayBar(hourNumber: 18)
                    DayBar(hourNumber: 19)
                    DayBar(hourNumber: 20)
                    DayBar(hourNumber: 21)
                    DayBar(hourNumber: 22)
                    DayBar(hourNumber: 23)

                }
            }
        }
    }
}

struct DayChart_Previews: PreviewProvider {
    static var previews: some View {
        DayChart()
            .frame(width: 800.0, height: 450.0)
            
    }
}

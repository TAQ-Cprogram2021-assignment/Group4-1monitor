//
//  YearChart.swift
//  OneMonitor
//
//  Created by 衍则 on 2021/6/2.
//

import SwiftUI

struct YearChart: View {
    var body: some View {
        VStack {
            Text("今年使用时间")
                .font(.title)
                .padding(.bottom, 40.0)
            HStack(alignment: .bottom, spacing: 25.0) {
                HStack(alignment: .bottom, spacing: 20.0) {
                    VStack {
                        YearBar(monthNumber: 0)
                        Text("一月")
                    }
                    VStack {
                        YearBar(monthNumber: 1)
                        Text("二月")
                    }
                    VStack {
                        YearBar(monthNumber: 2)
                        Text("三月")
                    }
                    VStack {
                        YearBar(monthNumber: 3)
                        Text("四月")
                    }
                    VStack {
                        YearBar(monthNumber: 4)
                        Text("五月")
                    }
                    VStack {
                        YearBar(monthNumber: 5)
                        Text("六月")
                    }

                    
                }
                HStack(alignment: .bottom, spacing: 20.0) {
                    VStack {
                        YearBar(monthNumber: 0)
                        Text("七月")
                    }
                    VStack {
                        YearBar(monthNumber: 1)
                        Text("八月")
                    }
                    VStack {
                        YearBar(monthNumber: 2)
                        Text("九月")
                    }
                    VStack {
                        YearBar(monthNumber: 3)
                        Text("十月")
                    }
                    VStack {
                        YearBar(monthNumber: 4)
                        Text("十一月")
                    }
                    VStack {
                        YearBar(monthNumber: 5)
                        Text("十二月")
                    }
                }
                
            }
        }
        
    }
}

struct YearChart_Previews: PreviewProvider {
    static var previews: some View {
        YearChart()
            .frame(width: 800.0, height: 450.0)
    }
}

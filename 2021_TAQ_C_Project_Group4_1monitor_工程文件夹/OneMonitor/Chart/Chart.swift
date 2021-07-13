//
//  Chart.swift
//  OneMonitor
//
//  Created by 衍则 on 2021/6/2.
//

import SwiftUI

struct Chart: View {
    enum Flavor: String, CaseIterable, Identifiable {
        case day
        case week
        case year

        var id: String { self.rawValue }
    }
    @State private var selectedFlavor = Flavor.day
    var body: some View {
        VStack (alignment:.leading) {
            Picker("", selection: $selectedFlavor) {
                Text("今日统计").tag(Flavor.day)
                Text("本周统计").tag(Flavor.week)
                Text("今年统计").tag(Flavor.year)
            }
            .padding(.leading, 100)
            .frame(width: 100.0)
            .pickerStyle(SegmentedPickerStyle())
            if selectedFlavor == Flavor.day {
                DayChart()
                    .frame(width: 800.0, height: 400.0)
                    .animation(.easeInOut)
            } else if selectedFlavor == Flavor.week {
                WeekChart()
                    .frame(width: 800.0, height: 400.0)
                    .animation(.easeInOut)
            } else {
                YearChart()
                    .frame(width: 800.0, height: 400.0)
                    .animation(.easeInOut)
            }
        }
        
    }
}

struct Chart_Previews: PreviewProvider {
    static var previews: some View {
        Chart()
            .frame(width: 800.0, height: 450.0)
    }
}

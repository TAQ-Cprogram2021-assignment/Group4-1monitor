//
//  DayBar.swift
//  OneMonitor
//
//  Created by 衍则 on 2021/6/1.
//

import SwiftUI

struct DayBar: View {
    var hourNumber: Int
    var body: some View {
        VStack {
            Text("\(timeDay[hourNumber])")
            if timeDay[hourNumber] != 60 {
                RoundedRectangle(cornerRadius: 7)
                    .frame(width: 20.0, height: CGFloat(timeDay[hourNumber])*4)
                    .foregroundColor((timeDay[hourNumber] < 30) ? .green : .orange)
            } else {
                RoundedRectangle(cornerRadius: 7)
                    .frame(width: 20.0, height: 240)
                    .foregroundColor(.red)
            }
                
            Text("\(hourNumber)")
                .font(.body)
                
        }

    }
}

struct DayBar_Previews: PreviewProvider {
    static var previews: some View {
        DayBar(hourNumber: 1)
    }
}

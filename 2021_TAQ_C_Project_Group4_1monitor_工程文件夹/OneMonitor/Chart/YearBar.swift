//
//  YearBar.swift
//  OneMonitor
//
//  Created by 衍则 on 2021/6/2.
//

import SwiftUI

struct YearBar: View {
    var monthNumber: Int
    var body: some View {
        VStack {
            Text(String(format: "%.1f", (timeYear[monthNumber])))
            if timeYear[monthNumber] < 3.5 {
                RoundedRectangle(cornerRadius: 12)
                    .frame(width: 40, height: CGFloat(timeYear[monthNumber]*25))
                    .foregroundColor(.green)
            } else if timeYear[monthNumber] < 6 {
                RoundedRectangle(cornerRadius: 12)
                    .frame(width: 40, height: CGFloat(timeYear[monthNumber]*25))
                    .foregroundColor(.orange)
            } else {
                RoundedRectangle(cornerRadius: 12)
                    .frame(width: 40, height: CGFloat(timeYear[monthNumber]*25))
                    .foregroundColor(.red)
            }
        }
      
    }
}

struct YearBar_Previews: PreviewProvider {
    static var previews: some View {
        YearBar(monthNumber: 1)
    }
}

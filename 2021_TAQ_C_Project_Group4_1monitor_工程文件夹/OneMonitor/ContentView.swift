//
//  ContentView.swift
//  OneMonitor
//
//  Created by 衍则 on 2021/5/26.
//


 
import SwiftUI
import AppKit
import AVFoundation
 
struct ContentView: View {
    @State var usedtime = Usedtime.startingtime
    @State var isOpenChart = false
    @State var authorizationStatus = "未知"
    @State var isUsing: Bool = true
    var w = getWeek()
    var M = getMonth()
    var H = getHour()


  
    @State var timer: Timer? = nil
  
    var body: some View {
        HStack {
            VStack {
                VStack(alignment: .center) {
                    ZStack {
                        
                        if usedtime.hours == 0 {
                            Path { path in
                                let r: CGFloat = 92
                                var a: Angle {
                                    Angle(degrees: Double(usedtime.minutes*6)-90)
                                }
                                var b: Angle {
                                    Angle(degrees: -90)
                                }
                                let c = CGPoint(x: 200, y: 210.8)
                                path.addArc(center: c, radius: r, startAngle: a, endAngle: b, clockwise: true)
                            }
                            .stroke(lineWidth: 15)
                            .foregroundColor((usedtime.minutes < 30) ? .green : .orange)
                            Circle()
                                .strokeBorder(lineWidth: 15, antialiased: true)
                                .opacity(0.2)
                                .shadow(radius: 20)
                                .frame(width: 200, height: 200)
                                .position(x: 200, y: 210.8)
                        } else {
                            Circle()
                                .strokeBorder(lineWidth: 15, antialiased: true)
                                .frame(width: 200, height: 200)
                                .foregroundColor(.red)
                                .position(x: 200, y: 210.8)
                            
                        }

                        
                        Text("\(usedtime.hours) : \(usedtime.minutes)")
                            .font(.title)
                            .onAppear(perform: {
                                timer = Timer.scheduledTimer(withTimeInterval: 60, repeats: true){ _ in
                                    usedtime = CountingTime(usedtime)
                                    timeDay[H] = timeDay[H] + 1
                                }
                        })
                    }
                    Spacer()
                    HStack {
                        Button("检查摄像头权限:\(authorizationStatus)"){
                            self.authorizationStatus = checkpermition()
                        }
                        Spacer()
                        if !isOpenChart {
                            Button(action: {
                                self.isOpenChart = true
                            }, label: {
                                Text("打开统计")
                            })
                        } else {
                            Button(action: {
                                self.isOpenChart = false
                            }, label: {
                                Text("关闭统计")
                            })
                        }
                    }
                }
            }
            .frame(minWidth: 400, idealWidth: 400, maxWidth: 400, minHeight: 450, idealHeight: 450, maxHeight: 450)
            if isOpenChart {
                Chart()
                    .frame(width: 800.0, height: 450.0)
                    .animation(.spring())
                
            }
        }
    }
}

    

  

 
 
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()

    }
}


//
//  Usedtime.swift
//  OneMonitor
//
//  Created by 衍则 on 2021/5/29.
//

import Foundation
import AppKit
import AVFoundation


struct Usedtime {
    var minutes: Int
    var hours: Int
    static var startingtime = Usedtime(minutes: 0, hours: 0)
    
}


var timeDay = [60,23,0,0,0,0,0,0,0,45,34,45,60,12,2,24,23,45,56,56,34,12,60,54]
var timeWeek = [3.4, 5.6, 1.2, 7.8, 2.3, 5.2, 8.8]
var timeYear = [6.7, 6.2, 4.5, 3.4, 4.2, 5.6, 7.8, 3.4, 5.4, 7.8, 3.2, 2.1]

func CountingTime (_ before: Usedtime) -> Usedtime {
    if before.minutes == 59 {
        return Usedtime(minutes: 0, hours: before.hours + 1)
    } else {
        return Usedtime(minutes: before.minutes + 1, hours: before.hours)
    }
}

func getWeek () -> Int {
    let formatter = DateFormatter()
    formatter.dateFormat = "EEE"
    let datetime = formatter.string(from: Date())
    if datetime == "Sun" {
        return 0
    } else if datetime == "Mon" {
        return 1
    } else if datetime == "Tue" {
        return 2
    } else if datetime == "Wed" {
        return 3
    } else if datetime == "Thur" {
        return 4
    } else if datetime == "Fri" {
        return 5
    } else {
        return 6
    }
}

func getHour() -> Int {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH"
    let datetime = formatter.string(from: Date())
    if datetime == "00" {
        return 0
    } else if datetime == "01" {
        return 1
    } else if datetime == "02" {
        return 2
    } else if datetime == "03" {
        return 3
    } else if datetime == "04" {
        return 4
    } else if datetime == "05" {
        return 5
    } else if datetime == "06" {
        return 6
    } else if datetime == "07" {
        return 7
    } else if datetime == "08" {
        return 8
    } else if datetime == "09" {
        return 9
    } else if datetime == "10" {
        return 10
    } else if datetime == "11" {
        return 11
    } else if datetime == "12" {
        return 12
    } else if datetime == "13" {
        return 13
    } else if datetime == "14" {
        return 14
    } else if datetime == "15" {
        return 15
    } else if datetime == "16" {
        return 16
    } else if datetime == "17" {
        return 17
    } else if datetime == "18" {
        return 18
    } else if datetime == "19" {
        return 19
    } else if datetime == "20" {
        return 20
    } else if datetime == "21" {
        return 21
    } else if datetime == "22" {
        return 22
    } else {
        return 23
    }
}

func getMonth() -> Int {
    let formatter = DateFormatter()
    formatter.dateFormat = "M"
    let datetime = formatter.string(from: Date())
    if datetime == "1" {
        return 1
    } else if datetime == "2" {
        return 2
    } else if datetime == "3" {
        return 3
    } else if datetime == "4" {
        return 4
    } else if datetime == "5" {
        return 5
    } else if datetime == "6" {
        return 6
    } else if datetime == "7" {
        return 7
    } else if datetime == "8" {
        return 8
    } else if datetime == "9" {
        return 9
    } else if datetime == "10" {
        return 10
    } else if datetime == "11" {
        return 11
    } else {
        return 12
    }
}

func checkpermition() -> String {
    var flag = "结果:未知"
    switch AVCaptureDevice.authorizationStatus(for: .video) {
    case .authorized:
        print(".authorized")
        flag = "完成认证"
        
    case .notDetermined: // The user has not yet been asked for camera access.
        AVCaptureDevice.requestAccess(for: .video) { granted in
            if granted {
                print("granted")
                flag =  "同意使用"
            }
        }
        
    case .denied:
        flag =  "拒绝"
        
    case .restricted:
        flag =  "restricted"

    }   
    return flag
}

//
//  Pomodoro.swift
//  PomodoroTimer
//
//  Created by Megabits on 15/10/8.
//  Copyright © 2015年 ScrewBox. All rights reserved.
//

import Foundation

class pomodoro:NSObject{
    
    private let defaults = NSUserDefaults.standardUserDefaults()
    
    var pomoMode = 0
    
    var pomoTime = 1500 { didSet { setDefaults ("pomo.pomoTime",value: pomoTime) } }
    var breakTime = 300 { didSet { setDefaults ("pomo.breakTime",value: breakTime) } }
    var longBreakTime = 1500 { didSet { setDefaults ("pomo.longBreakTime",value: longBreakTime) } }
    
    var nowTime = 0
    
    var process:Float = 0
    var timerLabel = "00:00"
    
    var longBreakEnable = false
    
    private var timer: NSTimer?
    private var isDebug = false
    
     override init() {
        super.init()
        if getDefaults("pomo.pomoTime") != nil {  //存储设置
            pomoTime = getDefaults("pomo.pomoTime") as? Int ?? 1500
            breakTime = getDefaults("pomo.breakTime") as? Int ?? 300
            longBreakTime = getDefaults("pomo.longBreakTime") as? Int ?? 1500
        } else {
            setDefaults ("pomo.pomoTime",value: pomoTime)
            setDefaults ("pomo.breakTime",value: breakTime)
            setDefaults ("pomo.longBreakTime",value: longBreakTime)
        }
        
        updateDisplay()
//        isDebug = true //调试模式 Debug mode
    }
    
    func updateTimer(timer:NSTimer) { //确定计时状态和调整时间
        if nowTime <= 0{
            stopTimer()
            if pomoMode == 1 {
                pomoMode++
                nowTime = breakTime
                print("Pomo Over")
                breakStart()
            } else if pomoMode == 2 {
                if longBreakEnable {
                    pomoMode++
                    nowTime = longBreakTime
                    longBreakStart()
                } else {
                    pomoMode = 0
                }
                print("Break Over")
            } else if pomoMode == 3 {
                pomoMode = 0
                print("Long Break Over")
                // 准备加入长时休息代码
            }
        } else {
            if isDebug {
                nowTime -= 100
            } else {
                nowTime--
            }
        }
        updateDisplay()
    }
    
    private func updateDisplay() {
        //生成百分比形式的进度
        switch pomoMode {
        case 1:
            process = Float(nowTime) / Float(pomoTime) * 100
        case 2:
            process = Float(nowTime) / Float(breakTime) * 100
        case 3:
            process = Float(nowTime) / Float(longBreakTime) * 100
        default:
            process = 0
        }
        //生成当前时间的文本表示
        var nowUse = 0
        if pomoMode == 0 {
            nowUse = pomoTime
        } else {
            nowUse = nowTime
        }
        var minute = "\((nowUse - (nowUse % 60)) / 60)"
        var second = "\(nowUse % 60)"
        if nowUse % 60 < 10 {
            second = "0" + second
        }
        if (nowUse - (nowUse % 60)) / 60 < 10 {
            minute = "0" + minute
        }
        timerLabel = minute + ":" + second
    }
    
    func start() {
        if pomoMode == 1 {
            nowTime = pomoTime
            print("PomoTime: \(pomoTime) BreakTime:\(breakTime)")
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "updateTimer:", userInfo: nil, repeats: true)
        }
    }
    
    private func breakStart() {
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "updateTimer:", userInfo: nil, repeats: true)
    }
    
    private func longBreakStart() {
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "updateTimer:", userInfo: nil, repeats: true)
    }
    
    func stop() {
        stopTimer()
        pomoMode = 0
        nowTime = 0
    }
    
    private func getDefaults (key: String) -> AnyObject? {
        if key != "" {
            return defaults.objectForKey(key)
        } else {
            return nil
        }
    }
    
    private func setDefaults (key: String,value: AnyObject) {
        if key != "" {
            defaults.setObject(value,forKey: key)
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
        process = 0
    }
}
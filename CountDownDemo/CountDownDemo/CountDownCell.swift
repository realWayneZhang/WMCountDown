//
//  CountDownCell.swift
//  CountDownDemo
//
//  Created by Winson Zhang on 2018/12/22.
//  Copyright © 2018 Winson. All rights reserved.
//

import UIKit

class CountDownCell: UITableViewCell {

     let countDownTimer = WMCountDown()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        countDownTimer.countDown = { [weak self] (d, h, m, s) in
            let time = d + ":" + h + ":" + m + ":" + s
            self?.textLabel?.text = time
            print("时间是：\(d):\(h):\(m):\(s)")
        }
        // 开始倒计时
        // 可以传递开始时间参数，用于计算倒计时时间差，不传，默认从系统当前时间开始计算时间差
        // countdownTimer.start(with: "2018-12-17 22:49:00", end: "2018-12-19 22:49:00")
        let minute = randomInRange(range: (1..<60))
        let second = randomInRange(range: (1..<60))
        countDownTimer.start(with: nil, end: "2019-12-19 22:\(minute):\(second)")
        
    }
    deinit {
        countDownTimer.stop()
    }
}

extension CountDownCell {
    func randomInRange(range: Range<Int>) -> Int {
        let count = UInt32(range.endIndex - range.startIndex)
        return  Int(arc4random_uniform(count)) + range.startIndex
    }
}

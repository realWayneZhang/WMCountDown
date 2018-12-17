//
//  ViewController.swift
//  CountDownDemo
//
//  Created by Winson Zhang on 2018/12/17.
//  Copyright © 2018 Winson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    
    /// 懒加载 倒计时
    lazy var countdownTimer: WMCountDown = {
        let timer = WMCountDown()
        // 此闭包可以在本类任意方法中写
        timer.countDown = { [weak self] (d, h, m, s) in
            self?.dayLabel.text = "\(d)天:"
            self?.hourLabel.text = "\(h)时:"
            self?.minuteLabel.text = "\(m)分:"
            self?.secondLabel.text = "\(s)秒"
        }
        return timer
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        countdownTimer.resume() // 恢复倒计时
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        countdownTimer.suspend() // 停止倒计时
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 开始倒计时
        // 可以传递开始时间参数，用于计算倒计时时间差，不传默认从系统当前时间开始计算时间差
        // countdownTimer.start(with: "2018-12-17 22:49:00", end: "2018-12-19 22:49:00")
        countdownTimer.start(with: nil, end: "2019-12-19 22:49:00")
    }
    
    
    deinit {
        /// 可写可不写
        countdownTimer.stop()
    }


}


//
//  ViewController.swift
//  CountDownDemo
//
//  Created by Winson Zhang on 2018/12/17.
//  Copyright © 2018 Winson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    
    /// 懒加载 倒计时
    lazy var countdownTimer: WMCountDown = {
        return WMCountDown()
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
        
        // 防止 Cell 重用时 仍在倒计时
        countdownTimer.stop()
        
        // 此闭包可以在本类任意方法中写
        countdownTimer.countDown = { [weak self] (d, h, m, s) in
            let time = d + ":" + h + ":" + m + ":" + s
            self?.timeLabel.text = time
        }
        // 开始倒计时
        // 可以传递开始时间参数，用于计算倒计时时间差，不传，默认从系统当前时间开始计算时间差
        // countdownTimer.start(with: "2018-12-17 22:49:00", end: "2018-12-19 22:49:00")
        countdownTimer.start(with: nil, end: "2019-12-19 22:49:00")
    }
    
    // 销毁时应停止并销毁倒计时，节约线程开销
    deinit {
        countdownTimer.stop()
    }
}


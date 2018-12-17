# WMCountDown
一百行代码搞定商城活动倒计时，采用Swift4.2语法，倒计时格式为天，时，分，秒。

## 优点：
采用DispatchTimer定时器，在globalQueue中执行定时器，只在当前控制器开始倒计时，离开立即停止。

## 用法：
将WMCountDown.swift文件拖拽到项目中。
代码如下：
```
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
```

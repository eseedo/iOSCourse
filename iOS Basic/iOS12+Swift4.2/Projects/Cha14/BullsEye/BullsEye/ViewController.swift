//
//  ViewController.swift
//  BullsEye
//
//  Created by eseedo on 11/29/18.
//  Copyright © 2018 eseedo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //定义了一个outlet类型的slider变量
    @IBOutlet weak var slider: UISlider!
    //定义了一个outlet类型的label变量
    @IBOutlet weak var targetLabel: UILabel!
    
    //定义了用来显示玩家总得分的outlet 标签变量
    @IBOutlet weak var scoreLabel: UILabel!
    
    //定义了用来显示游戏回合数的outlet 标签变量
    @IBOutlet weak var roundLabel: UILabel!
    
    var currentValue: Int = 50
    var targetValue: Int = 0
    var score = 0
    var round = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //更改滑动条的外观
        let thumbImageNormal =  UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        

        
        
        //开启新的游戏回合
       startNewGame()
    }

    @IBAction func showAlert(){
        
        //定义一个用来保存差值的变量，并使用新的算法计算差值
       
        let difference = abs(targetValue - currentValue)
        
        //计算玩家的当前得分
        var points = 100 - difference
        

        
        //设置标题的内容
        let title: String
        if difference == 0{
            title = "运气逆天！赶紧去买注彩票吧！"
            points += 100
        }else if difference < 5 {
            title = "太棒了！差一点就到了！"
            if(difference == 1){
                points += 50
            }
        }else if difference < 10 {
            title = "很不错！继续努力！"
            
        }else {
            title = "差太远了，君在长江头，我在长江尾~"
        }
        
        //计算玩家的总得分
        score += points
        
        //设置消息体的内容
        let message = "您的得分是： \(points)分"
        
        let alert = UIAlertController(title: title,
                                      message:message,
            preferredStyle: .alert)
        //更改了handler部分
        let action = UIAlertAction(title:"OK",style: .default,
                                   handler: { _ in
                                                self.startNewRound()
                                            })
        alert.addAction(action)
        
        //显示提示信息
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func sliderMoved(_ slider:UISlider){
//        print("滑动条的当前数值是： \(slider.value)")
        //获取玩家所选择的滑动条数值
        currentValue = lroundf(slider.value)
    }
    
    //重新来过按钮的触碰事件
    @IBAction func startOver(){
        
        startNewGame()
    }
    //开启新的游戏回合
    func startNewRound(){
        
        //增加游戏回合数
        round += 1
        
        targetValue = Int.random( in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        
        //4.更新目标数值的标签文本内容
        updateLabels()
    }
    
    //开启新的游戏
    func startNewGame(){
        
        score = 0
        round = 0
        startNewRound()
    }
    
    func updateLabels(){
        
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
}


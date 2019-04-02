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
        //开启新的游戏回合
       startNewRound()
    }

    @IBAction func showAlert(){
        
        //1.定义一个用来保存差值的变量，并使用新的算法计算差值
       
        let difference = abs(targetValue - currentValue)
        
        //2.计算玩家的当前得分
        let points = 100 - difference
        
        //3.计算玩家的总得分
        score += points
        
        //设置消息体的内容
        let message = "您的得分是： \(points)分"
        
        let alert = UIAlertController(title:"科瓦奇您好",
                                      message:message,
            preferredStyle: .alert)
        let action = UIAlertAction(title:"OK",style: .default, handler: nil)
        alert.addAction(action)
        
        //显示提示信息
        present(alert, animated: true, completion: nil)
        
        //开启新的游戏回合
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider:UISlider){
//        print("滑动条的当前数值是： \(slider.value)")
        //获取玩家所选择的滑动条数值
        currentValue = lroundf(slider.value)
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
    
    func updateLabels(){
        
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
}


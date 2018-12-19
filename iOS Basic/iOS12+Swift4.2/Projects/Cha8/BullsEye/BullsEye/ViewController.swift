//
//  ViewController.swift
//  BullsEye
//
//  Created by eseedo on 11/29/18.
//  Copyright © 2018 eseedo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //1.定义了一个outlet类型的slider变量
    @IBOutlet weak var slider: UISlider!
    //3.定义了一个outlet类型的label变量
    @IBOutlet weak var targetLabel: UILabel!
    
    var currentValue: Int = 50
    var targetValue: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       startNewRound()
    }

    @IBAction func showAlert(){
        
        //1.定义y一个用来保存差值的变量
        var difference: Int
        //2.计算差值的具体数值
        if currentValue > targetValue {
            
            difference = currentValue - targetValue
        }else if targetValue > currentValue {
            
            difference = targetValue - currentValue
        }else{
            difference = 0
        }
        //3.设置消息体的内容
        let message = "滑动条的当前数值是： \(currentValue)" + "\n目标数值是： \(targetValue)" + "\n两者的差值是: \(difference)"
        
        let alert = UIAlertController(title:"科瓦奇您好",
                                      message:message,
            preferredStyle: .alert)
        let action = UIAlertAction(title:"OK",style: .default, handler: nil)
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider:UISlider){
//        print("滑动条的当前数值是： \(slider.value)")
        currentValue = lroundf(slider.value)
    }
    
    func startNewRound(){
        
        targetValue = Int.random( in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        
        //4.更新目标数值的标签文本内容
        updateLabels()
    }
    
    func updateLabels(){
        
        targetLabel.text = String(targetValue)
    }
}


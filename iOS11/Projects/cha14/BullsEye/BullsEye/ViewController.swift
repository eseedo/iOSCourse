//
//  ViewController.swift
//  BullsEye
//
//  Created by eseedo on 10/11/17.
//  Copyright © 2017 eseedo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    var currentValue = 50
    var targetValue = 0
    var score = 0
    var round = 0

    override func viewDidLoad() {
        
        super.viewDidLoad()
        startNewGame()
        
        //设置滑动条的外观
        
       
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        
       

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    func startNewRound() {
        round += 1
        targetValue = 1 + Int (arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    func startNewGame() {
        score = 0
        round = 0
        startNewRound()
    }

    @IBAction func showAlert(){
        
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        
        
        //添加以下代码对玩家的表现作出评价~
        let title: String
//        let title = ""
        if difference == 0 {
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
        
        score += points
        let mesage = "大家好，给大家介绍一下我的得分，是 \(points) 分"
        
        let alert = UIAlertController(title: title,
                                      message: mesage,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title:"ok",style: .default,handler: {action in
                                                                            self.startNewRound()
                                                                        })
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)

    }
    

    @IBAction func sliderMoved(_ slider: UISlider){
        
        print("滑动条的当前数值是： \(slider.value)")
        currentValue = lroundf(slider.value)
    }
    
    @IBAction func startOver(){
        startNewGame()
    }
}


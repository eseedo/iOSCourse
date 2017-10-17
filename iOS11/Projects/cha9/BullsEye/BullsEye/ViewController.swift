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
        startNewRound()
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

    @IBAction func showAlert(){
        
        let difference = abs(targetValue - currentValue)
        let points = 100 - difference
        score += points
        
        let mesage = "大家好，给大家介绍一下我的得分，是 \(points) 分"
        
        let alert = UIAlertController(title:"Hello Messi",
                                      message:mesage,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title:"ok",style: .default,handler: nil)
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        startNewRound()
    }
    

    @IBAction func sliderMoved(_ slider: UISlider){
        
        print("滑动条的当前数值是： \(slider.value)")
        currentValue = lroundf(slider.value)
    }
}


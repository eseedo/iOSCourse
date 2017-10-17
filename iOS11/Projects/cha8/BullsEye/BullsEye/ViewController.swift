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
    
    var currentValue: Int = 50
    var targetValue: Int = 0

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
    }
    
    func startNewRound() {
        
        targetValue = 1 + Int (arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }

    @IBAction func showAlert(){
        
        var difference: Int
        if currentValue > targetValue{
            
            difference = currentValue - targetValue
        }else if targetValue > currentValue{
            difference = targetValue - currentValue
        }else{
            difference = 0
        }
        
        let mesage = "滑动条的当前数值是：\(currentValue)" +
                     "\n目标数值是： \(targetValue)" +
                     "\n两者的差值是： \(difference)"
        
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


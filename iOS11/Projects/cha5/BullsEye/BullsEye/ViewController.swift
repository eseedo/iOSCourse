//
//  ViewController.swift
//  BullsEye
//
//  Created by eseedo on 10/11/17.
//  Copyright © 2017 eseedo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 50

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert(){
        
        let mesage = "滑动条的当前数值是：\(currentValue)"
        
        let alert = UIAlertController(title:"Hello Messi",
                                      message:mesage,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title:"ok",style: .default,handler: nil)
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    

    @IBAction func sliderMoved(_ slider: UISlider){
        
        print("滑动条的当前数值是： \(slider.value)")
        currentValue = lroundf(slider.value)
    }
}


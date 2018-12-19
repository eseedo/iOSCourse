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
    
    var currentValue: Int = 50

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        currentValue = lroundf(slider.value)
    }

    @IBAction func showAlert(){
        
        let message = "滑动条的当前数值是： \(currentValue)"
        
        let alert = UIAlertController(title:"把油桶踢过来",
                                      message:message,
            preferredStyle: .alert)
        let action = UIAlertAction(title:"2019年要跟着学几个拿手菜",style: .default, handler: nil)
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider:UISlider){
//        print("滑动条的当前数值是： \(slider.value)")
        currentValue = lroundf(slider.value)
    }
}


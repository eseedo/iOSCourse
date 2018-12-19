//
//  ViewController.swift
//  BullsEye
//
//  Created by eseedo on 12/4/18.
//  Copyright © 2018 eseedo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func showAlert(){
        
        let alert = UIAlertController(title: "把油桶踢过来", message: "看王师傅教你做正宗的四川麻婆豆腐", preferredStyle:  .alert)
        let action = UIAlertAction(title: "2019年要跟着学几个拿手菜", style: .default, handler: nil)
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }

}


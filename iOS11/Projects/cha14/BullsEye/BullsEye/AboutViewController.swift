//
//  AboutViewController.swift
//  BullsEye
//
//  Created by eseedo on 10/19/17.
//  Copyright © 2017 eseedo. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func close(){
        dismiss(animated:  true,completion: nil)
    }


}

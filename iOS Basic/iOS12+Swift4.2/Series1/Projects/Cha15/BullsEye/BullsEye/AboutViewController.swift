//
//  AboutViewController.swift
//  BullsEye
//
//  Created by eseedo on 12/13/18.
//  Copyright © 2018 eseedo. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //添加网页视图
//        if let url = Bundle.main.url(forResource: "BullsEye", withExtension: "html"){
//        let  request = URLRequest(url: url)
//        webView.load(request)
//    }
        
        //使用真实世界的网页
            if let url = URL.init(string: "http://www.apple.com"){
                let request = URLRequest(url: url)
                webView.load(request)
            }
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func close(){
        
        dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

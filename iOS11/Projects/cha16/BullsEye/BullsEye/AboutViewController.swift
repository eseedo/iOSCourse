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
        
//        if let url = Bundle.main.url(forResource: "BullsEye",
//                                     withExtension: "html"){
//            if let htmlData = try? Data(contentsOf: url){
//                let baseURL = URL(fileURLWithPath: Bundle.main.bundlePath)
//                webView.load(htmlData, mimeType: "text/html",
//                             textEncodingName: "UTF-8",
//                             baseURL: baseURL)
//            }
//        }


        let myURL = URL.init(string: "http://www.apple.com")
        let request: URLRequest = URLRequest(url: myURL!)
        webView.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func close(){
        dismiss(animated:  true,completion: nil)
    }


}

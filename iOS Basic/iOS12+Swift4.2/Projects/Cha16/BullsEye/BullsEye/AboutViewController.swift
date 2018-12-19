//
//  ViewController.swift
//  BullsEye
//
//  Created by eseedo on 11/29/18.
//  Copyright © 2018 eseedo. All rights reserved.
//


import UIKit
import WebKit



class AboutViewController: UIViewController {
  @IBOutlet weak var webView: WKWebView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    /*使用准备好的网页
    if let url = Bundle.main.url(forResource: "BullsEye",
                               withExtension: "html") {
      let request = URLRequest(url: url)
      webView.load(request)
    }
     */
    
    //使用真实世界的网页
    if let url = URL.init(string: "http://www.apple.com"){
      let request = URLRequest(url: url)
      webView.load(request)
    }
    
  }
  
  @IBAction func close() {
    dismiss(animated: true, completion: nil)
  }
}

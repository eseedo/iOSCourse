//
//  ViewController.swift
//  Checklists
//
//  Created by eseedo on 1/10/19.
//  Copyright © 2019 icode. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {

    //TODO: complete this
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //MARK:- TABLEVIEW DATA SOURCE
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    //FIXME: might be error
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        return cell
    }
    
}


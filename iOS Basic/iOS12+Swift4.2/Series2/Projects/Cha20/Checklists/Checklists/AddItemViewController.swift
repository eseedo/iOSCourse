//
//  AddItemViewController.swift
//  Checklists
//
//  Created by eseedo on 3/15/19.
//  Copyright © 2019 icode. All rights reserved.
//

import UIKit

class AddItemViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
    }

    
    //MARK:- Actions
    
    @IBAction func cancel(){
        
        navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func done(){
        
        navigationController?.popViewController(animated: true)
    }
    
    //MARK:- Table View Delegate methods
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
 
}

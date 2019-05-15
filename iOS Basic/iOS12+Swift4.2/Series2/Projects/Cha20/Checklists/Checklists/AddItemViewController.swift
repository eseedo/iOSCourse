//
//  AddItemViewController.swift
//  Checklists
//
//  Created by eseedo on 3/15/19.
//  Copyright © 2019 icode. All rights reserved.
//

import UIKit

class AddItemViewController: UITableViewController,UITextFieldDelegate {

    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    //MARK:- Actions
    
    @IBAction func cancel(){
        
        navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func done(){
        //print some contents
        print("用户输入的信息是： \(textField.text!)")
        navigationController?.popViewController(animated: true)
    }
    
    //MARK:- Table View Delegate methods
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
 
    //MARK:- Text Field Delegates
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let oldText = textField.text!
        let stringRange = Range(range, in:oldText)!
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        
        if newText.isEmpty{
            doneBarButton.isEnabled = false
        }else{
            doneBarButton.isEnabled = true
        }
        return true
    }
}

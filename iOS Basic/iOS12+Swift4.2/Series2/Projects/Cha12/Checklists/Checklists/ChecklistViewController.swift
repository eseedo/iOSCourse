//
//  ViewController.swift
//  Checklists
//
//  Created by eseedo on 1/10/19.
//  Copyright © 2019 icode. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
    
    //MARK:- Define some constants &variables
    
//    let row0text = "去看电影《流浪地球》"
//    let row1text = "学习吴恩达博士的《机器学习》教程"
//    let row2text = "开通海外交易账户买美港股"
//    let row3text = "看美食节目《风味人间》"
//    let row4text = "约上好友行摄维多利亚港"
//
//    var row0checked = true
//    var row1checked = false
//    var row2checked = true
//    var row3checked = true
//    var row4checked = false
   
    var row0item = ChecklistItem()
    var row1item = ChecklistItem()
    var row2item = ChecklistItem()
    var row3item = ChecklistItem()
    var row4item = ChecklistItem()

    //TODO: complete this
    //FIXME: might be error
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //MARK:- TABLEVIEW DATA SOURCE/Users/eseedo/Documents/Github/iOSCourse/iOS Basic/iOS12+Swift4.2/Series2/Projects/Cha7/Checklists/Checklists/Base.lproj/Main.storyboard
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        //添加下面的代码
        let label = cell.viewWithTag(1000) as! UILabel
        
        if indexPath.row  == 0 {
            label.text = row0item.text
        } else if indexPath.row  == 1{
            label.text = row1item.text
        } else if indexPath.row  == 2{
            label.text = row2item.text
        } else if indexPath.row == 3{
            label.text = row3item.text
        }else if indexPath.row  == 4{
            label.text = row4item.text
        }
        //结束以上的新代码段
        configureCheckmark(for: cell, at: indexPath)
        return cell
    }
    
    
    
    //MARK:- Table View Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath){

            if indexPath.row == 0 {
                row0item.checked = !row0item.checked

            } else if indexPath.row == 1 {
                row1item.checked = !row1item.checked
            } else if indexPath.row == 2 {
                row2item.checked = !row2item.checked
            }   else if indexPath.row == 3 {
                row3item.checked = !row3item.checked
            }   else if indexPath.row == 4 {
                row4item.checked = !row4item.checked
            }
            configureCheckmark(for: cell, at: indexPath)
            
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    //MARK:- CONFIGURE THE CHECKMARK
    func configureCheckmark(for cell: UITableViewCell, at indexPath: IndexPath){
        
        var isChecked = false
        
        if indexPath.row == 0{
            isChecked = row0item.checked
        }else if indexPath.row == 1{
            isChecked = row1item.checked
        }else if indexPath.row == 2{
            isChecked = row2item.checked
        }else if indexPath.row == 3{
            isChecked = row3item.checked
        }else if indexPath.row == 4{
            isChecked = row4item.checked
        }
        
        if isChecked {
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
    }
}


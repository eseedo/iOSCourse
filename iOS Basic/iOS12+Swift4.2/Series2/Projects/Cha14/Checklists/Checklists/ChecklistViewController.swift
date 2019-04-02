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
   
    var items = [ChecklistItem]()

    //TODO: complete this
    //FIXME: might be error
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let item1 = ChecklistItem()
        item1.text = "重温德容为加盟巴萨寄出投名状"
        items.append(item1)
        
        let item2 = ChecklistItem()
        item2.text = "A股暴涨，赶紧去开个科创板的新户"
        item2.checked = true
        items.append(item2)
        
        let item3 = ChecklistItem()
        item3.text = "两会召开中，关注每天的新闻动态"
        item3.checked = true
        items.append(item3)
        
        let item4 = ChecklistItem()
        item4.text = "学习神奇的AI视频变脸技术"
        items.append(item4)
        
        let item5 = ChecklistItem()
        item5.text = "为参加6月的WWDC提前做好准备"
        items.append(item5)
    }

    //MARK:- TABLEVIEW DATA SOURCE/Users/eseedo/Documents/Github/iOSCourse/iOS Basic/iOS12+Swift4.2/Series2/Projects/Cha7/Checklists/Checklists/Base.lproj/Main.storyboard
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        //添加下面的代码
        
        let item = items[indexPath.row]
        let label = cell.viewWithTag(1000) as! UILabel
        
        label.text = item.text
        configureCheckmark(for: cell, with:  item)
        return cell
    }
    
    
    
    //MARK:- Table View Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath){
            let item = items[indexPath.row]
            item.toggleChecked()
            configureCheckmark(for: cell, with: item)
            
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
     
    
    //MARK:- CONFIGURE THE CHECKMARK
    func configureCheckmark(for cell: UITableViewCell, with item: ChecklistItem){
        
        if item.checked{
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
    }
    
    func configureText(for cell: UITableViewCell, with item: ChecklistItem){
        
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
}


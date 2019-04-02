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
    //FIXME: might be error
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //MARK:- TABLEVIEW DATA SOURCE/Users/eseedo/Documents/Github/iOSCourse/iOS Basic/iOS12+Swift4.2/Series2/Projects/Cha7/Checklists/Checklists/Base.lproj/Main.storyboard
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        //添加下面的代码
        let label = cell.viewWithTag(1000) as! UILabel
        
        if indexPath.row % 5 == 0 {
            label.text = "观看《流浪地球》"
        } else if indexPath.row % 5 == 1{
            label.text = "观看《疯狂的外星人》"
        } else if indexPath.row % 5 == 2{
            label.text = "观看《飞驰人生》"
        } else if indexPath.row % 5 == 3{
            label.text = "观看《喜剧之王》"
        }else if indexPath.row  % 5 == 4{
            label.text = "观看《小猪佩奇过大年》"
        }
        //结束以上的新代码段
        
        return cell
    }
    
}


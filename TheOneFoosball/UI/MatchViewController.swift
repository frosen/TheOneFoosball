//
//  MatchViewController.swift
//  TheOneFoosball
//
//  Created by 卢乐颜 on 16/4/26.
//  Copyright © 2016年 luleyan. All rights reserved.
//

import UIKit

class MatchViewController: UITableViewController {

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let vc = segue.destinationViewController as! DetailViewController
        if segue.identifier == "add" {
            vc.title = "新建比赛"
            print("add")
        } else if segue.identifier == "detail" {
            vc.title = "比赛详情"
            print("detail")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

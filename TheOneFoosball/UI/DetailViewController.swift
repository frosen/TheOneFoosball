//
//  DetailViewController.swift
//  TheOneFoosball
//
//  Created by 卢乐颜 on 16/4/21.
//  Copyright © 2016年 luleyan. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {

    //名称

    //场数
    @IBOutlet weak var inningNumLabel: UILabel!
    @IBOutlet weak var inningNumStepper: UIStepper!

    @IBAction func changeInningNum(sender: UIStepper) {

        print(sender.value)

        inningNumLabel.text = String(Int(sender.value))
    }

    //兑现

    //小比分

    //导航
    @IBAction func onCancel(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
            NSLog("关闭模态视图")
        })
    }

    @IBAction func onSave(sender: AnyObject) {

        self.dismissViewControllerAnimated(true, completion: { () -> Void in
            NSLog("保存成功")
        })
    }

}

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
    @IBOutlet weak var inningName: UILabel!

    //场数
    @IBOutlet weak var inningNumLabel: UILabel!
    @IBOutlet weak var inningNumStepper: UIStepper!

    @IBAction func changeInningNum(sender: UIStepper) {
        print("match num", sender.value)
        inningNumLabel.text = String(Int(sender.value))

        for k in 1...5 {
            if k <= Int(sender.value) {
                cellList[k - 1].hidden = false
            } else {
                cellList[k - 1].hidden = true
            }
        }
    }

    //兑现
    @IBOutlet weak var finishSwitch: UISwitch!

    //小比分
    var cellList: [UIView] = []

    //1
    @IBOutlet weak var cell1: UIView!

    @IBOutlet weak var leftScore1: UILabel!
    @IBOutlet weak var rightScore1: UILabel!
    @IBOutlet weak var leftStepper1: UIStepper!
    @IBOutlet weak var rightStepper1: UIStepper!

    @IBAction func changeLeft1(sender: UIStepper) {
        leftScore1.text = String(Int(sender.value))
    }

    @IBAction func changeRight1(sender: UIStepper) {
        rightScore1.text = String(Int(sender.value))
    }

    @IBAction func leftBtnOne1(sender: AnyObject) {
        leftStepper1.value = 0
        leftScore1.text = "0"
    }
    @IBAction func leftBtnTen1(sender: AnyObject) {
        leftStepper1.value = 10
        leftScore1.text = "10"
    }

    @IBAction func rightBtnZero1(sender: AnyObject) {
        rightStepper1.value = 0
        rightScore1.text = "0"
    }

    @IBAction func rightBtnTen1(sender: AnyObject) {
        rightStepper1.value = 10
        rightScore1.text = "10"
    }


    //2
    @IBOutlet weak var cell2: UIView!

    @IBOutlet weak var leftScore2: UILabel!
    @IBOutlet weak var rightScore2: UILabel!
    @IBOutlet weak var leftStepper2: UIStepper!
    @IBOutlet weak var rightStepper2: UIStepper!

    @IBAction func changeLeft2(sender: UIStepper) {
        leftScore2.text = String(Int(sender.value))
    }

    @IBAction func changeRight2(sender: UIStepper) {
        rightScore2.text = String(Int(sender.value))
    }

    @IBAction func leftBtnZero2(sender: AnyObject) {
        leftStepper2.value = 0
        leftScore2.text = "0"
    }
    @IBAction func leftBtnTen2(sender: AnyObject) {
        leftStepper2.value = 10
        leftScore2.text = "10"
    }
    @IBAction func rightBtnZero2(sender: AnyObject) {
        rightStepper2.value = 0
        rightScore2.text = "0"
    }
    @IBAction func rightBtnTen2(sender: AnyObject) {
        rightStepper2.value = 10
        rightScore2.text = "10"
    }


    //3
    @IBOutlet weak var cell3: UIView!


    //4
    @IBOutlet weak var cell4: UIView!


    //5
    @IBOutlet weak var cell5: UIView!



    //导航
    @IBAction func onBack(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
            NSLog("关闭模态视图")
        })
    }


    @IBAction func onSave(sender: AnyObject) {
        //整理数据
        var info = MatchInfo()
        info.matchName = inningName.text!
        info.teamNameArray = ["海盐", "铎益"]

        info.inningNum = Int(inningNumStepper.value)

        for k in 1...info.inningNum {
            let stepL = cellList[k].viewWithTag(1) as! UIStepper
            let stepR = cellList[k].viewWithTag(2) as! UIStepper

            info.scoreList.append([Int(stepL.value), Int(stepR.value)])

        }

        //传输数据，成功后返回，否则弹框提示
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
            NSLog("保存成功")
        })
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        cellList = [cell1, cell2, cell3, cell4, cell5]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

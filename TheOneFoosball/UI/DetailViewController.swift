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
    @IBAction func changeName(sender: UIButton) {
        let alertView = UIAlertView()
        alertView.title = "请输入比赛名称"
        alertView.alertViewStyle = .PlainTextInput

        alertView.addButtonWithTitle("取消")
        alertView.addButtonWithTitle("确定")
        alertView.cancelButtonIndex = 0
        alertView.delegate = self
        alertView.show()
    }

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
    var stepperList: [[UIStepper]] = []
    var scoreLblList: [[UILabel]] = []

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

    @IBOutlet weak var leftScore3: UILabel!
    @IBOutlet weak var rightScore3: UILabel!
    @IBOutlet weak var leftStepper3: UIStepper!
    @IBOutlet weak var rightStepper3: UIStepper!

    @IBAction func changeLeft3(sender: UIStepper) {
        leftScore3.text = String(Int(sender.value))
    }

    @IBAction func changeRight3(sender: UIStepper) {
        rightScore3.text = String(Int(sender.value))
    }

    @IBAction func leftBtnZero3(sender: AnyObject) {
        leftStepper3.value = 0
        leftScore3.text = "0"
    }

    @IBAction func leftBtnTen3(sender: AnyObject) {
        leftStepper3.value = 10
        leftScore3.text = "10"
    }

    @IBAction func rightBtnZero3(sender: AnyObject) {
        rightStepper3.value = 0
        rightScore3.text = "0"
    }

    @IBAction func rightBtnTen3(sender: AnyObject) {
        rightStepper3.value = 10
        rightScore3.text = "10"
    }

    //4
    @IBOutlet weak var cell4: UIView!

    @IBOutlet weak var leftScore4: UILabel!
    @IBOutlet weak var rightScore4: UILabel!
    @IBOutlet weak var leftStepper4: UIStepper!
    @IBOutlet weak var rightStepper4: UIStepper!

    @IBAction func changeLeft4(sender: UIStepper) {
        leftScore4.text = String(Int(sender.value))
    }

    @IBAction func changeRight4(sender: UIStepper) {
        rightScore4.text = String(Int(sender.value))
    }

    @IBAction func leftBtnZero4(sender: AnyObject) {
        leftStepper4.value = 0
        leftScore4.text = "0"
    }

    @IBAction func leftBtnTen4(sender: AnyObject) {
        leftStepper4.value = 10
        leftScore4.text = "10"
    }

    @IBAction func rightBtnZero4(sender: AnyObject) {
        rightStepper4.value = 0
        rightScore4.text = "0"
    }

    @IBAction func rightBtnTen4(sender: AnyObject) {
        rightStepper4.value = 10
        rightScore4.text = "10"
    }


    //5
    @IBOutlet weak var cell5: UIView!

    @IBOutlet weak var leftScore5: UILabel!
    @IBOutlet weak var rightScore5: UILabel!
    @IBOutlet weak var leftStepper5: UIStepper!
    @IBOutlet weak var rightStepper5: UIStepper!

    @IBAction func changeLeft5(sender: UIStepper) {
        leftScore5.text = String(Int(sender.value))
    }

    @IBAction func changeRight5(sender: UIStepper) {
        rightScore5.text = String(Int(sender.value))
    }

    @IBAction func leftBtnZero5(sender: AnyObject) {
        leftStepper5.value = 0
        leftScore5.text = "0"
    }

    @IBAction func leftBtnTen5(sender: AnyObject) {
        leftStepper5.value = 10
        leftScore5.text = "10"
    }

    @IBAction func rightBtnZero5(sender: AnyObject) {
        rightStepper5.value = 0
        rightScore5.text = "0"
    }

    @IBAction func rightBtnTen5(sender: AnyObject) {
        rightStepper5.value = 10
        rightScore5.text = "10"
    }

    //导航
    @IBAction func onBack(sender: AnyObject) {
        self.navigationController!.popViewControllerAnimated(true)
    }

    @IBAction func onSave(sender: AnyObject) {
        //整理数据
        let info = MatchInfo()
        info.matchName = inningName.text!
        info.teamNameArray = ["海盐", "铎益"]

        info.inningNum = Int(inningNumStepper.value)
        info.hasRewarded = finishSwitch.on

        for k in 0 ..< info.inningNum {
            let steppers = stepperList[k]
            info.scoreList.append([Int(steppers[0].value), Int(steppers[1].value)])
        }

        if curMatchId == "" {
            saveMatch(info)
        } else {
            info.id = curMatchId
            saveForChange(info)
        }
    }

    func saveMatch(info: MatchInfo) {
        //传输数据，成功后返回，否则弹框提示
        let loading = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        UIApplication.sharedApplication().keyWindow?.addSubview(loading)
        loading.center = (UIApplication.sharedApplication().keyWindow?.center)!
        loading.backgroundColor = UIColor.blackColor()
        loading.alpha = 0.5
        loading.activityIndicatorViewStyle = .WhiteLarge
        loading.startAnimating()

        navigationController!.view.userInteractionEnabled = false

        Network.shareInstance.updateMatch(info, callback: { suc, e in
            loading.stopAnimating()
            self.navigationController!.view.userInteractionEnabled = true

            if suc == true {
                self.navigationController!.popViewControllerAnimated(true)
            } else {
                let alert = UIAlertView(title: "错误", message: "可能没网", delegate: nil, cancelButtonTitle: "好吧")
                alert.show()
            }
        })
    }

    var matchForSave: MatchInfo? = nil
    func saveForChange(info: MatchInfo) {
        matchForSave = info
        let alertView = UIAlertView()
        alertView.title = "提示"
        alertView.message = "您确定要修改这场比赛的结果吗？"
        alertView.addButtonWithTitle("取消")
        alertView.addButtonWithTitle("确定")
        alertView.cancelButtonIndex = 0
        alertView.delegate = self
        alertView.show()
    }

    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int){
        if buttonIndex == alertView.cancelButtonIndex {
            print("点击了取消")
        } else {
            print("点击了确认")
            let field = alertView.textFieldAtIndex(0)
            if field != nil {
                let str = field!.text
                if str != "" {
                    inningName.text = str
                }
            } else {
                saveMatch(matchForSave!)
            }
        }
    }

    var curMatchId: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        print("enter detail")

        cellList = [cell1, cell2, cell3, cell4, cell5]
        stepperList = [[leftStepper1, rightStepper1], [leftStepper2, rightStepper2], [leftStepper3, rightStepper3], [leftStepper4, rightStepper4], [leftStepper5, rightStepper5]]
        scoreLblList = [[leftScore1, rightScore1], [leftScore2, rightScore2], [leftScore3, rightScore3], [leftScore4, rightScore4], [leftScore5, rightScore5]]

        if curMatchId == "" { //创建
            initForCreate()
        } else {
            initForShowDetail()
        }
    }

    func initForCreate() {
        cell4.hidden = true
        cell5.hidden = true
    }

    func initForShowDetail() {
        let match = Network.shareInstance.getMatch(curMatchId)

        inningName.text = match.matchName
        inningNumStepper.value = Double(match.inningNum)
        inningNumLabel.text = String(match.inningNum)
        finishSwitch.on = match.hasRewarded

        var index = 0
        for score in match.scoreList {
            let steppers = stepperList[index]

            steppers[0].value = Double(score[0])
            steppers[1].value = Double(score[1])

            let lbls = scoreLblList[index]
            lbls[0].text = String(score[0])
            lbls[1].text = String(score[1])

            index += 1
        }

        for c in index ..< cellList.count {
            cellList[c].hidden = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

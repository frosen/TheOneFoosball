//
//  MatchViewController.swift
//  TheOneFoosball
//
//  Created by 卢乐颜 on 16/4/26.
//  Copyright © 2016年 luleyan. All rights reserved.
//

import UIKit

class MatchViewController: UITableViewController {
    var matchList: [MatchInfo] = []

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let vc = segue.destinationViewController as! DetailViewController
        if segue.identifier == "add" {
            print("add")
            vc.title = "新建比赛"

        } else if segue.identifier == "detail" {
            print("detail")
            vc.title = "比赛详情"

            let indexPath = self.tableView.indexPathForSelectedRow
            let index = indexPath!.row
            vc.curMatchId = matchList[index].id
        }
    }

    @IBAction func refreshList(sender: UIRefreshControl) {
        if sender.refreshing == true {
            sender.attributedTitle = NSAttributedString(string: "加载中")
            refreshInfo({
                sender.endRefreshing()
                sender.attributedTitle = NSAttributedString(string: "刷新")
            })
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load")
    }

    override func viewDidAppear(animated: Bool) {
        refreshInfo({})
    }

    func refreshInfo(callback: () -> Void) {
        Network.shareInstance.getMatchList({b, list in
            if b == false {
                let alert = UIAlertView(title: "错误", message: "可能没网", delegate: self, cancelButtonTitle: "好吧")
                alert.show()
                return
            }

            self.matchList = list.reverse() //显示时，按照生成时间倒叙排列
            self.tableView.reloadData()
            callback()
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //UITableViewDataSource 协议方法
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.matchList.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cellIdentifier = "CellIdentifier"

        let cell: MatchCell! = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath:indexPath) as? MatchCell

        let row = indexPath.row
        let info = self.matchList[row]

        //录入信息
        cell.matchName.text = info.matchName

        cell.leftTeamName.text = info.teamNameArray[0]
        cell.rightTeamName.text = info.teamNameArray[1]

        //比分
        let scoreList = info.scoreList
        var leftWin = 0
        var rightWin = 0
        for scoreTab in scoreList {
            if scoreTab[0] > scoreTab[1] {
                leftWin += 1
            } else if scoreTab[0] < scoreTab[1] {
                rightWin += 1
            }
        }
        cell.leftTeamScore.text = String(leftWin)
        cell.rightTeamScore.text = String(rightWin)

        let color = UIColor(red: 0.0, green: 0.0, blue: 0.7, alpha: 1.0)
        if leftWin > rightWin {
            cell.leftTeamName.textColor = color
        } else if leftWin < rightWin {
            cell.rightTeamName.textColor = color
        }

        //小分
        var scoreString: String = ""
        for scoreTab in scoreList {
            scoreString += String(scoreTab[0]) + ":" + String(scoreTab[1]) + ", "
        }
        cell.scoreDetail.text = scoreString

        //其他
        let fmt = NSDateFormatter()
        fmt.dateFormat = "MM月dd日"
        let date: String = fmt.stringFromDate(info.createTime!)
        cell.date.text = date

        cell.finishShow.text = info.hasRewarded ? "已兑现" : "未兑现"
        cell.finishShow.textColor = info.hasRewarded ? color : UIColor.redColor()

        return cell
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 66.0
    }
}

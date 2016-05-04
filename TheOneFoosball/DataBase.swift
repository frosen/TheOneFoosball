//
//  DataBase.swift
//  TheOneFoosball
//
//  Created by luleyan on 16/4/20.
//  Copyright © 2016年 luleyan. All rights reserved.
//

import Foundation

/*
 比赛：
     id 标示 string,
     matchName 名字 string，
     teamNameArray 比赛双方 [id],
     remarks 备注 string，
     inningNum 局数 int，
     scoreList 比分 [(int, int),]，
     hasRewarded 是否兑现 bool
     createTime 时间 NSDate
 */
class MatchInfo {
    var id: String = ""
    var matchName: String = ""
    var teamNameArray: [String] = []
    var remarks: String = ""
    var inningNum: Int = 1
    var scoreList: [[Int]] = []
    var hasRewarded: Bool = false
    var createTime: NSDate?
}

//导演类，所有的UI，网络等交互在此联结
class Director {
    //-------------------------------| 内部组合 |------------------------------------------
    private let net: Network

    //-------------------------------| 数据缓存 |------------------------------------------
    var matchList: [MatchInfo] = [] //比赛结果


    //-------------------------------| 单例 |--------------------------------------------
    static let shareInstance = Director()
    private init() {
        net = Network.shareInstance
    }

    //-------------------------------| 比赛数据 |------------------------------------------
    //创建或者更新一场比赛
    func saveMatch(match: MatchInfo, callback: (suc: Bool, e: NSError?) -> Void) {
        //上传
        net.updateMatch(match, callback: { b, e in
            if b == true {
                //刷新内存数据

                //刷新本地保存数据
            }
            callback(suc: b, e: e)
        })
    }

    //刷新比赛数据，从服务器获取
    func refreshMatch(callback: (suc: Bool, list: [MatchInfo]) -> Void) {
        net.getMatchList({ b, l in
            if b == true {
                //显示时，按照生成时间倒叙排列
                let lRev: [MatchInfo] = l.reverse()

                //刷新内存数据

                //刷新本地保存数据
                self.matchList = lRev
            }
            callback(suc: b, list: l)
        })
    }

    //快速获取比赛数据，如果内存没有，则使用本地数据
    func getMatchListFast() -> [MatchInfo] {
        if matchList.count == 0 {
            //获取本地保存的matchlist
            return matchList //todo lly
        } else {
            return matchList
        }
    }

    //获取信息
    func getMatch(id: String) -> MatchInfo? {
        if matchList.count == 0 {
            return nil
        } else {
            for match in matchList {
                if match.id == id {
                    return match
                }
            }
            return nil
        }
    }
    
}

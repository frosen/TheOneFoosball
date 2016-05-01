//
//  Network.swift
//  TheOneFoosball
//
//  Created by 卢乐颜 on 16/4/18.
//  Copyright © 2016年 luleyan. All rights reserved.
//

/*
 比赛：
 matchName 名字 string，
 teamNameArray 比赛双方 [id],
 remarks 备注 string，
 inningNum 局数 int，
 scoreList 比分 [(int, int),]，
 hasRewarded 是否兑现 bool

 */

import Foundation

class Network {

    //单例
    static let shareInstance = Network()
    private init() {
        AVOSCloud.setApplicationId("o5nq2XE8H5XUlo9S94F9tioJ-gzGzoHsz", clientKey: "vJrjiBn25QQ4FmvIKhVx8bQ2")
    }

    //创建一场比赛
    func createMatch(match: MatchInfo, callback: (suc: Bool, e: NSError?) -> Void) {
        print("create match")

        let obj = AVObject(className: "match_list")

        obj.setObject(match.matchName, forKey: "matchName")
        obj.setObject(match.teamNameArray, forKey: "teamNameArray")
        obj.setObject(match.remarks, forKey: "remarks")
        obj.setObject(match.inningNum, forKey: "inningNum")
        obj.setObject(match.scoreList, forKey: "scoreList")
        obj.setObject(match.hasRewarded, forKey: "hasRewarded")

        let option = AVSaveOption()
        option.fetchWhenSave = true

        obj.saveInBackgroundWithOption(option, block: callback)
    }

    //更新比赛
    func updateMatch(match: MatchInfo) {

    }

    //获取比赛信息表
    func getMatchList(callback: (suc: Bool, list: [MatchInfo]) -> Void) {
        let q = AVQuery(className: "match_list")
        let objList = q.findObjects()

        AVObject.fetchAllIfNeededInBackground(objList, block: {list, e in
            if list == nil {
                callback(suc: false, list: [])
                return
            }

            let objList = list as! [AVObject]
            var matchList: [MatchInfo] = []

            for obj in objList {
                let match = MatchInfo()
                match.id = obj.objectId as String
                match.matchName = obj.objectForKey("matchName") as! String
                match.teamNameArray = obj.objectForKey("teamNameArray") as! [String]
                match.remarks = obj.objectForKey("remarks") as! String
                match.inningNum = obj.objectForKey("inningNum") as! Int
                match.scoreList = obj.objectForKey("scoreList") as! [[Int]]
                match.hasRewarded = obj.objectForKey("hasRewarded") as! Bool
                match.createTime = obj.createdAt
                matchList.append(match)
            }

            callback(suc: true, list: matchList)
        })

    }
}

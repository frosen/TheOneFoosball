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
    func createMatch(match: MatchInfo) {
        print("create match")

        let obj = AVObject(className: "match_list")

        obj.setObject(match.matchName, forKey: "matchName")
        obj.setObject(match.teamNameArray, forKey: "teamNameArray")
        obj.setObject(match.remarks, forKey: "remarks")
        obj.setObject(match.inningNum, forKey: "inningNum")
        obj.setObject(match.scoreList, forKey: "scoreList")
        obj.setObject(match.hasRewarded, forKey: "hasRewarded")

        obj.save()
    }

    //更新比赛
    func updateMatch(match: MatchInfo) {

    }

    //获取比赛信息表
    func getMatchList() ->[MatchInfo] {

        return []
    }
}

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
     matchName 名字 string，
     teamNameArray 比赛双方 [id],
     remarks 备注 string，
     inningNum 局数 int，
     scoreList 比分 [(int, int),]，
     hasRewarded 是否兑现 bool

 */
class MatchInfo {
    var matchName: String = ""
    var teamNameArray: [Int] = []
    var remarks: String = ""
    var inningNum: Int = 1
    var scoreList: [[Int]] = []
    var hasRewarded: Bool = false
}

class DataHolder {

    var matchList: [MatchInfo]

    //单例
    static let shareInstance = DataHolder()
    private init() {
        matchList = []
    }
}
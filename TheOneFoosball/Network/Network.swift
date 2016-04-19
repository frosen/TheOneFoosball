//
//  Network.swift
//  TheOneFoosball
//
//  Created by 卢乐颜 on 16/4/18.
//  Copyright © 2016年 luleyan. All rights reserved.
//

/*
比赛：名字string，比赛双方[id], 备注string，局数int，比分[(int, int),]，是否兑现bool
 
 
*/

import Foundation

class Network {

    //单例
    static let shareInstance = Network()
    private init() {
        AVOSCloud.setApplicationId("o5nq2XE8H5XUlo9S94F9tioJ-gzGzoHsz", clientKey: "vJrjiBn25QQ4FmvIKhVx8bQ2")
    }

    //创建一场比赛
    func createMatch() {
        print("create match")

        let score = [[10, 4], [10, 6]]
        let a = AVObject(className: "match_list")
        a.setObject(score, forKey: "score")
        a.save()
    }

    //更新比赛
    func updateMatch() {

    }

    //获取比赛信息表
    func getMatchList() {

    }
}

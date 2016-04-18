//
//  Network.swift
//  TheOneFoosball
//
//  Created by 卢乐颜 on 16/4/18.
//  Copyright © 2016年 luleyan. All rights reserved.
//

import Foundation

class Network: NSObject {
    class func show() {
        print("it is net work")

        AVOSCloud.setApplicationId("QPW1yJeKPAorks0WcvN6p9eJ-gzGzoHsz", clientKey: "Ig7tiLhuj5CeXKzwE0DIeg4u")

        let a = AVObject(className: "haha")
        a.setObject("one", forKey: "two")
        a.save()
    }
}

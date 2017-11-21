//
//  Model.swift
//  SwiftSearchDemo
//
//  Created by 高鑫 on 2017/11/21.
//  Copyright © 2017年 高鑫. All rights reserved.
//

import Foundation
import UIKit

struct Marvel {
    var img = String()
    var name = String()
    var date = String()
}

class Movie {
    static let movies : [Marvel] = [
        Marvel(img: "fulian", name: "复仇者联盟", date: "2012-05-05"),
        Marvel(img: "gangtiexia", name: "钢铁侠", date: "2008-04-30"),
        Marvel(img: "leishen", name: "雷神", date: " 2011-05-08"),
        Marvel(img: "meidui", name: "美国队长", date: "2011-09-09"),
        Marvel(img: "qiyi", name: "奇异博士", date: "2016-11-04"),
        Marvel(img: "yinhe", name: "银河护卫队", date: "2014-10-10"),
        Marvel(img: "zhizhuxia", name: "蜘蛛侠:英雄归来", date: "2017-09-08"),
    ]
}

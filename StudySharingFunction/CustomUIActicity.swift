//
//  CustomUIActicity.swift
//  StudySharingFunction
//
//  Created by ls on 2018/4/28.
//  Copyright © 2018年 ls. All rights reserved.
//

import UIKit

class CustomUIActicity: UIActivity {
    //分享的标题
    override var activityTitle: String? {
        return "一品大帅"
    }
    //分享的LOGO
    override var activityImage: UIImage? {
        return UIImage.init(named: "icon_tab1_select")
    }
    //提供的服务类型的标识符
    override var activityType: UIActivityType? {
        return UIActivityType.init(CustomUIActicity.self.description())
    }
    //分享类型
    override class var activityCategory: UIActivityCategory {
        return .action
    }
    ///此处对要分享的内容做操作
    override func prepare(withActivityItems activityItems: [Any]) {
       activityDidFinish(true)
    }
    ///此处预判断下，是否允许进行分享
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        return true
    }
}

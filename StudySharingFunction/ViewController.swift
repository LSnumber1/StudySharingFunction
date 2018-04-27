//
//  ViewController.swift
//  StudySharingFunction
//
//  Created by ls on 2018/4/25.
//  Copyright © 2018年 ls. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        share()
    }
}

extension ViewController {
    func share() {
        var textToShare = "分享的标题。"
        //分享的图片
        var imageToShare = #imageLiteral(resourceName: "icon_tab1_select")
        //分享的url
//        var urlToShare = URL(string: "http://www.baidu.com")
        //分享的视频
        var urlToShareVideo = URL(fileURLWithPath: Bundle.main.path(forResource: "test", ofType: "mp4") ?? "")
        //在这里呢 如果想分享图片 就把图片添加进去  文字什么的通上
        var activityItems = [textToShare,imageToShare] as [Any]
        var activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        //不出现在活动项目
        activityVC.excludedActivityTypes = [.print, .copyToPasteboard, .assignToContact, .saveToCameraRoll]
        present(activityVC, animated: true) {() -> Void in }
        // 分享之后的回调
        activityVC.completionWithItemsHandler = {(_ activityType: UIActivityType?, _ completed: Bool, _ returnedItems: [Any]?, _ activityError: Error?) -> Void in
            if completed {
                print("completed")
                //分享 成功
            } else {
                print("cancled")
                //分享 取消
            }
        }
    }
}


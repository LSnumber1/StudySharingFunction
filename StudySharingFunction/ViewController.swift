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
    }
}
//MARK: - 点击事件
extension ViewController {
    @IBAction func shareTextImageAction(_ sender: Any) {
        shareTextImage()
    }
    @IBAction func shareVideoAction(_ sender: Any) {
        shareVideo()
    }
    @IBAction func shareCustomUIActivityAction(_ sender: Any) {
        shareCustomUIActivity()
    }
}
//MARK: - 分享
extension ViewController {
    ///分享自定义UIActivity
    func shareCustomUIActivity() {
        let toVC = UIActivityViewController(activityItems: ["分享的标题"], applicationActivities: [CustomUIActicity()])
        present(toVC, animated: true, completion: nil)
        toVC.completionWithItemsHandler = {(_ activityType: UIActivityType?, _ completed: Bool, _ returnedItems: [Any]?, _ activityError: Error?) -> Void in
             print(completed ? "成功" : "失败")
        }
    }
    ///分享的文字，图片，链接
    func shareTextImage() {
        let textShare = "分享的标题。"
        let imageShare = #imageLiteral(resourceName: "icon_tab1_select")
        let urlShare = URL(string: "http://www.baidu.com")
        let activityItems = [textShare,imageShare,urlShare] as [Any]
        let toVC = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        present(toVC, animated: true, completion: nil)
    }
    ///分享的视频
    func shareVideo() {
        let videoUrl = URL(fileURLWithPath: Bundle.main.path(forResource: "test", ofType: "mp4") ?? "")
        let toVC = UIActivityViewController(activityItems: [videoUrl] , applicationActivities: nil)
        present(toVC, animated: true, completion: nil)
    }
}


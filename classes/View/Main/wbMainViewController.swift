//
//  wbMainViewController.swift
//  weibo
//
//  Created by ZY H on 2020/3/14.
//  Copyright © 2020 ZY H. All rights reserved.
//

import UIKit

class wbMainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
              setupChildcontrollers()
        setupComposeButton()
        // Do any additional setup after loading the view.
    }
    private lazy var composeButton: UIButton = UIButton.cz_imageButton(
          "tabbar_compose_icon_add",
          backgroundImageName: "tabbar_compose_button")
//按钮监听方法
    @objc private func composeStatus() {
        print("撰写微博")
    }
}
extension wbMainViewController{
    /// 设置撰写按钮
       private func setupComposeButton() {
           tabBar.addSubview(composeButton)
           
           // 计算按钮的宽度
        let count = CGFloat(children.count)
           // 将向内缩进的宽度
           let w = tabBar.bounds.width / count-1
           
           // CGRectInset 正数向内缩进，负数向外扩展
           composeButton.frame = tabBar.bounds.insetBy(dx: 2 * w, dy: 0)
           print("撰写按钮宽度 \(composeButton.bounds.width)")
           
           // 按钮监听方法
           composeButton.addTarget(self, action: #selector(composeStatus), for: .touchUpInside)
       }
       
    private func setupChildcontrollers(){
        
        let array = [
            ["clsname":"wbhomeViewController","title" : "首页","imagename":"home"],
            ["clsname":"wbmessageViewController","title":"消息","imagename":"message_center"],
            ["clsname":"UIViewController"],
            ["clsname":"wbdiscoverViewController","title" : "发现","imagename":"discover"],
            ["clsname":"wbprofileViewController","title" : "我","imagename":"profile"],

        ]
        var arraym = [UIViewController]()
        for dict in array {
            arraym.append(controller(dict:dict))
        }
viewControllers = arraym
        
    }
    private func controller(dict:[String:String]) ->UIViewController{
        guard let clsname = dict["clsname"],
            let title = dict["title"],
            let imagename = dict["imagename"],
            let cls = NSClassFromString(Bundle.main.namespace + "." + clsname) as? UIViewController.Type
        else{
                return UIViewController()
                
        }
        let vc = cls.init()
        vc.title = title
        vc.tabBarItem.image = UIImage(named: "tabbar_" + imagename)
        vc.tabBarItem.selectedImage = UIImage(named: "tabbar_" + imagename+"_selected")?.withRenderingMode(.alwaysOriginal)
        
        //设置字体
        vc.tabBarItem.setTitleTextAttributes(
            [NSAttributedString.Key.foregroundColor: UIColor.orange],
                   for: .highlighted);
        vc.tabBarItem.setTitleTextAttributes(
            [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)],
                  for: UIControl.State(rawValue: 0))
              //实例化控制器的时候，会调用push
        let nav = wbnavigationController(rootViewController: vc)
        return nav
        
    }
}

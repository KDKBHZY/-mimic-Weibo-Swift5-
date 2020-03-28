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
        // Do any additional setup after loading the view.
    }


}
extension wbMainViewController{

    private func setupChildcontrollers(){
        
        let array = [
            ["clsname":"wbhomeViewController","title" : "首页","imagename":"home"],
            ["clsname":"wbmessageViewController","title" : "消息","imagename":"message_center"],

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
        let nav = wbnavigationController(rootViewController: vc)
        return nav
        
    }
}

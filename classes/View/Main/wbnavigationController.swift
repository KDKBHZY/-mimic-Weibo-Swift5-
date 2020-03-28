//
//  wbnavigationController.swift
//  weibo
//
//  Created by ZY H on 2020/3/14.
//  Copyright © 2020 ZY H. All rights reserved.
//

import UIKit

class wbnavigationController: UINavigationController {
    //重写push
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        print(viewController)
        //如果不是根控制器，就隐藏
        if children.count > 0 {
        //隐藏底部的 Tabbar
        viewController.hidesBottomBarWhenPushed = true
        }
        super .pushViewController(viewController, animated: true)
    }

}

//
//  wbnavigationController.swift
//  weibo
//
//  Created by ZY H on 2020/3/14.
//  Copyright © 2020 ZY H. All rights reserved.
//

import UIKit

class wbnavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        //隐藏默认的navigationBar
        navigationBar.isHidden = true
    }
    //重写push
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        //如果不是根控制器，就隐藏
        if children.count > 0 {
        //隐藏底部的 Tabbar
        viewController.hidesBottomBarWhenPushed = true
            if let vc = viewController as? wbbaseViewController{
                       
                       //判断控制器级数
                if children.count == 1{
                    print("finish")
  vc.navitem.leftBarButtonItem = UIBarButtonItem(title: "首页", target: self,action: #selector(back),isBack:true)                }
                       
                       
                       //取出navitem
               else
                {vc.navitem.leftBarButtonItem = UIBarButtonItem(title: "返回", target: self,action: #selector(back),isBack:true)}
        }
       
       
        }
         super .pushViewController(viewController, animated: true)
       
        }
    @objc private func back(){
               popViewController(animated: true)
    }

}

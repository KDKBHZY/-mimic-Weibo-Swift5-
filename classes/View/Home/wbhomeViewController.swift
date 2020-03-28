//
//  wbhomeViewController.swift
//  weibo
//
//  Created by ZY H on 2020/3/14.
//  Copyright © 2020 ZY H. All rights reserved.
//

import UIKit

class wbhomeViewController: wbbaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @objc private func showfriends(){
           print(#function)
           let vc = WBdemoViewController()
           //vc.hidesBottomBarWhenPushed = true
           navigationController?.pushViewController(vc, animated: true)
           
       }
}
//设置界面
extension wbhomeViewController{
    override func setupui() {
        super.setupui()
         navigationItem.leftBarButtonItem = UIBarButtonItem(title: "好友", style :.plain, target:self, action:#selector(showfriends) )
    }
 
}

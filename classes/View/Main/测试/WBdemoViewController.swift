//
//  WBdemoViewController.swift
//  传智微博
//
//  Created by ZY H on 2020/3/28.
//  Copyright © 2020 ZY H. All rights reserved.
//

import UIKit

class WBdemoViewController: wbbaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "第\(navigationController?.children.count ?? 0)个"
    }
//监听方法
    @objc private func shownext(){
        let vc = WBdemoViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
}
extension WBdemoViewController{
    //重写
  @objc  override func setuptableview() {
        super .setuptableview()
         navitem.rightBarButtonItem = UIBarButtonItem(title: "下一个", target: self, action: #selector(shownext))
    }
    
}

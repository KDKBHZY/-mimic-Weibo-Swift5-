//
//  wbbaseViewController.swift
//  weibo
//
//  Created by ZY H on 2020/3/14.
//  Copyright © 2020 ZY H. All rights reserved.
//

import UIKit

class wbbaseViewController: UIViewController {
     lazy var navigationbar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 74))
    //自定义导航条目

    lazy var navitem = UINavigationItem()

   
    //自定义导航条
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupui()
        // Do any additional setup after loadin@objc @objc @objc @objc @objc g the view.
    }
   
   override var title: String?{
          didSet{
              navitem.title = title
          }
      }
}
 //设置界面
extension wbbaseViewController{
    @objc func setupui(){
        view.backgroundColor = UIColor.cz_random()
        //设置导航栏
        view.addSubview(navigationbar)
//        将item给bar
        navigationbar.items = [navitem]
        //设置navbar color
         // 1> 设置 navBar 整个背景的渲染颜色
             navigationbar.barTintColor = UIColor.cz_color(withHex: 0xF6F6F6)
             // 2> 设置 navBar 的字体颜色
        navigationbar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
             // 3> 设置系统按钮的文字渲染颜色
        navigationbar.tintColor = UIColor.orange
        
    }
   }

//
//  wbbaseViewController.swift
//  weibo
//
//  Created by ZY H on 2020/3/14.
//  Copyright © 2020 ZY H. All rights reserved.
//

import UIKit
//oc不能多继承，使用协议替代
class wbbaseViewController: UIViewController {
   
    
    //表格视图
    var tableview:UITableView?
    
     lazy var navigationbar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 74))
    //自定义导航条目

    lazy var navitem = UINavigationItem()

   
    //自定义导航条
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupui()
loaddata()
    }
   
   override var title: String?{
          didSet{
              navitem.title = title
          }
      }
    //具体实现由子类实现
    func loaddata(){
        
    }
}
 //设置界面
extension wbbaseViewController{
    @objc func setupui(){
        view.backgroundColor = UIColor.cz_random()
        setuptableview()

      setupnavigationbar()
        
    }
//    设置导航条
    private func setupnavigationbar(){
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
    //设置表格视图
    private func setuptableview(){
        tableview = UITableView(frame: view.bounds, style: .plain)
              //设置数据源代理，
        tableview?.dataSource = self
        tableview?.delegate = self
        view.insertSubview(tableview!, belowSubview: navigationbar)
    }
   }
extension wbbaseViewController:UITableViewDelegate,UITableViewDataSource{
    
          // 基类只是准备方法，子类负责具体的实现
          // 子类的数据源方法不需要 super
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 10
       }
    
}

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
    var visitInfodict:[String:String]?
   //用户登录
    //表格视图
    var tableview:UITableView?
    var refreshControl:UIRefreshControl?
    //下拉刷新标记
    var isPullup = false
    lazy var navigationbar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.cz_screenWidth(),  height: 74))
    //自定义导航条目

    lazy var navitem = UINavigationItem()

   
    //自定义导航条
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupui()
        WBnetworktools.shared.userlogin ? loaddata() : nil
    }
   
   override var title: String?{
          didSet{
              navitem.title = title
          }
      }
    //具体实现由子类实现
    @objc func loaddata(){
        //如果子类不实现，默认关闭
        refreshControl?.endRefreshing()
    }
}
 //设置界面
extension wbbaseViewController{
    @objc private  func setupui(){
        view.backgroundColor = UIColor.white
        //取消自动缩进
        automaticallyAdjustsScrollViewInsets = false
         setupnavigationbar()
        if WBnetworktools.shared.userlogin {
            setuptableview()
            
        } else{setupVisitview()}

     
        
        
    }
    //访客视图
    private func setupVisitview(){
        let visitview = WBvisitorView(frame: view.bounds)
       view.insertSubview(visitview, belowSubview: navigationbar)
        visitview.visitorInfo = visitInfodict
        visitview.loginbut.addTarget(self, action:#selector(login), for: .touchUpInside)
        visitview.regisisterbut.addTarget(self, action:#selector(register), for: .touchUpInside)
//设置导航条按钮
        navitem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: .plain, target: self, action: #selector(register))
        navitem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: .plain, target: self, action: #selector(login))
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
    //设置表格视图(子类重写此方法)
    @objc func setuptableview(){
        tableview = UITableView(frame: view.bounds, style: .plain)
              //设置数据源代理，
        tableview?.dataSource = self
        tableview?.delegate = self
        view.insertSubview(tableview!, belowSubview: navigationbar)
        //设置内容锁紧
        tableview?.contentInset = UIEdgeInsets(top: navigationbar.bounds.height, left: 0, bottom: 0, right: 0)
        //设置刷新控件
        refreshControl = UIRefreshControl()
        //修改指示器锁紧
        tableview?.scrollIndicatorInsets = tableview!.contentInset
        //添加到表格视图
        tableview?.addSubview(refreshControl!)
        refreshControl?.addTarget(self, action: #selector(loaddata), for: .valueChanged)
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
    //在显示最后一行刷新
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //判定index是不是最后一行
        let row = indexPath.row
        let section  = tableView.numberOfSections - 1
        let count = tableView.numberOfRows(inSection: section)
        if (row == count-1) && !isPullup {
            print("沙拉刷新")
            isPullup = true
            loaddata()
        }
       
        
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//           return 10
//       }
    
}
//监听访客视图
extension wbbaseViewController{
    @objc private func login(){
        
        print("用户登录")
        //发送通知
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: wbusershouldlogin), object: nil)
    }
    @objc private func register(){
          print("用户注册")
      }
}

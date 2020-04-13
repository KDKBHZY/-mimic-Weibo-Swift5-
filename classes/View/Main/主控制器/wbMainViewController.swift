//
//  wbMainViewController.swift
//  weibo
//
//  Created by ZY H on 2020/3/14.
//  Copyright © 2020 ZY H. All rights reserved.
//

import UIKit

class wbMainViewController: UITabBarController {
    //定时器
    private var timer:Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
              setupChildcontrollers()
        setupComposeButton()
        setuptimer()
        //设置新特性
        setupNewfeatureViews()
      //设置代理
        delegate = self
        //注册通知
        NotificationCenter.default.addObserver(self, selector: #selector(userlogin), name: NSNotification.Name(rawValue: wbusershouldlogin), object: nil)
      
    }
    deinit {
        timer?.invalidate()
        //注销通知
              NotificationCenter.default.removeObserver(self)
    }
    private lazy var composeButton: UIButton = UIButton.cz_imageButton(
          "tabbar_compose_icon_add",
          backgroundImageName: "tabbar_compose_button")
//按钮监听方法
    @objc private func composeStatus() {
        print("撰写微博")
       
        
    }
    //设置竖屏
   func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
            return .portrait
        }
    @objc func userlogin(n:Notification){
        print("用户登录通知")
        //显现登录器
        let nav = UINavigationController(rootViewController: WBOAuthViewController())
        present(nav,animated: true,completion: nil)
    }
   
}
extension wbMainViewController:UITabBarControllerDelegate{
    /// Description
    /// - Parameters:
    ///   - tabBarController: tabBarController
    ///   - viewController: 目标控制器
    /// - Returns: 是否切换到目标
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        //判断是否是UIviewcontroller
        //获取索引
        let index = (viewControllers! as NSArray).index(of: viewController)
        //判断当前为首页
        if selectedIndex == 0 && index == selectedIndex{
            print("点击首页")
        }
        //让表格滚动到顶部
        let nav = viewControllers?[0] as! UINavigationController
        let vc = nav.viewControllers[0] as! wbhomeViewController
        //滚动到顶部
        vc.tableview?.setContentOffset(CGPoint(x: 0, y: -64), animated: true)
        //刷新表格
        vc.tableview?.reloadData()
        return !viewController.isMember(of: UIViewController.self)
    }
}

extension wbMainViewController{
    /// 设置撰写按钮
       private func setupComposeButton() {
           tabBar.addSubview(composeButton)
           
           // 计算按钮的宽度
        let count = CGFloat(children.count)
           // 将向内缩进的宽度
           let w = tabBar.bounds.width / count
           
           // CGRectInset 正数向内缩进，负数向外扩展
           composeButton.frame = tabBar.bounds.insetBy(dx: 2 * w, dy: 0)
           print("撰写按钮宽度 \(composeButton.bounds.width)")
           
           // 按钮监听方法
           composeButton.addTarget(self, action: #selector(composeStatus), for: .touchUpInside)
       }
       
    private func setupChildcontrollers(){
        //获取data沙河路径
        let docDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
                   let jsonpath = (docDir as NSString).appendingPathComponent("main.json")
                  var data = NSData(contentsOfFile: jsonpath)
        //判断data是否有内容
        if data == nil{
            let path = Bundle.main.path(forResource: "main.json", ofType: nil)
            //从bundle加载
            data = NSData(contentsOfFile: path!)
        }
        //data由内容
        
        //从bundle加载json
        guard let array = try? JSONSerialization.jsonObject(with: data! as Data, options: []) as?[[String:AnyObject]]

        else{
            return
        }
//遍历数组，创建控制器
        var arraym = [UIViewController]()
        for dict in array {
            arraym.append(controller(dict: dict as [String : AnyObject]))
        }
        //设置子控制器
viewControllers = arraym
        
    }
    private func controller(dict:[String:AnyObject]) ->UIViewController{
        guard let clsname = dict["clsname"]as? String,
            let title = dict["title"]as? String,
            let imagename = dict["imagename"]as? String,
            let cls = NSClassFromString(Bundle.main.namespace + "." + clsname) as? wbbaseViewController.Type,
            let visitordict = dict["visitorInfo"] as? [String:String]
            else {
                return UIViewController()
                
        }
        let vc = cls.init()
        //设置访客信息
        vc.visitInfodict = visitordict
        vc.title = title as?String
        vc.tabBarItem.image = UIImage(named: "tabbar_" + imagename )
        vc.tabBarItem.selectedImage = UIImage(named: "tabbar_" + imagename  as! String+"_selected")?.withRenderingMode(.alwaysOriginal)
        
        //设置字体
        vc.tabBarItem.setTitleTextAttributes(
            [NSAttributedString.Key.foregroundColor: UIColor.orange],
                   for: .highlighted);
        vc.tabBarItem.setTitleTextAttributes(
            [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)],
                  for: UIControl.State(rawValue: 0))
              //实例化控制器的时候，会调用push
        let nav = wbnavigationController(rootViewController: vc)
        return nav
        
    }
}
//时钟相关方法
extension wbMainViewController{
    private func setuptimer(){
        timer = Timer.scheduledTimer(timeInterval: 30.0, target: self, selector: #selector(updatetimer), userInfo: nil, repeats: true)
       
        
    }
    @objc private func updatetimer(){
        if !WBnetworktools.shared.userlogin{
            return
        }
               WBnetworktools.shared.unreadCount(){(count) in
                //设置首页badge
                self.tabBar.items?[0].badgeValue = count>0 ? "\(count)" :nil
                   print("有\(count)条新微博")
                //设置app的badge number
                if(count > 0){
                UIApplication.shared.applicationIconBadgeNumber = count
                }
                
               }
           }
}
extension wbMainViewController {

/// 设置新特性视图
private func setupNewfeatureViews() {
    
    // 0. 判断是否登录
   
    
    // 1. 如果更新，显示新特性，否则显示欢迎
    let v = WBwelcome.welcomeView()
    // 2. 添加视图
    view.addSubview(v)
}
}

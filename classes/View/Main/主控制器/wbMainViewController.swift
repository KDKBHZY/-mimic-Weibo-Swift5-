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
        WBnetworktools.shared.unreadCount(){(count) in
            print("有\(count)条新微博")
        }
        // Do any additional setup after loading the view.
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
        vc.tabBarItem.image = UIImage(named: "tabbar_" + imagename as! String)
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

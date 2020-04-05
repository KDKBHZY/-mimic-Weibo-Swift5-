//
//  AppDelegate.swift
//  传智微博
//
//  Created by ZY H on 2020/3/27.
//  Copyright © 2020 ZY H. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.backgroundColor = UIColor.white
               window?.rootViewController = wbMainViewController()
               window?.makeKeyAndVisible()
               loadappInfo()
        return true
    }
}

extension AppDelegate{
    private func loadappInfo(){
        //模拟异步
        DispatchQueue.global().async {
//            1.url
            let url = Bundle.main.url(forResource: "main.json", withExtension: nil)
//            2.data
            let data = NSData(contentsOf:url!)
//            3.写入磁盘
            let docDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
            let jsonpath = (docDir as NSString).appendingPathComponent("main.json")
            data?.write(toFile: jsonpath, atomically: true)
            print("应用程序加载完毕\(jsonpath)")
        }
    }
}

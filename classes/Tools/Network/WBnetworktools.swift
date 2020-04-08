//
//  WBnetworktools.swift
//  传智微博
//
//  Created by ZY H on 2020/4/8.
//  Copyright © 2020 ZY H. All rights reserved.
//

import UIKit
import AFNetworking
//swift 枚举支持任意数据类型
enum WBHttpmethond {
    case Get
    case Post
}
//网络管理工具
class WBnetworktools: AFHTTPSessionManager {
    //静态区
static let shared = WBnetworktools()
 
    
    /// 使用一个函数封装两个请求gey/post
    /// - Parameters:
    ///   - methond: get/post
    ///   - URLString: Urlstring
    ///   - parameters: 参数字典
    func request(methond:WBHttpmethond = .Get, URLString:String,parameters:[String:AnyObject]){
        if methond == .Get{
             get(URLString, parameters: parameters,headers: nil, progress: nil, success: { (_, json) in
                 print(json)
             }) { (_, error) in
                print("网络请求失败")}
        }
        else{
        post(URLString, parameters: parameters, headers: nil, progress: nil, success: { (_, json) in
            print(json)
        }) { (_, error) in
            print("网络请求失败")}
        }
    }
}

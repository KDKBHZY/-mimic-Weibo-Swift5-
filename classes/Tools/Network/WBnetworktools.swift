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
    //都基于次令牌
    var accesstoken:String? = "2.00r5DZaFpALVFE63bce6e836QosGZC"
    
    func tokenRequest(methond:WBHttpmethond = .Get, URLString:String,parameters:[String:AnyObject]?,
    completion: @escaping (_ json: AnyObject?, _ isSuccess: Bool)->()){
        //判断token
        guard let token = accesstoken else {
                   
                   // 发送通知，提示用户登录
                   print("没有 token! 需要登录")
                   
//                   NotificationCenter.default.post(
//                       name: NSNotification.Name(rawValue: WBUserShouldLoginNotification),
//                       object: nil)
                   
            completion(nil, false)
                   
                   return
               }
        //如果空，创建新字典
        var parameters = parameters
        if(parameters == nil){
            parameters = [String:AnyObject]()
        }
        //设置参数字典
        parameters!["access_token"] = token as AnyObject
        request(URLString: URLString, parameters: parameters, completion: completion)

    }
    
    /// 使用一个函数封装两个请求gey/post
    /// - Parameters:
    ///   - methond: get/post
    ///   - URLString: Urlstring
    ///   - parameters: 参数字典
    func request(methond:WBHttpmethond = .Get, URLString:String,parameters:[String:AnyObject]?,
              completion: @escaping (_ json: AnyObject?, _ isSuccess: Bool)->()){
         let success = { (task: URLSessionDataTask, json: Any?)->() in
                   
            completion(json as AnyObject?, true)
               }
               
        let failure = { (task: URLSessionDataTask?, error: Error)->() in
                   print("网络请求错误\(error)")
            completion(nil, false)
               }
               
        if methond == .Get{
            get(URLString, parameters: parameters, headers: nil, progress: nil, success: success , failure: failure)
//             get(URLString, parameters: parameters,headers: nil, progress: nil, success: { (_, json) in
//                 print(json)
//             }) { (_, error) in
//                print("网络请求失败")}
        }
        else{
//        post(URLString, parameters: parameters, headers: nil, progress: nil, success: { (_, json) in
//            print(json)
//        }) { (_, error) in
//            print("网络请求失败")}
        }
    }
}

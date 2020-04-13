//
//  WBuseraccount.swift
//  传智微博
//
//  Created by ZY H on 2020/4/12.
//  Copyright © 2020 ZY H. All rights reserved.
//
 public let accountfile:NSString = "useraccount.json"
import UIKit
//用户账户信息
class WBuseraccount: NSObject {
    //访问令牌
    var access_token:String? = "2.00r5DZaFpALVFE63bce6e836QosGZC"
    //用户id
    var uid:String? = "5120966809"
    //开发者5年
    //过期日期
    var remind_in: Date?
    var screen_name = "KDKB2435"
    var avatar_large = "https://tvax4.sinaimg.cn/crop.0.0.749.749.180/005Az3oRly8fjshna54d6j30ku0kt0tg.jpg?KID=imgbed,tva&Expires=1586787304&ssig=Pr8qAZi5O6"

       var isRealName:Bool?
    var expires_in:String?
//    TimeInterval = 0 {
//        didSet {
//            remind_in = Date(timeIntervalSinceNow: expires_in)
//        }
//    }
   
    override class func description() -> String {
        return yy_modelDescription()
    }
    override init() {
        super.init()
        guard   let path = accountfile.cz_appendDocumentDir(),
            let data = NSData(contentsOfFile: path),
            let dict = try? JSONSerialization.jsonObject(with: data as Data, options: []) as?[String:AnyObject] else{
                return
        }
       
        
        
    }
    
    func saveAccount()  {
       
    }
}

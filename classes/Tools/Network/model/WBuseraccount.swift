//
//  WBuseraccount.swift
//  传智微博
//
//  Created by ZY H on 2020/4/12.
//  Copyright © 2020 ZY H. All rights reserved.
//

import UIKit
//用户账户信息
class WBuseraccount: NSObject {
    //访问令牌
    var access_token:String? //= "2.00r5DZaFpALVFE63bce6e836QosGZC"
    //用户id
    var uid:String?
    //开发者5年
    //过期日期
    var remind_in: Date?
       var isRealName:Bool?
    var expires_in: TimeInterval = 0 {
        didSet {
            remind_in = Date(timeIntervalSinceNow: expires_in)
        }
    }
   
    override class func description() -> String {
        return yy_modelDescription()
    }
    
    func saveAccount()  {
       
    }
}

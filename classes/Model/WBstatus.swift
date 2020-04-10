//
//  WBstatus.swift
//  传智微博
//
//  Created by ZY H on 2020/4/10.
//  Copyright © 2020 ZY H. All rights reserved.
//

import UIKit
import YYModel
//微博数据模型
class WBstatus: NSObject {
   @objc var id:Int64 = 0
   @objc var text: String?
    override var description: String{
        return yy_modelDescription()
    }
}

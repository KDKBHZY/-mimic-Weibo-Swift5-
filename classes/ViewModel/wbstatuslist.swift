//
//  wbstatuslist.swift
//  传智微博
//
//  Created by ZY H on 2020/4/10.
//  Copyright © 2020 ZY H. All rights reserved.
//

import Foundation
class WBStatusListViewModel {

/// 微博视图模型数组懒加载
lazy var statusList = [WBstatus]()
/// 上拉刷新错误次数
    func loadStatus(completion:@escaping (_ isSuccess: Bool)->())  {
        WBnetworktools.shared.statusList { (list, isSuccess) in
            //1.字典转模型
            guard let array = NSArray.yy_modelArray(with: WBstatus.self, json: list ?? [])as? [WBstatus] else{
                completion(isSuccess)
                return
            }
            //2、拼接
            self.statusList += array
            //3.完成回调
            completion(isSuccess)
        }
    }
}

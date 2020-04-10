//
//  wbstatuslist.swift
//  传智微博
//
//  Created by ZY H on 2020/4/10.
//  Copyright © 2020 ZY H. All rights reserved.
//

import Foundation
private let maxPullupTryTimes = 3

class WBStatusListViewModel {
    private var pullupErrorTimes = 0

/// 微博视图模型数组懒加载
lazy var statusList = [WBstatus]()
/// 上拉刷新错误次数
    func loadStatus(_ pullup:Bool,completion:@escaping ( _ isSuccess: Bool,_ shouldRefresh:Bool)->())  {
        if pullup && pullupErrorTimes > maxPullupTryTimes {
                   
            completion(true, false)
                   
                   return
               }
        // since_id 取出数组中第一条微博的 id
        let since_id = pullup ? 0 : (statusList.first?.id ?? 0)
               // 上拉刷新，取出数组的最后一条微博的 id
        let max_id = !pullup ? 0 : (statusList.last?.id ?? 0)
        WBnetworktools.shared.statusList(since_id: 0, max_id:0)  { (list, isSuccess) in
            //1.字典转模型
            guard let array = NSArray.yy_modelArray(with: WBstatus.self, json: list ?? [])as? [WBstatus] else{
                completion(isSuccess,false)
                return
            }
            //拼接在数组前面
            // 2. 拼接数据
                       if pullup {
                           // 上拉刷新结束后，将结果拼接在数组的末尾
                           self.statusList += array
                       } else {
                           // 下拉刷新，应该将结果数组拼接在数组前面
                           self.statusList = array + self.statusList
                       }
            if pullup && array.count == 0 {
                
                self.pullupErrorTimes += 1
                
                completion(isSuccess, false)
            }else{
                //3.完成回调
                           completion(isSuccess, true)
            }
           
        }
    }
}

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
lazy var statusList = [WBStatusListViewModel]()
/// 上拉刷新错误次数
private var pullupErrorTimes = 0
}

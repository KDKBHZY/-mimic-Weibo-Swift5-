//
//  WBwelcome.swift
//  传智微博
//
//  Created by ZY H on 2020/4/13.
//  Copyright © 2020 ZY H. All rights reserved.
//

import UIKit

class WBwelcome: UIView {
   
    class func welcomeView() ->WBwelcome {
        
        let nib = UINib(nibName: "wbwelcomeview", bundle: nil)
        
        let v = nib.instantiate(withOwner: nil, options: nil)[0] as! WBwelcome
        
        // 从 XIB 加载的视图，默认是 600 * 600 的
    v.frame = UIScreen.main.bounds
        
        return v
    }
   
   required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // 提示：initWithCode 只是刚刚从 XIB 的二进制文件将视图数据加载完成
        // 还没有和代码连线建立起关系，所以开发时，千万不要在这个方法中处理 UI
       // print("initWithCoder + \(iconView)")
    }

}

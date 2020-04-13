//
//  wbtitlebutton.swift
//  传智微博
//
//  Created by ZY H on 2020/4/13.
//  Copyright © 2020 ZY H. All rights reserved.
//

import UIKit

class wbtitlebutton: UIButton {

    init(title: String?) {
           super.init(frame: CGRect())
           
           // 1> 判断 title 是否为 nil
           if title == nil {
               setTitle("首页", for: [])
           } else {
               setTitle(title! + " ", for: [])
               
               // 设置图像
               setImage(UIImage(named: "navigationbar_arrow_down"), for: [])
               setImage(UIImage(named: "navigationbar_arrow_up"), for: .selected)
           }
           
           // 2> 设置字体和颜色
           titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        setTitleColor(UIColor.darkGray, for: [])
           
           // 3> 设置大小
           sizeToFit()
       }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

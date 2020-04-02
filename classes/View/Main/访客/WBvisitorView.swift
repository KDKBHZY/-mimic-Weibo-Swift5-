//
//  WBvisitorView.swift
//  传智微博
//
//  Created by ZY H on 2020/4/2.
//  Copyright © 2020 ZY H. All rights reserved.
//

import UIKit
//访客视图
class WBvisitorView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupui()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension WBvisitorView{
    func setupui() {
        backgroundColor = UIColor.white
    }
}

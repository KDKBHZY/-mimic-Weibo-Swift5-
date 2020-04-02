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
    private lazy var iconview = UIImageView(image: UIImage(named:"visitordiscover_feed_image_smallicon"))
    private lazy var houseview = UIImageView(image: UIImage(named:"visitordiscover_feed_image_house"))
    private lazy var tiplabel:UILabel = UILabel.cz_label(withText: "关注一些人，看看有什么惊喜", fontSize: 14, color: UIColor.darkGray)

    private lazy var regisisterbut:UIButton = UIButton.cz_textButton("注册", fontSize: 16, normalColor: UIColor.orange, highlightedColor: UIColor.darkGray,backgroundImageName: "common_button_white_disable")
    private lazy var loginbut:UIButton = UIButton.cz_textButton("登录", fontSize: 16, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange,backgroundImageName: "common_button_white_disable")
}
extension WBvisitorView{
    func setupui() {
        backgroundColor = UIColor.white
        
        //添加控件
        addSubview(iconview)
        addSubview(houseview)
        addSubview(tiplabel)
        addSubview(regisisterbut)
        addSubview(loginbut)
        //取消auto
        for v in subviews{
            v.translatesAutoresizingMaskIntoConstraints = false
        }
        //设置布局
        //图像视图
        addConstraint(NSLayoutConstraint(item: iconview, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: iconview, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: -60))
        //小房子
        addConstraint(NSLayoutConstraint(item: houseview, attribute: .centerX, relatedBy: .equal, toItem: iconview, attribute: .centerX, multiplier: 1.0, constant: 0))
               addConstraint(NSLayoutConstraint(item: houseview, attribute: .centerY, relatedBy: .equal, toItem: iconview, attribute: .centerY, multiplier: 1.0, constant: 0))

    }
}

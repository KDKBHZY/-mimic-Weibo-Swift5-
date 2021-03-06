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
    lazy var regisisterbut:UIButton = UIButton.cz_textButton("注册", fontSize: 16, normalColor: UIColor.orange, highlightedColor: UIColor.darkGray,backgroundImageName: "common_button_white_disable")
       lazy var loginbut:UIButton = UIButton.cz_textButton("登录", fontSize: 16, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange,backgroundImageName: "common_button_white_disable")
    //设置访客视图信息

    var visitorInfo:[String:String]?{
        didSet{
            guard let imgname = visitorInfo?["imagename"],
                let message = visitorInfo?["message"]
                   else{
                       return
                   }
                   //设置消息
                   tiplabel.text = message
                   //设置图像
                   if imgname == ""{
                    startAnimation()
                       return
                   }
                   iconview.image = UIImage(named: imgname)
            //其他控制器不显示小房子
            houseview.isHidden = true
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupui()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
   
    
    
    
    
    private lazy var iconview = UIImageView(image: UIImage(named:"visitordiscover_feed_image_smallicon"))
    private lazy var houseview = UIImageView(image: UIImage(named:"visitordiscover_feed_image_house"))
    private lazy var tiplabel:UILabel = UILabel.cz_label(withText: "关注一些人-------看看有什么惊喜", fontSize: 14, color: UIColor.darkGray)

  
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
        //文本居中
        tiplabel.textAlignment = .center
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
        //提示标签
        addConstraint(NSLayoutConstraint(item: tiplabel, attribute: .centerX, relatedBy: .equal, toItem: iconview, attribute: .centerX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: tiplabel, attribute: .top, relatedBy: .equal, toItem: iconview, attribute:.bottom, multiplier: 1.0, constant: 20))
        //注册按钮
        addConstraint(NSLayoutConstraint(item: regisisterbut,
                                         attribute: .left,
                                         relatedBy: .equal,
                                         toItem: tiplabel,
                                         attribute: .left,
                                         multiplier: 1,
                                         constant: 0))
         addConstraint(NSLayoutConstraint(item: regisisterbut,
                                          attribute: .top,
                                          relatedBy: .equal,
                                          toItem: tiplabel,
                                          attribute: .bottom,
                                          multiplier: 1,
                                          constant: 20))
        addConstraint(NSLayoutConstraint(item: regisisterbut,
                                         attribute: .width,
                                         relatedBy: .equal,
                                         toItem: nil,
                                         attribute: .notAnAttribute,
                                         multiplier: 1,
                                         constant: 80))
        //注册按钮
        addConstraint(NSLayoutConstraint(item: loginbut,
                                         attribute: .right,
                                         relatedBy: .equal,
                                         toItem: tiplabel,
                                         attribute: .right,
                                         multiplier: 1,
                                         constant: 0))
         addConstraint(NSLayoutConstraint(item: loginbut,
                                          attribute: .top,
                                          relatedBy: .equal,
                                          toItem: tiplabel,
                                          attribute: .bottom,
                                          multiplier: 1,
                                          constant: 20))
        addConstraint(NSLayoutConstraint(item: loginbut,
                                         attribute: .width,
                                         relatedBy: .equal,
                                         toItem:nil,
                                         attribute: .notAnAttribute,
                                         multiplier: 1,
                                         constant: 80))
    }
    //旋转动画(shouye
    private func startAnimation(){
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.toValue = 2 * Double.pi
        animation.repeatCount = MAXFLOAT
        animation.duration = 15
        //完成移除
        animation.isRemovedOnCompletion = false

        //添加到涂层
        iconview.layer.add(animation, forKey: nil)
    }
}

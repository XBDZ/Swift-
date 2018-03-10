//
//  VistorView.swift
//  Swift_WB
//
//  Created by Liu on 2018/3/10.
//  Copyright © 2018年 Mr Liu. All rights reserved.
//

import UIKit

class VistorView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(iconView)
        addSubview(backView)
        addSubview(homeIconView)
        addSubview(messageLabel)
        addSubview(regisBtn)
        addSubview(loginBtn)
        
        
        backView.HB_AlignInner(type: .Center, referView: self, size: nil)
        backView.HB_Fill(referView: self)
        iconView.HB_AlignInner(type: .Center, referView: self, size: nil)
        homeIconView.HB_AlignInner(type: .Center, referView: self, size: nil)
        messageLabel.HB_AlignVertical(type: .BottomCenter, referView: iconView, size: nil)
        addConstraint(NSLayoutConstraint(item: messageLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 224))
        regisBtn.HB_AlignVertical(type: .BottomLeft, referView: messageLabel, size: CGSize(width: 100,height: 35), offset: CGPoint(x: 0,y: 20))
        loginBtn.HB_AlignHorizontal(type: .CenterRight, referView: regisBtn, size: CGSize(width: 100,height: 35), offset: CGPoint(x: 20,y: 0))

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    lazy var backView : UIImageView = {
        let iv = UIImageView(image: UIImage(named:"visitordiscover_feed_mask_smallicon"))
        
        return iv
    }()
    
    lazy var iconView : UIImageView = {
        let iv = UIImageView(image: UIImage(named:"visitordiscover_feed_image_smallicon"))
        
        return iv
    }()
    
    lazy var homeIconView : UIImageView = {
        let iv = UIImageView(image: UIImage(named:"visitordiscover_feed_image_house"))
        
        return iv
    }()
    
    lazy var messageLabel : UILabel = {
        let lb = UILabel()
        lb.text = "关注一些人，回这里看看呦什么惊喜"
        lb.textColor = .darkGray
        lb.font = UIFont.systemFont(ofSize: 14.0)
        lb.numberOfLines = 0
        lb.sizeToFit()
        return lb
    }()
    
    lazy var regisBtn : UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("注册", for: UIControlState())
        btn.setBackgroundImage(UIImage(named:"common_button_white_disable"), for: UIControlState())
        btn.setTitleColor(.orange, for: UIControlState())
        return btn
    }()
    
    lazy var loginBtn : UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("登录", for: UIControlState())
        btn.setBackgroundImage(UIImage(named:"common_button_white_disable"), for: UIControlState())
        btn.setTitleColor(.orange, for: UIControlState())
        return btn
    }()

}

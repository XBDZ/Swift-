//
//  VistorView.swift
//  Swift_WB
//
//  Created by Liu on 2018/3/10.
//  Copyright © 2018年 Mr Liu. All rights reserved.
//

import UIKit

protocol VistorViewDelegate : NSObjectProtocol {
    
    func visitorViewLogin()
    func visitorViewRegister()
}

class VistorView: UIView {

    weak var delegate : VistorViewDelegate?
    
    
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
    
     func setupVisitorInfo(isHome: Bool, imageName: String, message: String)  {
        iconView.isHidden = !isHome
        messageLabel.text = message
        homeIconView.image = UIImage(named: imageName)
    
        if isHome {
            startAnimation()
        }
    }
   private func startAnimation() {
        let amima = CABasicAnimation(keyPath: "transform.rotation")
        amima.toValue = 2 * Double.pi
        amima.duration = 20
        amima.repeatCount = MAXFLOAT
        amima.isRemovedOnCompletion = false
    
        iconView.layer.add(amima, forKey: nil)
    }
    
    
  fileprivate  lazy var backView : UIImageView = {
        let iv = UIImageView(image: UIImage(named:"visitordiscover_feed_mask_smallicon"))
        
        return iv
    }()
    
   fileprivate lazy var iconView : UIImageView = {
        let iv = UIImageView(image: UIImage(named:"visitordiscover_feed_image_smallicon"))
        
        return iv
    }()
    
   fileprivate lazy var homeIconView : UIImageView = {
        let iv = UIImageView(image: UIImage(named:"visitordiscover_feed_image_house"))
        
        return iv
    }()
    
   fileprivate lazy var messageLabel : UILabel = {
        let lb = UILabel()
        lb.text = "关注一些人，回这里看看呦什么惊喜"
        lb.textColor = .darkGray
        lb.font = UIFont.systemFont(ofSize: 14.0)
        lb.numberOfLines = 0
        lb.sizeToFit()
        return lb
    }()
    
   fileprivate lazy var regisBtn : UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("注册", for: UIControlState())
        btn.setBackgroundImage(UIImage(named:"common_button_white_disable"), for: UIControlState())
        btn.setTitleColor(.orange, for: UIControlState())
     btn.addTarget(self, action: #selector(regisAction), for: UIControlEvents.touchUpInside)
        return btn
    }()
    
   fileprivate lazy var loginBtn : UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("登录", for: UIControlState())
        btn.setBackgroundImage(UIImage(named:"common_button_white_disable"), for: UIControlState())
        btn.setTitleColor(.orange, for: UIControlState())
    btn.addTarget(self, action: #selector(loginAction), for: UIControlEvents.touchUpInside)

        return btn
    }()
    
   /// 获取当前view的控制器
    func viewController () -> (UIViewController){
         //1.通过响应者链关系，取得此视图的下一个响应者
         var next:UIResponder?
         next = self.next!
         while next != nil {
         //2.判断响应者对象是否是视图控制器类型
         if ((next as?UIViewController) != nil) {
         return (next as! UIViewController)
         
         }else {
            next = next?.next
         }
      }
         return UIViewController()
    }
    
    func loginAction() {
        
//        let login = LoginViewController()
//        viewController().navigationController?.pushViewController(login, animated: true)
        delegate?.visitorViewLogin()
        
        
    }
    func regisAction() {
          delegate?.visitorViewRegister()
    }
    
    
    
    
}

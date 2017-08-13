//
//  XBTabbar.swift
//  Swift_WB
//
//  Created by Mr Liu on 17/8/10.
//  Copyright © 2017年 Mr Liu. All rights reserved.
//

import UIKit

protocol XBTabBarPublicBtnDelegate {
    func tabbarpublicAction(button : UIButton)
}

class XBTabbar: UITabBar {

    var delegateTabbar: XBTabBarPublicBtnDelegate?
    
     fileprivate lazy var publicBtn : UIButton = {
        let btn = UIButton();

        btn.setImage(UIImage(named: "tabbar_compose_icon_add"), for: UIControlState.normal);
        btn.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), for: UIControlState.highlighted);
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button"), for: UIControlState.normal);
        btn.setBackgroundImage(UIImage(named:"tabbar_compose_button_highlighted"), for: UIControlState.highlighted);
        btn.addTarget(self, action:#selector(buttonAction(button:)), for: UIControlEvents.touchUpInside);
        self.addSubview(btn);
        return btn;
    }();
    
    func buttonAction(button:UIButton){
        
        self.delegateTabbar?.tabbarpublicAction(button: button);
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
//        print(self.subviews as NSArray);
        let buttonW : CGFloat = self.bounds.width/CGFloat((self.items?.count)! + 1);
        let buttonH : CGFloat = self.bounds.height;
        let frame = CGRect(x: 0, y: 0, width: buttonW, height: buttonH);
        
        var i : CGFloat = 0;
     
        for view in self.subviews {
            if i == 2 {
                i = 3;
            }
            if view is UIControl && !(view is UIButton) {
                view.frame = CGRect(x: i * buttonW, y: 0, width: buttonW, height: buttonH);
                i += 1;
            }
        }
        self.publicBtn.frame = frame;
        publicBtn.center = CGPoint(x: 0.5*self.bounds.size.width, y: 0.5*self.bounds.size.height);
  
    }
  
}

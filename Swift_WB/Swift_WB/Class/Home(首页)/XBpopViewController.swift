//
//  XBpopViewController.swift
//  Swift_WB
//
//  Created by Mr Liu on 17/8/13.
//  Copyright © 2017年 Mr Liu. All rights reserved.
//

import UIKit

class XBpopViewController: UIPresentationController {
    
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        
        print(presentedViewController)
        
    }
    private lazy var hubView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.0, alpha: 0.2);
        view.frame = UIScreen.main.bounds
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tap(tap:)));
        view.addGestureRecognizer(tap);
        
        return view
    }()
        
    
    override func containerViewWillLayoutSubviews() {

        //必须设置frame 否则盖住hub 无法响应手势
        presentedView?.frame = CGRect(x: 100, y: 50, width: 180, height: 250);
        ///添加蒙板
        containerView?.insertSubview(hubView, at: 0);
    }

    func tap(tap: UITapGestureRecognizer){
        presentedViewController.dismiss(animated: true, completion: nil);
    }
 
}















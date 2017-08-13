//
//  XBpopViewController.swift
//  Swift_WB
//
//  Created by Mr Liu on 17/8/13.
//  Copyright © 2017年 Mr Liu. All rights reserved.
//

import UIKit

class XBpopViewController: UIPresentationController {
    private lazy var hubView : UIView = UIView();
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews();
        presentedView?.frame = CGRect(x: 100, y: 55, width: 180, height: 250);
        
        ///添加蒙板
        hubView.backgroundColor = UIColor(white: 0.8, alpha: 0.3);
        hubView.frame = containerView!.bounds;
        containerView?.insertSubview(hubView, at: 0);
        let tap = UITapGestureRecognizer(target: self, action: #selector(tap(tap:)));
        containerView?.addGestureRecognizer(tap);
       
    }
 
    func tap(tap: UITapGestureRecognizer){
        presentedViewController.dismiss(animated: true, completion: nil);
    }
    
}

//
//  PopAnimation.swift
//  Swift_WB
//
//  Created by Liu on 2018/3/13.
//  Copyright © 2018年 Mr Liu. All rights reserved.
//

import UIKit

 var isPresent :Bool = false

class PopAnimation: NSObject, UIViewControllerTransitioningDelegate,UIViewControllerAnimatedTransitioning {
    //改变弹出view的尺寸
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return XBpopViewController(presentedViewController: presented, presenting: presenting);
    }
    
    //展现的视图动画
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresent = true
        return self;
    }
    
    //消失的视图动画
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        isPresent = false
        return self;
    }
    
    //MARK:- 弹出和消失动画的代理方法
    //动画执行时长
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval{
        return 0.5;
    }
    //如何动画
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning){
        
        if isPresent
        {
            let toView = transitionContext.view(forKey: UITransitionContextViewKey.to)
            toView?.transform = CGAffineTransform(scaleX: 1.0, y: 0.0)
            //将视图添加到容器上
            transitionContext.containerView.addSubview(toView!)
            toView?.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
            //执行动画
            UIView.animate(withDuration: 0.25, animations: {
                toView?.transform = CGAffineTransform.identity
            }, completion: { (_) in
                transitionContext.completeTransition(true)
            })
        }else{
            let toView = transitionContext.view(forKey: UITransitionContextViewKey.from)
            
            //执行动画
            UIView.animate(withDuration: 0.25, animations: {
                toView?.transform = CGAffineTransform(scaleX: 1.0, y: 0.00001)
            }, completion: { (_) in
                transitionContext.completeTransition(true)
            })
        }
        
    }
}

//
//  HomeViewController.swift
//  Swift_WB
//
//  Created by Mr Liu on 17/8/9.
//  Copyright © 2017年 Mr Liu. All rights reserved.
//

import UIKit

class HomeViewController: BaseTabViewController {

    fileprivate lazy var titleButton : HomeTitleButton = HomeTitleButton();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !userLogin {
            visitorView?.setupVisitorInfo(isHome: true, imageName: "visitordiscover_feed_image_house", message: "关注一些人，回这里看看有什么惊喜")
        }
        
        setupNavbar();
    }
  }
//MARK:- 设置导航栏
extension HomeViewController {
   fileprivate  func setupNavbar (){
    
    self.navigationItem.leftBarButtonItem = UIBarButtonItem(imageName : "navigationbar_friendattention", selectImageName : "navigationbar_friendattention_highlighted" ,targate: self, action: #selector(leftAction) ,title: "")
    self.navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "navigationbar_pop", selectImageName: "navigationbar_pop_highlighted", targate: self, action: #selector(homeAction), title: "")
    
        titleButton.setTitle("asdas", for: .normal);
        titleButton.addTarget(self, action: #selector(titleBtnAction(sender:)), for: .touchUpInside);
        navigationItem.titleView = titleButton;
    }
    func leftAction()  {
        
    }
    func homeAction()  {
        
    }
    
   @objc fileprivate func titleBtnAction(sender : HomeTitleButton){
        
        sender.isSelected = !sender.isSelected;
        let popView = PopoverViewController();
        popView.transitioningDelegate = self;
        popView.modalPresentationStyle = .custom;
        present(popView, animated: true, completion: nil);
    }

}

//MARK:- 自定义转场动画
extension HomeViewController : UIViewControllerTransitioningDelegate{
    //改变弹出view的尺寸
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return XBpopViewController(presentedViewController: presented, presenting: presenting);
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self;
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return self;
    }
    
    
}

//MARK:- 弹出和消失动画的代理方法
extension HomeViewController : UIViewControllerAnimatedTransitioning{
    //动画执行时长
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval{
        return 0.5;
    }
    //如何动画
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning){

        let toView = transitionContext.view(forKey: UITransitionContextViewKey.to)
        UIView.animate(withDuration: 0.5, animations: <#T##() -> Void#>, completion: { (<#Bool#>) in
            <#code#>
        })
        
    }

}




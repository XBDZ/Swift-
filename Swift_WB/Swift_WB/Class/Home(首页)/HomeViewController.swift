//
//  HomeViewController.swift
//  Swift_WB
//
//  Created by Mr Liu on 17/8/9.
//  Copyright © 2017年 Mr Liu. All rights reserved.
//

import UIKit

class HomeViewController: BaseTabViewController {
    
    fileprivate  lazy var titleButton : HomeTitleButton = HomeTitleButton();
    fileprivate lazy var popAnimation : PopAnimation = {
        let popAnimation = PopAnimation()
        return popAnimation
    }()
    
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
    self.navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "navigationbar_pop", selectImageName: "navigationbar_pop_highlighted", targate: self, action: .leftBarAction, title: "")
    
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
        popView.transitioningDelegate = popAnimation;
        popView.modalPresentationStyle = .custom;
        present(popView, animated: true, completion: nil);
    }

}

private extension Selector {
    static let leftBarAction = #selector(HomeViewController.homeAction)
    
}




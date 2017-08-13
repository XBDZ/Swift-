//
//  MainViewController.swift
//  Swift_WB
//
//  Created by Mr Liu on 17/8/9.
//  Copyright © 2017年 Mr Liu. All rights reserved.
//

import UIKit


class MainViewController: UITabBarController ,XBTabBarPublicBtnDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        UITabBar.appearance().tintColor = UIColor.orange;
        
       //添加子控制器
        addChildrenVC();
 
        //替换系统的tabBar
        let tabbar : XBTabbar = XBTabbar.init();
        tabbar.delegateTabbar = self;
        setValue(tabbar, forKey: "tabBar");

    }
    func tabbarpublicAction(button: UIButton) {
        
    }
 
}


// MARK:- 添加子控制器
extension MainViewController {
    
     func addChildrenVC() {
        addChildViewController(children: HomeViewController(), title: "首页", Image: "tabbar_home", selectImage: "tabbar_home_highlighted");
        
        addChildViewController(children: MessageViewController(), title: "消息", Image: "tabbar_message_center", selectImage: "tabbar_message_center_highlighted");
        addChildViewController(children: DiscoverViewController(), title: "发现", Image: "tabbar_discover", selectImage: "tabbar_discover_highlighted");
        
        addChildViewController(children: ProfireViewController(), title: "我", Image: "tabbar_profile", selectImage: "tabbar_profile_highlighted");
    }
    
    private func addChildViewController(children: UIViewController, title: String, Image: String, selectImage: String) {
        
        children.title = title;
        children.tabBarItem.selectedImage = UIImage(named: selectImage);
        children.tabBarItem.image = UIImage(named: Image);
        
        let chil = MainNavController(rootViewController: children);
        
        addChildViewController(chil);
    }
}




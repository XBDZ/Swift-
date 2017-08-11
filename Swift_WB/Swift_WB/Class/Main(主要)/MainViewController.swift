//
//  MainViewController.swift
//  Swift_WB
//
//  Created by Mr Liu on 17/8/9.
//  Copyright © 2017年 Mr Liu. All rights reserved.
//

import UIKit


class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        UITabBar.appearance().tintColor = UIColor.orange;
        
        addChildViewController(children: HomeViewController(), title: "首页", Image: "tabbar_home", selectImage: "tabbar_home_highlighted");
        
        addChildViewController(children: MessageViewController(), title: "消息", Image: "tabbar_message_center", selectImage: "tabbar_message_center_highlighted");
        addChildViewController(children: DiscoverViewController(), title: "发现", Image: "tabbar_discover", selectImage: "tabbar_discover_highlighted");
        
        addChildViewController(children: ProfireViewController(), title: "我", Image: "tabbar_profile", selectImage: "tabbar_profile_highlighted");
        
        
        let tabbar : XBTabbar = XBTabbar.init();
        
        setValue(tabbar, forKey: "tabBar");

        print("%@",tabbar);
    }

    private func addChildViewController(children: UIViewController, title: String, Image: String, selectImage: String) {
        
        children.title = title;
        children.view.backgroundColor = UIColor.red;
        children.tabBarItem.selectedImage = UIImage(named: selectImage);
        children.tabBarItem.image = UIImage(named: Image);
        
        let chil = UINavigationController(rootViewController: children);
        
        addChildViewController(chil);
    }


}

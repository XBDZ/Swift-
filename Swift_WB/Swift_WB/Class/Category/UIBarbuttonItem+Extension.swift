//
//  UIBarbuttonItem+Extension.swift
//  Swift_WB
//
//  Created by Mr Liu on 17/8/12.
//  Copyright © 2017年 Mr Liu. All rights reserved.
//

import UIKit

extension UIBarButtonItem{
    convenience init(imageName : String, selectImageName : String ,targate: AnyObject, action: Selector ,title: String ) {

        let btn = UIButton();
        
        btn.setImage(UIImage(named: imageName), for: UIControlState.normal);
        btn.setImage(UIImage(named:selectImageName), for: UIControlState.highlighted);
        btn.setTitle(title, for: UIControlState.normal)
        btn.addTarget(targate, action: action , for: UIControlEvents.touchUpInside)
        btn.sizeToFit();
        
        self.init(customView:btn);
    }
    
}





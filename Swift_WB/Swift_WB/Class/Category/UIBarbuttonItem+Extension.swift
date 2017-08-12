//
//  UIBarbuttonItem+Extension.swift
//  Swift_WB
//
//  Created by Mr Liu on 17/8/12.
//  Copyright © 2017年 Mr Liu. All rights reserved.
//

import UIKit

extension UIBarButtonItem{
    convenience init(imageName : String, selectImageName : String) {
//        self.init()
//        [UIImage imageName:strig];
        let btn = UIButton();
        
        btn.setImage(UIImage(named: imageName), for: UIControlState.normal);
        btn.setImage(UIImage(named:selectImageName), for: UIControlState.highlighted);
        
        btn.sizeToFit();
        
        self.init(customView:btn);
    }
    
}





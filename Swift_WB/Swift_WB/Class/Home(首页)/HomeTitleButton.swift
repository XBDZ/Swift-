//
//  HomeTitleButton.swift
//  Swift_WB
//
//  Created by Mr Liu on 17/8/12.
//  Copyright © 2017年 Mr Liu. All rights reserved.
//

import UIKit

class HomeTitleButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame);
        
        setImage(UIImage(named:"navigationbar_arrow_up"), for: .normal);
        setImage(UIImage(named:"navigationbar_arrow_down"), for: .highlighted);
        setTitleColor(UIColor.black, for: .normal);
        
        self.sizeToFit();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews();
        
        titleLabel?.frame.origin.x = 0;
        imageView?.frame.origin.x = titleLabel!.frame.size.width + 5;
    }
}

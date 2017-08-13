//
//  PopoverViewController.swift
//  Swift_WB
//
//  Created by Mr Liu on 17/8/13.
//  Copyright © 2017年 Mr Liu. All rights reserved.
//

import UIKit

class PopoverViewController: UIViewController {

    fileprivate lazy var backImage : UIImageView = UIImageView();
    lazy var tableView : UITableView = UITableView();
    override func viewDidLoad() {
        super.viewDidLoad()

       setUpView();

    }
}
//MARK:- 添加子控件
extension PopoverViewController {
    fileprivate func setUpView(){

        backImage.frame = CGRect(x: 0, y: 0, width:180, height: 250);
        backImage.image = UIImage(named: "popover_background");
        view.addSubview(backImage);
        
        tableView.frame = CGRect(x: 20, y: 20, width:backImage.frame.size.width - 40, height: backImage.frame.size.height - 40);
        tableView.backgroundColor = UIColor.white;
        backImage.addSubview(tableView);
    }
}

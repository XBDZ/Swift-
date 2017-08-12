//
//  HomeViewController.swift
//  Swift_WB
//
//  Created by Mr Liu on 17/8/9.
//  Copyright © 2017年 Mr Liu. All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController {

    private lazy var titleButton : HomeTitleButton = HomeTitleButton();
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white;
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "navigationbar_friendattention", selectImageName: "navigationbar_friendattention_highlighted");
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(imageName: "navigationbar_pop", selectImageName: "navigationbar_pop_highlighted");
     
        titleButton.setTitle("asdas", for: .normal);
        
        navigationItem.titleView = titleButton;
    }
   
    

}


//
//  HomeViewController.swift
//  Swift_WB
//
//  Created by Mr Liu on 17/8/9.
//  Copyright © 2017年 Mr Liu. All rights reserved.
//

import UIKit

let HomeViewControllerCell = "HomeViewControllerCell"

class HomeViewController: BaseTabViewController {
    
    var dataArray: [Status]?{
        didSet{
           tableView.reloadData()
        }
    }
    
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
        tableView?.register(HomeStatusCell.self, forCellReuseIdentifier: HomeViewControllerCell)
        
        tableView?.estimatedRowHeight = 200
        tableView?.rowHeight = UITableViewAutomaticDimension
        tableView?.separatorColor = .none
        
        setupNavbar();
        loadData()
    }
    func loadData () {
        Status.loadStatuses { (models, error) in
            if error != nil{
                return
            }
            self.dataArray = models
        }
    }
}
//MARK:- 设置导航栏
extension HomeViewController {
   fileprivate  func setupNavbar (){
    self.navigationItem.leftBarButtonItem = UIBarButtonItem(imageName : "navigationbar_friendattention", selectImageName : "navigationbar_friendattention_highlighted" ,targate: self, action: .leftBarAction ,title: "")
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(imageName: "navigationbar_pop", selectImageName: "navigationbar_pop_highlighted", targate: self, action: .rightAction, title: "")
    
        titleButton.setTitle("asdas", for: .normal);
        titleButton.addTarget(self, action: #selector(titleBtnAction(sender:)), for: .touchUpInside);
        navigationItem.titleView = titleButton;
    }
    func leftAction()  {
        
    }
    func homeAction()  {
        let codeVC = QRCodeViewController()
        let nav = MainNavController.init(rootViewController: codeVC)
        self.present(nav, animated: true, completion: nil);
    }
    
   @objc fileprivate func titleBtnAction(sender : HomeTitleButton){
        
        sender.isSelected = !sender.isSelected;
        let popView = PopoverViewController();
        popView.transitioningDelegate = popAnimation;
        popView.modalPresentationStyle = .custom;
        present(popView, animated: true, completion: nil);
    }
}

extension HomeViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray?.count ?? 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeViewControllerCell, for: indexPath) as! HomeStatusCell
        let status = dataArray![indexPath.row]
        cell.status = status
        return cell
    }
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100.0
//    }
   
}

private extension Selector {
    static let leftBarAction = #selector(HomeViewController.leftAction)
    static let rightAction = #selector(HomeViewController.homeAction)
    
}




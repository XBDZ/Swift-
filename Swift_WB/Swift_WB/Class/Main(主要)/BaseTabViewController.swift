
//
//  BaseTabViewController.swift
//  Swift_WB
//
//  Created by Liu on 2018/3/10.
//  Copyright © 2018年 Mr Liu. All rights reserved.
//

import UIKit

class BaseTabViewController: UITableViewController, VistorViewDelegate {
    
    func visitorViewLogin() {
        
        // 1.弹出登录界面
        let oauthVC = OAuthViewController()
        let nav = UINavigationController(rootViewController: oauthVC)
        present(nav, animated: true, completion: nil)
    }
    
    func visitorViewRegister() {
        
    }
    

    var userLogin = UserAccount.userLogin()
    var visitorView : VistorView?
    
    override func loadView() {
        
          userLogin ? super.loadView() : setupVitorView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

       view.backgroundColor = .white
       
    }

    fileprivate func setupVitorView(){
        let customView = VistorView()
        customView.delegate = self
        view = visitorView
        visitorView = customView
        
        //设置导航条未登录按钮
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: .plain, target: self, action: #selector(BaseTabViewController.registerBtnWillClick))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: .plain, target: self, action: #selector(BaseTabViewController.loginBtnWillClick))
        
    }
    
    func loginBtnWillClick() {
        print(#function)
        // 1.弹出登录界面
        let oauthVC = OAuthViewController()
        let nav = UINavigationController(rootViewController: oauthVC)
        present(nav, animated: true, completion: nil)
        
    }
    func registerBtnWillClick() {
        print(#function)

    }
}

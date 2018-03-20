//
//  QRCodeViewController.swift
//  Swift_WB
//
//  Created by Liu on 2018/3/14.
//  Copyright © 2018年 Mr Liu. All rights reserved.
//

import UIKit

class QRCodeViewController: UIViewController ,UITabBarDelegate{

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(imageName : "", selectImageName : "" ,targate: self, action: .leftBarAction ,title: "关闭")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(imageName : "", selectImageName : "" ,targate: self, action: .rightAction ,title: "相册")
        self.navigationController?.navigationBar.barTintColor = .black
        
        view.addSubview(backView);
        backView.addSubview(kuang);
        backView.addSubview(kuangContant);
        view.addSubview(tabBar);
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
        startAnimation();
    }
    ///执行动画
    func startAnimation()  {
    
        kuangContant.frame.origin.y = -300;
        kuangContant.layoutIfNeeded();
        UIView.animate(withDuration: 2.0, animations: {
            self.kuangContant.frame.origin.y = self.backView.frame.size.height;
            UIView.setAnimationRepeatCount(MAXFLOAT)
            self.kuangContant.layoutIfNeeded()
        })
    }

    func leftAction()  {
        self.dismiss(animated: true, completion: nil)
    }
    
    func rightAction() {
        
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag == 1{
            backView.frame.size.height = 300
            kuang.frame.size.height = 300
            backView.center = view.center
        }else{
            backView.frame.size.height = 150
            kuang.frame.size.height = 150
            backView.center = self.view.center
        }
        kuangContant.layer.removeAllAnimations()
        startAnimation()
        
    }
    
    fileprivate lazy var kuangContant : UIImageView = {
        let imV = UIImageView.init(image: UIImage(named:"qrcode_scanline_qrcode"))
        imV.frame = CGRect.init(x: 0, y: 0, width: self.kuang.frame.size.width, height: self.kuang.frame.size.height);
        return imV
    }()
    
   fileprivate lazy var kuang : UIImageView = {
        let imV = UIImageView()
        imV.image = UIImage(named:"qrcode_border");
        imV.frame = CGRect.init(x: 0, y: 0, width: self.backView.frame.size.width, height: self.backView.frame.size.height);
        return imV
    }()
    
   fileprivate lazy var backView : UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.darkGray
        v.frame = CGRect.init(x: 0, y: 0, width: 300.0, height: 300.0);
        v.center = self.view.center
        return v
    }()
    
    fileprivate lazy var tabBar : UITabBar = {
        let bar = UITabBar()
        bar.frame = CGRect(x: 0, y: self.view.frame.size.height - 49, width: self.view.frame.size.width, height: 49)
        bar.barTintColor = .black
        let barItem = UITabBarItem()
        barItem.tag = 1
        barItem.image = UIImage.init(named: "qrcode_tabbar_icon_qrcode")
        barItem.selectedImage = UIImage.init(named: "qrcode_tabbar_icon_qrcode_highlighted")
        barItem.title = "二维码"
        let barItem2 = UITabBarItem()
        barItem2.image = UIImage.init(named: "qrcode_tabbar_icon_barcode")
        barItem2.selectedImage = UIImage.init(named: "qrcode_tabbar_icon_barcode_highlighted")
        barItem2.title = "条形码"
        
        bar.items = [barItem,barItem2]
        bar.delegate = self
        return bar;
    }()
    
   
}


private extension Selector {
    static let leftBarAction = #selector(QRCodeViewController.leftAction)
    static let rightAction = #selector(QRCodeViewController.rightAction)
    
}




//
//  QRCodeViewController.swift
//  Swift_WB
//
//  Created by Liu on 2018/3/14.
//  Copyright © 2018年 Mr Liu. All rights reserved.
//

import UIKit

class QRCodeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(imageName : "", selectImageName : "" ,targate: self, action: .leftBarAction ,title: "关闭")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(imageName : "", selectImageName : "" ,targate: self, action: .rightAction ,title: "相册")
        self.navigationController?.navigationBar.barTintColor = .black
        
        view.addSubview(backView);
        view.addSubview(kuang);
        view.addSubview(kuangContant);
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews();
        backView.HB_AlignVertical(type: .Center, referView: view, size: CGSize(width: 300, height: 300));
        kuangContant.HB_Fill(referView: backView)
        kuangContant.HB_AlignVertical(type: .Center, referView: view, size: nil)
        
        
    }
    func leftAction()  {
        self.dismiss(animated: true, completion: nil)
    }
    
    func rightAction() {
        
    }
    
    fileprivate lazy var kuangContant : UIImageView = {
        let imV = UIImageView()
        return imV
    }()
    
   fileprivate lazy var kuang : UIImageView = {
        let imV = UIImageView()
    imV.backgroundColor = .red
        imV.image = UIImage(named:"qrcode_border");
        return imV
    }()
   fileprivate lazy var backView : UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.darkGray
        return v
    }()
    
}
private extension Selector {
    static let leftBarAction = #selector(QRCodeViewController.leftAction)
    static let rightAction = #selector(QRCodeViewController.rightAction)
    
}




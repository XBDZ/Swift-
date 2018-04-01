//
//  OAuthViewController.swift
//  Swift_WB
//
//  Created by Liu on 2018/3/27.
//  Copyright © 2018年 Mr Liu. All rights reserved.
//

import UIKit

class OAuthViewController: UIViewController {

    let WB_APP_KEY = "2249631840"
    let WB_APP_Secret = "56c6a6f3e3404ccd4c81f31f6389ea9b"
    let WB_redirect_uri = "http://www.baidu.com"
    
    override func loadView() {
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        navigationItem.title = "微博"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "关闭", style: .plain, target: self, action: #selector(closed))
        
        let urlStr = "https://api.weibo.com/oauth2/authorize?client_id=\(WB_APP_KEY)&redirect_uri=\(WB_redirect_uri)"
//        print("-----------\(urlStr)")
        let url = NSURL(string: urlStr)
        let request = NSURLRequest(url: url! as URL)
        webView.loadRequest(request as URLRequest)
    }

    func closed()  {
        dismiss(animated: true, completion: nil)
    }
    private lazy var webView: UIWebView = {
        let wv = UIWebView()
        wv.delegate = self
        return wv
    }()

}

extension OAuthViewController : UIWebViewDelegate
{
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
//         print(request.URL?.absoluteString)
        
        let urlStr = request.url!.absoluteString
        if !urlStr.hasPrefix(WB_redirect_uri) {
            return true
        }
        
        let codeStr = "code="
        if request.url!.query!.hasPrefix(codeStr) {
            print("授权成功")
            let code = request.url!.query!.substring(from: codeStr.endIndex)
            print(code)
            loadAccessToken(code: code)
        }else{
            print("取消授权")
            // 关闭界面
            self.closed()
        }
        return false

    }
    private func loadAccessToken(code: String) {
        let path = "oauth2/access_token"
        let params = ["client_id":WB_APP_KEY, "client_secret":WB_APP_Secret, "grant_type":"authorization_code", "code":code, "redirect_uri":WB_redirect_uri]
        NetworkTools.shareNetworkTools().post(path, parameters: params, progress: { (Progress) in
            
        }, success: { (_, JSON) in
          let account =  UserAccount.init(dict: JSON as! [String : AnyObject])
           print(account)
           account.saveAccount()
            
        }, failure: { (_, error) in
            
        })

    }
}





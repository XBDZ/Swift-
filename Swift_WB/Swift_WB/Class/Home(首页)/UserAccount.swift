//
//  UserAccount.swift
//  Swift_WB
//
//  Created by Liu on 2018/3/31.
//  Copyright © 2018年 Mr Liu. All rights reserved.
//

import UIKit

class UserAccount: NSObject ,NSCoding{
    
    /// 用于调用access_token，接口获取授权后的access token。
    var access_token: String?
    /// access_token的生命周期，单位是秒数。
    var expires_in: NSNumber?{
        didSet{
            expires_Date = NSDate.init(timeIntervalSinceNow: expires_in!.doubleValue)
        }
    }
    ///保存过期时间
    var expires_Date: NSDate?
    /// 当前授权用户的UID。
    var uid:String?
    /// 用户头像地址（大图），180×180像素
    var avatar_large: String?
    /// 用户昵称
    var screen_name: String?
    
    init(dict: [String : AnyObject]) {
        super.init()
        
       setValuesForKeys(dict)
        
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
    override var description: String{
       let properties = ["access_token", "expires_in", "uid"]
        let dict = self.dictionaryWithValues(forKeys: properties)
        return "\(dict)"
    }
    
    func loadUserInfo(finish : @escaping (_ account : UserAccount?, _ error : NSError?)->()) {
        let path = "2/users/show.json"
        let params = ["access_token":access_token!, "uid":uid!]
        NetworkTools.shareNetworkTools().get(path, parameters: params, progress: { (_) in
            
        }, success: { (_, JSON) in
         
            if let dict = JSON as? [String: AnyObject]
            {
                self.screen_name = dict["screen_name"] as? String
                self.avatar_large = dict["avatar_large"] as? String
                finish(self, nil)
                return
            }
            
        }) { (_, error) in
            
        }
        
    }
    
    ///是否登陆
    class func userLogin() -> Bool {
        if (UserAccount.loadAccount() != nil)  {
            return true
        }
        return false
    }
    
    ///保存数据
    func saveAccount()  {
        NSKeyedArchiver.archiveRootObject(self, toFile: "account.plist".cacheDir())
        
    }
    
    ///取出数据
     static var account: UserAccount?
     class func loadAccount() -> UserAccount? {
        if UserAccount.account != nil {
            return UserAccount.account
        }
        let account = NSKeyedUnarchiver.unarchiveObject(withFile: "account.plist".cacheDir()) as? UserAccount
        if ((UserAccount.account?.expires_Date?.compare(NSDate() as Date)) ==  ComparisonResult.orderedAscending) {
            return nil
        }
        return account
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(access_token, forKey: "access_token")
        aCoder.encode(expires_in, forKey: "expires_in")
        aCoder.encode(uid, forKey: "uid")
        aCoder.encode(expires_Date, forKey: "expires_Date")
    }
    
    required init?(coder aDecoder: NSCoder) {
        access_token = aDecoder.decodeObject(forKey: "access_token") as? String
        expires_in = aDecoder.decodeObject(forKey: "expires_in") as? NSNumber
        uid = aDecoder.decodeObject(forKey: "uid") as? String
        expires_Date = aDecoder.decodeObject(forKey: "expires_Date") as? NSDate
    }
}











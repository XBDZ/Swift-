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
            print(expires_Date)
        }
    }
    ///保存过期时间
    var expires_Date: NSDate?
    /// 当前授权用户的UID。
    var uid:String?
    
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
    
    class func userLogin() -> Bool {
        return UserAccount.loadAccount() != nil
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
        let account = NSKeyedUnarchiver.unarchiveObject(withFile: "account.plist".cacheDir())
        if ((UserAccount.account?.expires_Date?.compare(NSDate() as Date)) ==  ComparisonResult.orderedAscending) {
            return nil
        }
        return account! as? UserAccount
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(access_token, forKey: "access_token")
        aCoder.encode(expires_in, forKey: "expires_in")
        aCoder.encode(uid, forKey: "uid")
    }
    
    required init?(coder aDecoder: NSCoder) {
        access_token = aDecoder.decodeObject(forKey: "access_token") as? String
        expires_in = aDecoder.decodeObject(forKey: "expires_in") as? NSNumber
        uid = aDecoder.decodeObject(forKey: "uid") as? String
    }
}

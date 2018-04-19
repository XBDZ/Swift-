//
//  Status.swift
//  Swift_WB
//
//  Created by Liu on 2018/4/6.
//  Copyright © 2018年 Mr Liu. All rights reserved.
//

import UIKit

class Status: NSObject {
    /// 微博创建时间
    var created_at: String?
    {
        didSet{
            // 1.将字符串转换为时间
            let createdDate = NSDate.dateWithStr(time: created_at!)
            // 2.获取格式化之后的时间字符串
            created_at = createdDate.descDate
        }
    }
    /// 微博ID
    var id: Int = 0
    /// 微博信息内容
    var text: String?
    /// 微博来源
    var source: String?
    /// 配图数组
    var pic_urls: [[String: AnyObject]]?
    /// 用户信息
    var user: User?
    
    init(dict: [String : AnyObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    class func loadStatuses(finish: @escaping (_ models: [Status]?, _ error: NSError?)->())  {
        let path = "2/statuses/home_timeline.json"
        let params = ["access_token":UserAccount.loadAccount()?.access_token]
        NetworkTools.shareNetworkTools().get(path, parameters: params, progress: { (_) in

        }, success: { (_, JSON) in
//            print("*********--------\(JSON )")
            let dict = JSON as! [String: Any]
            let data = dict["statuses"] as! [[String: AnyObject]]
            let models = dictModel(list: data)
            finish(models, nil)
        }) { (_, error) in
            finish(nil, error as NSError)
        }

    }
    override func setValue(_ value: Any?, forKey key: String) {
        if "user" == key {
            user = User.init(dict: value as! [String: AnyObject])
            return
        }
        super.setValue(value, forKey: key)
    }
    
   class func dictModel(list: [[String: AnyObject]]) -> [Status] {
        var models = [Status]()
        for dict in list {
            models.append(Status.init(dict: dict))
        }
        return models
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
    let properties = ["created_at","id","text","source","pic_urls"]
    
    override var description: String{
        let dict = dictionaryWithValues(forKeys: properties)
        return "--------\(dict)"
    }

}










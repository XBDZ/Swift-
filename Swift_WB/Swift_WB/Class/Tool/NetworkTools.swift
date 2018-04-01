//
//  NetworkTools.swift
//  Swift_WB
//
//  Created by Liu on 2018/3/31.
//  Copyright © 2018年 Mr Liu. All rights reserved.
//

import UIKit
import AFNetworking

class NetworkTools: AFHTTPSessionManager {

   static let tools:NetworkTools = {
        let url = NSURL.init(string: "https://api.weibo.com/")
        let t = NetworkTools.init(baseURL: url! as URL)
        return t
    }()
   class func shareNetworkTools() ->  NetworkTools{
        return tools
    }
}

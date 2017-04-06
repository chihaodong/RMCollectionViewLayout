//
//  RMNetTool.swift
//  RMCollectionViewLayout
//
//  Created by 迟浩东 on 2017/4/5.
//  Copyright © 2017年 https://github.com/chihaodong. All rights reserved.
//

import UIKit
import Alamofire
import HandyJSON

let GiphyKey = "dc6zaTOxFJmzC"

let CategoriesReactionsURL = "CategoriesReactionsURL" // 获取分类

class RMNetTool: NSObject {
    
    let dict = NSDictionary(contentsOfFile: Bundle.main.path(forResource: "URLs", ofType: "plist")!)
    
    
    
    static func categoriesReactionsURL(limit: Int, offset: Int, block:@escaping (([RMData]) -> Void)) {
        
        let dict = NSDictionary(contentsOfFile: Bundle.main.path(forResource: "URLs", ofType: "plist")!)
        let url = dict?[CategoriesReactionsURL]
        let urlStrin = NSString(format: url as! NSString, GiphyKey, limit, offset) as String
        
        
        Alamofire.request(urlStrin).responseJSON { response in
            print(response)
            let categoryList = RMCategoriesReactions.deserialize(from: NSString(data:response.data! ,encoding: String.Encoding.utf8.rawValue)! as String)
            if categoryList?.meta?.status == 200 {
                block((categoryList?.data)!)
            } else {
                block([])
            }
            
        }
    }

}

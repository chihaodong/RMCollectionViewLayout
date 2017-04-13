//
//  RMCategoriesReactions.swift
//  RMCollectionViewLayout
//
//  Created by 迟浩东 on 2017/4/5.
//  Copyright © 2017年 https://github.com/chihaodong. All rights reserved.
//

import UIKit
import MJExtension

class RMCategoriesReactions: NSObject {
    
    var data: [RMData] = []
    var pagination: RMPagination!
    var meta: RMMeta!
    
    override func mj_keyValuesDidFinishConvertingToObject() {
        self.data = RMData.mj_objectArray(withKeyValuesArray: self.data).copy() as! [RMData]
    }
}





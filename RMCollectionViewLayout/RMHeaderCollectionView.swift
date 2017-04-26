//
//  RMHeaderCollectionView.swift
//  Gif Keyboard
//
//  Created by 迟浩东 on 2017/4/26.
//  Copyright © 2017年 迟浩东. All rights reserved.
//

import UIKit

let RMHeaderCollectionViewID = "RMHeaderCollectionViewID"

class RMHeaderCollectionView: UICollectionReusableView {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let bgView = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        bgView.backgroundColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
        addSubview(bgView)
        
        let label = UILabel(frame: bgView.frame)
        label.text = "这个是Header，跟随滚动"
        label.textColor = #colorLiteral(red: 0.1111889354, green: 0.112289816, blue: 0.112289816, alpha: 1)
        bgView.addSubview(label)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

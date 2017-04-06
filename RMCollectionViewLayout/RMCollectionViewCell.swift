//
//  RMCollectionViewCell.swift
//  RMCollectionViewLayout
//
//  Created by 迟浩东 on 2017/4/6.
//  Copyright © 2017年 迟浩东. All rights reserved.
//

import UIKit

import YYWebImage

class RMCollectionViewCell: UICollectionViewCell {
    
    var model :RMData? {
        didSet {
            let url = NSURL(string:(model?.gif?.images.preview_gif?.url)!)! as URL
            imageView.yy_setImage(with: url, options: .progressive)
            
        }
    }
    let imageView :UIImageView = YYAnimatedImageView()
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        self.imageView.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        self.addSubview(self.imageView)
    }
    
    required init?(coder aDecoder:NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //重新布局，否则二次刷新时由于单元格重用导致错位
    override func layoutSubviews() {
        super.layoutSubviews()
        self.imageView.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
    }

}

//
//  ViewController.swift
//  RMCollectionViewLayout
//
//  Created by 迟浩东 on 2017/4/6.
//  Copyright © 2017年 迟浩东. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, RMCollectionViewLayoutDelegate {

    var array = [RMData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 自定义Layout
        let layout = RMCollectionViewLayout()
        // 设置代理
        layout.delegate = self
        // 设置滚动方向 默认垂直
        layout.scrollDirection = .Vertical
        
        let collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.register(RMCollectionViewCell.self, forCellWithReuseIdentifier: "RMCollectionViewCell")
        collectionView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.addSubview(collectionView)
        // 网络请求数据
        RMNetTool.categoriesReactionsURL(limit: 50, offset: 0) { arr in
            self.array = arr
            collectionView.reloadData()
        }
    }


    // DataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RMCollectionViewCell"
            , for: indexPath) as! RMCollectionViewCell
        let data = self.array[indexPath.item]
        cell.model = data
        
        return cell;
    }
    
    // MARK - collectionViewLayoutDelegate
    // 必须实现的代理方法
    // 一个是针对水平滚动计算宽度（水平滚动时 高度一致，需要根据高度按照比例计算宽度），同理 一个是针对垂直滚动计算高度的代理方法
    func collectionViewLayout(_ collectionViewLayout: RMCollectionViewLayout, heightForItemAt index: Int, itemWidth width: CGFloat) -> CGFloat {
        let data = self.array[index]
        return width * CGFloat((data.gif!.images.preview_gif!.height! as NSString).floatValue) / CGFloat((data.gif!.images.preview_gif!.width! as NSString).floatValue)
    }
    
    func collectionViewLayout(_ collectionViewLayout: RMCollectionViewLayout, widthForItemAt index: Int, itemHeight height: CGFloat) -> CGFloat {
        let data = self.array[index]
        return height * CGFloat((data.gif!.images.preview_gif!.width! as NSString).floatValue) / CGFloat((data.gif!.images.preview_gif!.height! as NSString).floatValue)
    }
    /**
     * 下面是可选代理方法
     */
    // 此代理只针对 水平滚动有效
    func rowCountInLayout(_ collectionViewLayout: RMCollectionViewLayout) -> NSInteger {
        return 3
    }
    // 设置行间距 不设置有默认值
    func rowMarginInLayout(_ collectionViewLayout: RMCollectionViewLayout) -> CGFloat {
        return 20.0
    }
    // 此代理只针对 垂直滚动有效
    func columnCountInLayout(_ collectionViewLayout: RMCollectionViewLayout) -> NSInteger {
        return 3
    }
    // 设置列间距 不设置有默认值
    func columnMarginInLayout(_ collectionViewLayout: RMCollectionViewLayout) -> CGFloat {
        return 4.0
    }
    // 设置整体边缘间距 不设置有默认值
    func edgeInsetsInLayout(_ collectionViewLayout: RMCollectionViewLayout) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 40, bottom: 20, right: 10)
    }

}


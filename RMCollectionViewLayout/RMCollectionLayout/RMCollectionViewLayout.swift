//
//  RMCollectionViewLayout.swift
//  RMCollectionViewLayout
//
//  Created by 迟浩东 on 2017/4/6.
//  Copyright © 2017年 迟浩东. All rights reserved.
//


import UIKit

@objc protocol RMCollectionViewLayoutDelegate : NSObjectProtocol {
    
    /** 根据宽度，获取对应的比例的高度 用于垂直滚动 */
    func collectionViewLayout(_ collectionViewLayout: RMCollectionViewLayout, heightForItemAt index: Int, itemWidth width:CGFloat) -> CGFloat
    
    /** 根据高度，获取对应的比例的宽度 用于水平滚动 */
    func collectionViewLayout(_ collectionViewLayout: RMCollectionViewLayout, widthForItemAt index: Int, itemHeight height:CGFloat) -> CGFloat
    
    
    /** 获取列数 只针对垂直滚动有效 */
    @objc optional func columnCountInLayout(_ collectionViewLayout: RMCollectionViewLayout) -> NSInteger
    /** 获取行数 只针对水平滚动有效 */
    @objc optional func rowCountInLayout(_ collectionViewLayout: RMCollectionViewLayout) -> NSInteger
    /** 列间距 */
    @objc optional func columnMarginInLayout(_ collectionViewLayout: RMCollectionViewLayout) -> CGFloat
    /** 行间距 */
    @objc optional func rowMarginInLayout(_ collectionViewLayout: RMCollectionViewLayout) -> CGFloat
    /** 上左下右间距 */
    @objc optional func edgeInsetsInLayout(_ collectionViewLayout: RMCollectionViewLayout) -> UIEdgeInsets
}
/** 滚动方向 */
enum ScrollDirection: Int {
    case horizontal = 0
    case vertical   = 1
}

class RMCollectionViewLayout: UICollectionViewLayout {
    
    /** 列数 用于垂直滚动*/
    let defaultColumnCount = 2
    /** 行数 用于水平滚动*/
    let defaultRowCount = 2
    /** 列间距 */
    let defaultColumnMargin = 10.0
    /** 行间距 */
    let defaultRowMargin = 10.0
    /** 上左下右间距 */
    let defaultEdgeInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
    /** 存放位置的数组 */
    var attributes: [UICollectionViewLayoutAttributes] = []
    /** 内容高度 用于垂直滚动 */
    var contentHeight: CGFloat = 0.0
    /** 内容宽度 用于水平滚动*/
    var contentWidth: CGFloat = 0.0
    /** 存放高度数组 用于垂直滚动 */
    var columnHeights = [CGFloat]()
    /** 存放宽度数组 用于水平滚动 */
    var rowWidths = [CGFloat]()
    /** 滚动方向 默认垂直 */
    var scrollDirection: ScrollDirection = .vertical
    
    // 代理
    weak var delegate: RMCollectionViewLayoutDelegate!
    
    // 重写父类方法
    override func prepare() {
        super.prepare()
        
        // 每次都清空计算的高度
        columnHeights .removeAll()
        rowWidths.removeAll()
        // 初始化高度数组
        for _ in 0..<columnCount() {
            columnHeights.append(edgeInsets().top)
        }
        for _ in 0..<rowCount() {
            rowWidths.append(edgeInsets().left)
        }
        // 每次都清空所有位置
        attributes.removeAll()
        
        let itemCount = self.collectionView!.numberOfItems(inSection: 0)
        
        for i in 0..<itemCount {
            let indexPath = IndexPath(item: i, section: 0)
            let attr = layoutAttributesForItem(at: indexPath)
            
            attributes.append(attr!)
        }
    }
    // 返回位置数组
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return attributes
    }
    // 内容总高度、宽度
    override var collectionViewContentSize: CGSize {
        return collectinViewScrollDirection() ? CGSize(width: 0, height: contentHeight + edgeInsets().bottom) : CGSize(width: contentWidth + edgeInsets().right, height: 0)
    }
    // 计算每个item位置
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attr = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        
        // 获取CollectionView宽高
        let collectionViewW = collectionView?.frame.size.width
        let collectionViewH = collectionView?.frame.size.height
        // 垂直滚动，宽度一样
        let defaultW = (collectionViewW! - edgeInsets().left - edgeInsets().right - CGFloat(columnCount() - 1) * columnMargin()) / CGFloat(columnCount())
        // 水平滚动，高度一样
        let defaultH = (collectionViewH! - edgeInsets().top - edgeInsets().bottom - CGFloat(rowCount() - 1) * rowMargin()) / CGFloat(rowCount())
        
        let w = collectinViewScrollDirection() ? defaultW : delegate.collectionViewLayout(self, widthForItemAt: indexPath.item, itemHeight: defaultH)
        let h = collectinViewScrollDirection() ? delegate.collectionViewLayout(self, heightForItemAt: indexPath.item, itemWidth: defaultW) : defaultH
        
        // 找到高度最短的列/行
        var minColumnOrRow = 0
        // 获取第一列高度/宽度
        var minColumnHeightOrWidth = collectinViewScrollDirection() ? columnHeights[0] : rowWidths[0]
        for i in 1..<(collectinViewScrollDirection() ? columnCount() : rowCount()) {
            let columnHeightOrWidth = collectinViewScrollDirection() ? columnHeights[i] : rowWidths[i]
            if minColumnHeightOrWidth > columnHeightOrWidth {
                minColumnHeightOrWidth = columnHeightOrWidth
                minColumnOrRow = i
            }
        }
        
        // 计算 x y 位置
        var x = collectinViewScrollDirection() ? edgeInsets().left + (CGFloat(minColumnOrRow) * (w + columnMargin())) : minColumnHeightOrWidth
        var y = collectinViewScrollDirection() ? minColumnHeightOrWidth : edgeInsets().top + (CGFloat(minColumnOrRow) * (h + rowMargin()))
        if y != edgeInsets().top && collectinViewScrollDirection(){
            y += rowMargin()
        } else if x != edgeInsets().left && !collectinViewScrollDirection() {
            x += columnMargin()
        }
        //        print("宽度：\(w)，高度：\(h)")
        // 设置位置
        attr.frame = CGRect(x: Double(x), y: Double(y), width: Double(w), height: Double(h))
        
        if collectinViewScrollDirection() {
            // 更新最短列的高度 垂直滚动
            columnHeights[minColumnOrRow] = attr.frame.maxY
            // 获取内容高度
            let columnHeihgt =  columnHeights[minColumnOrRow]
            if self.contentHeight < columnHeihgt {
                self.contentHeight = columnHeihgt
            }
        } else {
            // 更新最短行的宽度 水平滚动
            rowWidths[minColumnOrRow] = attr.frame.maxX
            // 获取内容宽度
            let rowWidth =  rowWidths[minColumnOrRow]
            if self.contentWidth < rowWidth {
                self.contentWidth = rowWidth
            }
        }
        
        
        
        return attr
    }
    
    /** 判断滚动方向 */
    func collectinViewScrollDirection() -> Bool {
        if scrollDirection == .vertical { // 垂直滚动
            return true
        } else { // 水平滚动
            return false
        }
    }
    
    /** 代理获取行数 水平滚动 */
    func rowCount() -> NSInteger {
        if delegate.responds(to: #selector(RMCollectionViewLayoutDelegate.rowCountInLayout(_:))) {
            return delegate.rowCountInLayout!(self)
        } else {
            return defaultRowCount
        }
    }
    /** 代理获取列数 垂直滚动 */
    func columnCount() -> NSInteger {
        if delegate.responds(to: #selector(RMCollectionViewLayoutDelegate.columnCountInLayout(_:))) {
            return delegate.columnCountInLayout!(self)
        } else {
            return defaultColumnCount
        }
    }
    /** 代理获取列间距 */
    func columnMargin() -> CGFloat {
        if delegate.responds(to: #selector(RMCollectionViewLayoutDelegate.columnMarginInLayout(_:))) {
            return delegate.columnMarginInLayout!(self)
        } else {
            return CGFloat(defaultColumnMargin)
        }
    }
    /** 代理获取行间距 */
    func rowMargin() -> CGFloat {
        if delegate.responds(to: #selector(RMCollectionViewLayoutDelegate.rowMarginInLayout(_:))) {
            return delegate.rowMarginInLayout!(self)
        } else {
            return CGFloat(defaultRowMargin)
        }
    }
    /** 代理获取上左下右间距 */
    func edgeInsets() -> UIEdgeInsets {
        if delegate.responds(to: #selector(RMCollectionViewLayoutDelegate.edgeInsetsInLayout(_:))) {
            return delegate.edgeInsetsInLayout!(self)
        } else {
            return defaultEdgeInsets
        }
    }
}


# RMCollectionViewLayout

## 效果图

![image](https://github.com/chihaodong/RMCollectionViewLayout/blob/master/Untitled.gif)

![image](https://github.com/chihaodong/RMCollectionViewLayout/blob/master/Untitled1.gif)

## 说明

Swift 3.0 创建的RMCollectionViewLayout框架

支持水平滚动 和 垂直滚动两个方向

完全独立于模型

项目中设计到`网络请求  Json->模型`等基本操作，适合新手学习 

## 使用方法

直接导入RMCollectionViewLayout.swift 文件到项目中

```
// 设置CollectionView的laytou 

// 自定义Layout
let layout = RMCollectionViewLayout()
// 设置代理
layout.delegate = self
// 设置滚动方向 默认垂直
layout.scrollDirection = .Horizontal

let collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
```

## 7个代理方法说明

```
/** 根据宽度，获取对应的比例的高度 用于垂直滚动 必须实现 */
func collectionViewLayout(_ collectionViewLayout: RMCollectionViewLayout, heightForItemAt index: Int, itemWidth width:CGFloat) -> CGFloat
/** 根据高度，获取对应的比例的宽度 用于水平滚动 必须实现 */
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
```

## 项目执行方法

进入项目根目录 执行 `pod install`

 
## 更新警告，提示升级到Swift 3 解决方法如图所示设置
![image](https://github.com/chihaodong/RMCollectionViewLayout/blob/master/2017-04-13_17-45-14.jpg)



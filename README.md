# RMCollectionViewLayout

## 效果图

![image](https://github.com/chihaodong/RMCollectionViewLayout/blob/master/gif/Untitled.gif)

![image](https://github.com/chihaodong/RMCollectionViewLayout/blob/master/gif/Untitled1.gif)
###有header效果
![image](https://github.com/chihaodong/RMCollectionViewLayout/blob/master/gif/header.gif)

## 说明

Swift 3.0 创建的RMCollectionViewLayout框架

支持水平滚动 和 垂直滚动两个方向

完全独立于模型

项目中设计到`网络请求  Json->模型`等基本操作，适合新手学习 

增加头部Header功能，默认只支持一组。

##Header功能
需要在设置Layout时声明
```
layout.isLoadHeader = true       // 允许载入Header，false时，设置高度无效
layout.defaultHeaderHeight = 38  // header高度
```
注册Cell
```
collectionView.register(RMHeaderCollectionView.self, forSupplementaryViewOfKind: kSupplementaryViewKindHeader, withReuseIdentifier: RMHeaderCollectionViewID)
```

实现代理方法
```
// 设置头部Header 代理方法
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == kSupplementaryViewKindHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: RMHeaderCollectionViewID, for: indexPath) as! RMHeaderCollectionView
            
            return header
        }
        return UICollectionReusableView()
    }
```

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

###5个可选代理方法同样可以使用如下属性方式进行设置

```
/** 列数 用于垂直滚动*/
var defaultColumnCount = 2
/** 行数 用于水平滚动*/
var defaultRowCount = 2
/** 列间距 */
var defaultColumnMargin = 10.0
/** 行间距 */
var defaultRowMargin = 10.0
/** 上左下右间距 */
var defaultEdgeInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
```

## 项目执行方法

进入项目根目录 执行 `pod install`

 
## 更新警告，提示升级到Swift 3 解决方法如图所示设置
![image](https://github.com/chihaodong/RMCollectionViewLayout/blob/master/2017-04-13_17-45-14.jpg)



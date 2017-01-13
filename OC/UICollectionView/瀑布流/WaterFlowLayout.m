//
//  WaterFlowLayout.m
//  OC
//
//  Created by 薛坤龙 on 2016/12/27.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import "WaterFlowLayout.h"

/** 默认列数 */
static const NSInteger JGDefaultColumnCount = 3;

/** 每一列之间的间距 */
static const NSInteger JGDefaultColumnMargin = 10;

/** 每一行之间的间距 */
static const NSInteger JGDefaultRowMargin = 10;

/** 边缘间距 */
static const UIEdgeInsets JGDefaultEdgeInsets = {10, 10, 10, 10};

@interface WaterFlowLayout ()

/** 存放所有cell的布局属性 */
@property (nonatomic, strong) NSMutableArray *attrsArray;

/** 存放所有列的当前高度 */
@property (nonatomic, strong) NSMutableArray *columnHeights;

/** 内容的高度 */
@property (nonatomic, assign) CGFloat contentHeight;

- (CGFloat)rowMargin;
- (CGFloat)columnMargin;
- (NSInteger)columnCount;
- (UIEdgeInsets)edgeInsets;

@end

@implementation WaterFlowLayout

/**
 *  初始化
 */
- (void)prepareLayout
{
    [super prepareLayout];
    
    self.contentHeight = 0;
    
    //清除以前计算的所有高度
    [self.columnHeights removeAllObjects];
    
    for (NSInteger i = 0; i < self.columnCount; i++)
    {
        [self.columnHeights addObject:@(self.edgeInsets.top)];
    }
    
    //清除之前所有布局属性
    [self.attrsArray removeAllObjects];
    //开始创建每一个cell对应发布局属性
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    for (NSInteger i = 0; i < count; i++)
    {
        //创建位置
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        //获取indexPath位置cell对应的布局属性
        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:indexPath];
        [self.attrsArray addObject:attrs];
    }
}


/**
 *  决定cell的布局
 */
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    
    for (int section=0; section<[self.collectionView numberOfSections]; section++) {
        UICollectionViewLayoutAttributes* attHeader = [self layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader atIndexPath:[NSIndexPath indexPathForItem:0 inSection:section]];
        [self.attrsArray addObject:attHeader];
    }
    
    return self.attrsArray;
}

/**
 *  返回indexPath位置cell对应的布局属性
 */
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    //创建布局属性
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    //collectionView的宽度
    CGFloat collectionViewW = self.collectionView.frame.size.width;
    
    //设置布局属性的frame
    CGFloat w = (collectionViewW - self.edgeInsets.left - self.edgeInsets.right - (self.columnCount - 1) * self.columnMargin) / self.columnCount;
    
    CGFloat h = [self.delegate waterflowlayout:self heightForItemAtIndex:indexPath.item itemWidth:w];
    
    //找出高度最短的那一列
    NSInteger destColumn = 0;
    CGFloat minColumnHeight = [self.columnHeights[0] doubleValue];
    for (NSInteger i = 0; i < self.columnCount; i++)
    {
        //取得第i列的高度
        CGFloat columnHeight = [self.columnHeights[i] doubleValue];
        if (minColumnHeight > columnHeight)
        {
            minColumnHeight = columnHeight;
            destColumn = i;
        }
    }
    CGFloat x = self.edgeInsets.left + destColumn * (w + self.columnMargin);
    CGFloat y = minColumnHeight;
    if (y != self.edgeInsets.top)
    {
        y += self.rowMargin;
    }
    attrs.frame = CGRectMake(x, y, w, h);
    
    //更新最短那列的高度
    self.columnHeights[destColumn] = @(CGRectGetMaxY(attrs.frame));
    
    //记录内容的高度
    CGFloat columnHeight = [self.columnHeights[destColumn] doubleValue];
    if (self.contentHeight < columnHeight)
    {
        self.contentHeight = columnHeight;
    }
    return attrs;
}

//生成对应的SupplementaryView Attributes
- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionViewLayoutAttributes *orgAttributes=  [super layoutAttributesForSupplementaryViewOfKind:elementKind atIndexPath:indexPath];
    if ([elementKind isEqualToString:UICollectionElementKindSectionHeader])
    {
        
        CGRect tempFrame=orgAttributes.frame;
        NSInteger section=orgAttributes.indexPath.section;
        CGFloat perx= [self sectionItemStarX:section];
        tempFrame.origin.x=perx;
        tempFrame.origin.y=0;
        tempFrame.size=self.headerReferenceSize;
        orgAttributes.frame=tempFrame;
    }
    return orgAttributes;
}

- (CGSize)collectionViewContentSize
{
    return CGSizeMake(0, self.contentHeight + self.edgeInsets.bottom);
}

//这个方法是会在cell时重新布局并调用repareLayout方法
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

#pragma mark - 常见数据处理

- (CGFloat)rowMargin
{
    if ([self.delegate respondsToSelector:@selector(rowMarginInWaterflowLayout:)])
    {
        return [self.delegate rowMarginInWaterflowLayout:self];
    }else
    {
        return JGDefaultRowMargin;
    }
}

- (CGFloat)columnMargin
{
    if ([self.delegate respondsToSelector:@selector(columnMarginInWaterflowLayout:)])
    {
        return [self.delegate columnMarginInWaterflowLayout:self];
    }else
    {
        return JGDefaultColumnMargin;
    }
}

- (NSInteger)columnCount
{
    if ([self.delegate respondsToSelector:@selector(columnCountInWaterflowLayout:)])
    {
        return [self.delegate columnCountInWaterflowLayout:self];
    }else
    {
        return JGDefaultColumnCount;
    }
}

- (UIEdgeInsets)edgeInsets
{
    if ([self.delegate respondsToSelector:@selector(edgeInsetsInWaterflowLayout:)])
    {
        return [self.delegate edgeInsetsInWaterflowLayout:self];
    }else
    {
        return JGDefaultEdgeInsets;
    }
}

#pragma mrak tool method
//每个section宽
-(CGFloat)sectionWidth:(NSUInteger)section
{
    NSInteger column=  [self numColumnOfSection:section];
    CGFloat re=self.sectionInset.left+self.sectionInset.right+column*(self.itemSize.width+self.minimumLineSpacing);
    return re;
}

//根据视图的高度，计算section的 行列数
-(NSInteger)numColumnOfSection:(NSUInteger)section
{
    NSInteger numOfItmes=[self.collectionView numberOfItemsInSection:section];
    CGFloat viewHeight=self.collectionView.frame.size.height;
    NSInteger line=  viewHeight/self.itemSize.height;
    CGFloat fcolumn=numOfItmes/line;
    NSInteger  column= ceil(fcolumn);
    return column;
}

-(CGFloat)sectionItemStarX:(NSUInteger)section
{
    CGFloat x=self.sectionInset.left;//计算每个head.x
    for (NSInteger i=1;i<=section ;i++) {
        x+=  [self sectionWidth:i];
    }
    return x;
}



#pragma mark - 懒加载
- (NSMutableArray *)columnHeights
{
    
    if (!_columnHeights) {
        _columnHeights = [NSMutableArray array];
    }
    
    return _columnHeights;
}

- (NSMutableArray *)attrsArray {
    if (!_attrsArray) {
        _attrsArray = [NSMutableArray array];
    }
    return _attrsArray;
}


@end

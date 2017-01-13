//
//  WaterFlowLayout.h
//  OC
//
//  Created by 薛坤龙 on 2016/12/27.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WaterFlowLayout;

@protocol WaterflowLayoutDelegate <NSObject>

@required

- (CGFloat)waterflowlayout:(WaterFlowLayout *)waterlayout heightForItemAtIndex:(NSUInteger)index itemWidth:(CGFloat)itemWidth;

@optional
- (CGFloat)columnCountInWaterflowLayout:(WaterFlowLayout *)waterflowLayout;
- (CGFloat)columnMarginInWaterflowLayout:(WaterFlowLayout *)waterflowLayout;
- (CGFloat)rowMarginInWaterflowLayout:(WaterFlowLayout *)waterflowLayout;
- (UIEdgeInsets)edgeInsetsInWaterflowLayout:(WaterFlowLayout *)waterflowLayout;

@end

@interface WaterFlowLayout : UICollectionViewFlowLayout

/** 代理 */
@property (nonatomic, weak) id<WaterflowLayoutDelegate> delegate;




@end

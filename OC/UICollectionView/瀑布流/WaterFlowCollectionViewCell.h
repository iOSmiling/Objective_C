//
//  WaterFlowCollectionViewCell.h
//  OC
//
//  Created by 薛坤龙 on 2016/12/27.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ShopModel;

@interface WaterFlowCollectionViewCell : UICollectionViewCell

/**
 *  建立一个model的模型
 */
@property(nonatomic,strong) ShopModel *shopModel;

/**
 *  商品的图片设置
 */
@property (strong, nonatomic)  UIImageView *picture;

/**
 *  商品的名字
 */
@property (strong, nonatomic)  UILabel *priceLabel;

@end

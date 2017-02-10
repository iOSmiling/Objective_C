//
//  ShopModel.h
//  OC
//
//  Created by 薛坤龙 on 2016/12/27.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import "BaseModel.h"
#import <UIKit/UIKit.h>

@interface ShopModel : BaseModel

/**
 *  图片的宽度
 */
@property(nonatomic,assign) CGFloat w;
/**
 *  图片的高度
 */
@property(nonatomic,assign) CGFloat h;

/**
 *   商店的图片
 */
@property(nonatomic,copy) NSString *img;
/**
 *  商店的价格
 */
@property(nonatomic,copy) NSString *price;

@end

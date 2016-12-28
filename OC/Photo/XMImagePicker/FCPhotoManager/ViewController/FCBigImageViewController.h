//
//  FCBigImageViewController.h
//  PhotoCatchTest
//
//  Created by pg on 2016/11/19.
//  Copyright © 2016年 DZHFCompany. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>

typedef void(^ReturnBlock)(NSArray *returnArr);

@interface FCBigImageViewController : UIViewController

/**
 所有的图片
 */
@property (nonatomic,strong)NSArray<PHAsset*> *allImageListArr;

/**
 选中的图片
 */
@property (nonatomic,strong)NSMutableArray *selectImageArr;

/**
 当前的所在位置
 */
@property (nonatomic,assign)NSInteger currentIndex;


/**
 最大的选择值
 */
@property (nonatomic,assign)NSInteger maxCount;


/**
 返回值的Block
 */
@property (nonatomic,copy)ReturnBlock imageReturnlock;

@end

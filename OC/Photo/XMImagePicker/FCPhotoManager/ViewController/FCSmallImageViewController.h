//
//  FCSmallImageViewController.h
//  PhotoCatchTest
//
//  Created by pg on 2016/11/19.
//  Copyright © 2016年 DZHFCompany. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FCPhotoManager.h"

typedef void(^ImageReturnBack)(NSArray<UIImage*> *selectImageArr);


@interface FCSmallImageViewController : UIViewController

/**
 选择最大值
 */
@property (nonatomic,assign)NSInteger maxSelect;

/**
 选择图的返回值
 */
@property (nonatomic,copy)ImageReturnBack returnBlock;

@end

//
//  MasonryCellModel.h
//  OC
//
//  Created by 薛坤龙 on 2017/2/8.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MasonryCellModel : NSObject

@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *content;
@property (strong, nonatomic) UIImage *avatar;

// Cache
@property (assign, nonatomic) CGFloat cellHeight;

@end

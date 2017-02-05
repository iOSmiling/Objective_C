//
//  UIView+FrameChange.h
//  OC
//
//  Created by 薛坤龙 on 2017/2/5.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (FrameChange)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign, readonly) CGFloat bottomFromSuperView;

@end

//
//  UIView+XMFrameExtension.h
//  OC
//
//  Created by 薛坤龙 on 2017/3/28.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (XMFrameExtension)

@property (assign, nonatomic) CGFloat xm_x;
@property (assign, nonatomic) CGFloat xm_y;
@property (assign, nonatomic) CGFloat xm_w;
@property (assign, nonatomic) CGFloat xm_h;
@property (assign, nonatomic) CGFloat xm_centerX;
@property (assign, nonatomic) CGFloat xm_centerY;
@property (assign, nonatomic) CGSize  xm_size;
@property (assign, nonatomic) CGPoint xm_origin;

@end

@interface UIScrollView (XMFrameExtension)

@property (assign, nonatomic) CGFloat xm_insetTop;
@property (assign, nonatomic) CGFloat xm_insetBottom;
@property (assign, nonatomic) CGFloat xm_insetLeft;
@property (assign, nonatomic) CGFloat xm_insetRight;
@property (assign, nonatomic) CGFloat xm_offsetX;
@property (assign, nonatomic) CGFloat xm_offsetY;
@property (assign, nonatomic) CGFloat xm_contentWidth;
@property (assign, nonatomic) CGFloat xm_contentHeight;

@end

//
//  UIScrollView+XMRefreshExtension.h
//  OC
//
//  Created by 薛坤龙 on 2017/3/28.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XMRefresh;

@interface UIScrollView (XMRefreshExtension)

// 给scrollView添加上下拉控件
@property (nonatomic, strong) XMRefresh *xm_header;
@property (nonatomic, strong) XMRefresh *xm_footer;

@end

//
//  UIScrollView+XLRefresh.h
//  XLRefreshExample
//
//  Created by MengXianLiang on 2017/3/27.
//  Copyright © 2017年 MengXianLiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XLRefreshGifHeader.h"
#import "XLRefreshNormalHeader.h"
#import "XLRefreshNormalFooter.h"

@interface UIScrollView (XLRefresh)

@property (nonatomic, strong) XLRefreshGifHeader *xl_gifHeader;

@property (nonatomic, strong) XLRefreshNormalHeader *xl_normalHeader;

@property (nonatomic, strong) XLRefreshNormalFooter *xl_normalFooter;

@end

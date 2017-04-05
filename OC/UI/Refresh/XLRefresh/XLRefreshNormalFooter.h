//
//  XLRefreshFooter.h
//  XLRefreshExample
//
//  Created by MengXianLiang on 2017/3/27.
//  Copyright © 2017年 MengXianLiang. All rights reserved.
//

#import "XLRefreshBase.h"

@interface XLRefreshNormalFooter : XLRefreshBase

//通过block设置回调
+(XLRefreshNormalFooter*)footerWithRefreshingBlock:(XLRefreshingBlock)block;

//通过代理设置回调
+(XLRefreshNormalFooter*)footerWithRefreshingTarget:(id)target refreshingAction:(SEL)action;

@end

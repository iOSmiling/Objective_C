//
//  XLRefreshHeader.h
//  XLRefreshExample
//
//  Created by MengXianLiang on 2017/3/27.
//  Copyright © 2017年 MengXianLiang. All rights reserved.
//

#import "XLRefreshBase.h"

@interface XLRefreshNormalHeader : XLRefreshBase

//通过block设置回调
+(XLRefreshNormalHeader*)headerWithRefreshingBlock:(XLRefreshingBlock)block;

//通过代理设置回调
+(XLRefreshNormalHeader*)headerWithRefreshingTarget:(id)target refreshingAction:(SEL)action;

@end

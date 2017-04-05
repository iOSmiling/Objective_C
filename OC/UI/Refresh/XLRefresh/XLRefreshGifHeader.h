//
//  XLRefreshGifHeader.h
//  OC
//
//  Created by 薛坤龙 on 2017/4/1.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import "XLRefreshBase.h"

@interface XLRefreshGifHeader : XLRefreshBase

//通过block设置回调
+(XLRefreshGifHeader*)gifHeaderWithRefreshingBlock:(XLRefreshingBlock)block;

//通过代理设置回调
+(XLRefreshGifHeader*)gifHeaderWithRefreshingTarget:(id)target refreshingAction:(SEL)action;

@end

//
//  XMHeaderRefresh.m
//  OC
//
//  Created by 薛坤龙 on 2017/3/27.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import "XMHeaderRefresh.h"

@implementation XMHeaderRefresh

+ (instancetype)createHeaderWithRefreshingBlock:(XMRefreshRefreshingBlock)refreshingBlock scrollView:(UIScrollView *)scrollView
{
    return [self headerRefreshWithScrollView:scrollView headerRefreshingBlock:refreshingBlock];
}


@end

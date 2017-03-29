//
//  XMFooterRefresh.m
//  OC
//
//  Created by 薛坤龙 on 2017/3/27.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import "XMFooterRefresh.h"

@implementation XMFooterRefresh

+ (instancetype)createFooterWithRefreshingBlock:(XMRefreshRefreshingBlock)refreshingBlock scrollView:(UIScrollView *)scrollView
{
    return [self footerRefreshWithScrollView:scrollView footerRefreshingBlock:refreshingBlock];
}

@end

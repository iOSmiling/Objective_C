//
//  XMHeaderRefresh.h
//  OC
//
//  Created by 薛坤龙 on 2017/3/27.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import "XMRefreshExtension.h"
#import "XMRefresh.h"

@interface XMHeaderRefresh : XMRefresh

+ (instancetype)createHeaderWithRefreshingBlock:(XMRefreshRefreshingBlock)refreshingBlock scrollView:(UIScrollView *)scrollView;

@end

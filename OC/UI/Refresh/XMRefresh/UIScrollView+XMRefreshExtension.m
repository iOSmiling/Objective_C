//
//  UIScrollView+XMRefreshExtension.m
//  OC
//
//  Created by 薛坤龙 on 2017/3/28.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import "UIScrollView+XMRefreshExtension.h"
#import "XMRefresh.h"
#import <objc/runtime.h>

@implementation UIScrollView (XMRefreshExtension)

#pragma mark - header
static const char XMRefreshExtensionHeaderKey = '\0';

- (void)setXm_header:(XMRefresh *)xm_header
{
    if (xm_header != self.xm_header)
    {
        // 删除旧的，添加新的
        [self.xm_header removeFromSuperview];
        [self insertSubview:xm_header atIndex:0];
        
        // 存储新的
        [self willChangeValueForKey:@"xm_header"]; // KVO
        objc_setAssociatedObject(self, &XMRefreshExtensionHeaderKey,
                                 xm_header, OBJC_ASSOCIATION_ASSIGN);
        [self didChangeValueForKey:@"xm_header"]; // KVO
    }
}

- (XMRefresh *)xm_header
{
    return objc_getAssociatedObject(self, &XMRefreshExtensionHeaderKey);
}

#pragma mark - footer
static const char XMRefreshExtensionFooterKey = '\0';
- (void)setXm_footer:(XMRefresh *)xm_footer
{
    if (xm_footer != self.xm_footer)
    {
        // 删除旧的，添加新的
        [self.xm_footer removeFromSuperview];
        [self insertSubview:xm_footer atIndex:0];
        
        // 存储新的
        [self willChangeValueForKey:@"xm_footer"]; // KVO
        objc_setAssociatedObject(self, &XMRefreshExtensionFooterKey,
                                 xm_footer, OBJC_ASSOCIATION_ASSIGN);
        [self didChangeValueForKey:@"xm_footer"]; // KVO
    }
}

- (XMRefresh *)xm_footer
{
    return objc_getAssociatedObject(self, &XMRefreshExtensionFooterKey);
}

@end

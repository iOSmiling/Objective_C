//
//  UIScrollView+XLRefresh.m
//  XLRefreshExample
//
//  Created by MengXianLiang on 2017/3/27.
//  Copyright © 2017年 MengXianLiang. All rights reserved.
//

#import "UIScrollView+XLRefresh.h"
#import <objc/runtime.h>

@implementation UIScrollView (XLRefresh)

#pragma mark -
#pragma mark gifHeader
static const char XLRefreshGifHeaderKey = '\0';
-(void)setXl_gifHeader:(XLRefreshGifHeader *)xl_gifHeader
{
    if (xl_gifHeader != self.xl_gifHeader)
    {
        // 删除旧的，添加新的
        [self.xl_gifHeader removeFromSuperview];
        [self insertSubview:xl_gifHeader atIndex:0];
        
        // 存储新的
        [self willChangeValueForKey:@"xl_gifHeader"]; // KVO
        objc_setAssociatedObject(self, &XLRefreshGifHeaderKey,
                                 xl_gifHeader, OBJC_ASSOCIATION_ASSIGN);
        [self didChangeValueForKey:@"xl_gifHeader"]; // KVO
    }
}

- (XLRefreshGifHeader *)xl_gifHeader
{
    return objc_getAssociatedObject(self, &XLRefreshGifHeaderKey);
}

#pragma mark -
#pragma mark normalHeader
static const char XLRefreshNormalHeaderKey = '\0';

-(void)setXl_normalHeader:(XLRefreshNormalHeader *)xl_normalHeader
{
    if (xl_normalHeader != self.xl_normalHeader)
    {
        // 删除旧的，添加新的
        [self.xl_normalHeader removeFromSuperview];
        [self insertSubview:xl_normalHeader atIndex:0];
        
        // 存储新的
        [self willChangeValueForKey:@"xl_normalHeader"]; // KVO
        objc_setAssociatedObject(self, &XLRefreshNormalHeaderKey,
                                 xl_normalHeader, OBJC_ASSOCIATION_ASSIGN);
        [self didChangeValueForKey:@"xl_normalHeader"]; // KVO
    }
}

-(XLRefreshNormalHeader *)xl_normalHeader
{
    return objc_getAssociatedObject(self, &XLRefreshNormalHeaderKey);
}

#pragma mark -
#pragma mark Footer
static const char XLRefreshNormalFooterKey = '\0';
-(void)setXl_normalFooter:(XLRefreshNormalFooter *)xl_normalFooter
{
    if (xl_normalFooter != self.xl_normalFooter)
    {
        // 删除旧的，添加新的
        [self.xl_normalFooter removeFromSuperview];
        [self insertSubview:xl_normalFooter atIndex:0];
        
        // 存储新的
        [self willChangeValueForKey:@"xl_normalFooter"]; // KVO
        objc_setAssociatedObject(self, &XLRefreshNormalFooterKey,
                                 xl_normalFooter, OBJC_ASSOCIATION_ASSIGN);
        [self didChangeValueForKey:@"xl_normalFooter"]; // KVO
    }
}


-(XLRefreshNormalFooter *)xl_normalFooter
{
    return objc_getAssociatedObject(self, &XLRefreshNormalFooterKey);
}

@end

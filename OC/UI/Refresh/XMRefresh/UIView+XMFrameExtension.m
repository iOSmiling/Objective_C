//
//  UIView+XMFrameExtension.m
//  OC
//
//  Created by 薛坤龙 on 2017/3/28.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import "UIView+XMFrameExtension.h"

@implementation UIView (XMFrameExtension)

- (void)setXm_x:(CGFloat)xm_x
{
    CGRect frame = self.frame;
    frame.origin.x = xm_x;
    self.frame = frame;
}
- (CGFloat)xm_x
{
    return self.frame.origin.x;
}

- (void)setXm_y:(CGFloat)xm_y
{
    CGRect frame = self.frame;
    frame.origin.y = xm_y;
    self.frame = frame;
}
- (CGFloat)xm_y
{
    return self.frame.origin.y;
}

- (void)setXm_centerX:(CGFloat)xm_centerX
{
    CGPoint center = self.center;
    center.x = xm_centerX;
    self.center = center;
}
- (CGFloat)xm_centerX
{
    return self.center.x;
}

- (void)setXm_centerY:(CGFloat)xm_centerY
{
    CGPoint center = self.center;
    center.y = xm_centerY;
    self.center = center;
}
- (CGFloat)xm_centerY
{
    return self.center.y;
}

- (void)setXm_w:(CGFloat)xm_w
{
    CGRect frame = self.frame;
    frame.size.width = xm_w;
    self.frame = frame;
}
- (CGFloat)xm_w
{
    return self.frame.size.width;
}

- (void)setXm_h:(CGFloat)xm_h
{
    CGRect frame = self.frame;
    frame.size.height = xm_h;
    self.frame = frame;
}
- (CGFloat)xm_h
{
    return self.frame.size.height;
}

- (void)setXm_size:(CGSize)xm_size
{
    CGRect frame = self.frame;
    frame.size = xm_size;
    self.frame = frame;
}
- (CGSize)xm_size
{
    return self.frame.size;
}

- (void)setXm_origin:(CGPoint)xm_origin
{
    CGRect frame = self.frame;
    frame.origin = xm_origin;
    self.frame = frame;
}
- (CGPoint)xm_origin
{
    return self.frame.origin;
}

@end

@implementation UIScrollView (XMFrameExtension)

- (void)setXm_insetTop:(CGFloat)xm_insetTop
{
    UIEdgeInsets inset = self.contentInset;
    inset.top = xm_insetTop;
    self.contentInset = inset;
}

- (CGFloat)xm_insetTop
{
    return self.contentInset.top;
}

- (void)setXm_insetBottom:(CGFloat)xm_insetBottom
{
    UIEdgeInsets inset = self.contentInset;
    inset.bottom = xm_insetBottom;
    self.contentInset = inset;
}

- (CGFloat)xm_insetBottom
{
    return self.contentInset.bottom;
}

- (void)setXm_insetLeft:(CGFloat)xm_insetLeft
{
    UIEdgeInsets inset = self.contentInset;
    inset.left = xm_insetLeft;
    self.contentInset = inset;
}

- (CGFloat)xm_insetLeft
{
    return self.contentInset.left;
}

- (void)setXm_insetRight:(CGFloat)xm_insetRight
{
    UIEdgeInsets inset = self.contentInset;
    inset.right = xm_insetRight;
    self.contentInset = inset;
}

- (CGFloat)xm_insetRight
{
    return self.contentInset.right;
}

- (void)setXm_offsetX:(CGFloat)xm_offsetX
{
    CGPoint offset = self.contentOffset;
    offset.x = xm_offsetX;
    self.contentOffset = offset;
}

- (CGFloat)xm_offsetX
{
    return self.contentOffset.x;
}

- (void)setXm_offsetY:(CGFloat)xm_offsetY
{
    CGPoint offset = self.contentOffset;
    offset.y = xm_offsetY;
    self.contentOffset = offset;
}

- (CGFloat)xm_offsetY
{
    return self.contentOffset.y;
}

- (void)setXm_contentWidth:(CGFloat)xm_contentWidth
{
    CGSize size = self.contentSize;
    size.width = xm_contentWidth;
    self.contentSize = size;
}

- (CGFloat)xm_contentWidth
{
    return self.contentSize.width;
}

- (void)setXm_contentHeight:(CGFloat)xm_contentHeight
{
    CGSize size = self.contentSize;
    size.height = xm_contentHeight;
    self.contentSize = size;
}

- (CGFloat)xm_contentHeight
{
    return self.contentSize.height;
}


@end

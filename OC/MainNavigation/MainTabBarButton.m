//
//  MainTabBarButton.m
//  TableBar6.27
//
//  Created by Administrator on 16/6/27.
//  Copyright © 2016年 glanway. All rights reserved.
//

#import "MainTabBarButton.h"

@implementation MainTabBarButton

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [[UIColor alloc]initWithRed:40/255.0f green:53/255.0f blue:64/255.0f alpha:1.0];
        self.imageView.contentMode =UIViewContentModeScaleAspectFit;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        [self setTitleColor:[UIColor colorWithRed:205/255.0f green:221/255.0f blue:229/255.0f alpha:1.0] forState:UIControlStateSelected];
        
        [self setTitleColor:[UIColor colorWithRed:117/255.0f green:117/255.0f blue:117/255.0f alpha:1.0] forState:UIControlStateNormal];
    }
    return self;
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height*0.5;
    return CGRectMake(0, contentRect.size.height*0.1, imageW, imageH);
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = contentRect.size.height*0.6;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height-titleY;
    return CGRectMake(0,titleY, titleW, titleH);
}

-(void)setTabBarItem:(UITabBarItem *)tabBarItem
{
    _tabBarItem = tabBarItem;
    [self setTitle:self.tabBarItem.title forState:UIControlStateNormal];
    [self setImage:self.tabBarItem.image forState:UIControlStateNormal];
    [self setImage:self.tabBarItem.selectedImage forState:UIControlStateSelected];
}



@end

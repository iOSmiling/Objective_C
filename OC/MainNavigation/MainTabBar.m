//
//  MainTabBar.m
//  TableBar6.27
//
//  Created by Administrator on 16/6/27.
//  Copyright © 2016年 glanway. All rights reserved.
//

#import "MainTabBar.h"
#import "MainTabBarButton.h"


@interface MainTabBar ()
@property(nonatomic, strong)NSMutableArray *tabbarBtnArray;
@property(nonatomic, weak)MainTabBarButton *selectedButton;


@end



@implementation MainTabBar

- (NSMutableArray *)tabbarBtnArray
{
    if (!_tabbarBtnArray) {
        _tabbarBtnArray = [NSMutableArray array];
    }
    return  _tabbarBtnArray;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat btnY = 0;
    CGFloat btnW = self.frame.size.width/(self.subviews.count);
    CGFloat btnH = self.frame.size.height;
    for (int  nIndex = 0;nIndex <self.tabbarBtnArray.count ; nIndex++)
    {
        CGFloat btnX = btnW * nIndex;
        MainTabBarButton *tabBarBtn = self.tabbarBtnArray[nIndex];
        tabBarBtn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        tabBarBtn.tag = nIndex;
    }
    
}

- (void)addTabBarButtonWithTabBarItem:(UITabBarItem *)tableBarItem
{
    MainTabBarButton *tabBarBtn =[[MainTabBarButton alloc]init];
    tabBarBtn.tabBarItem = tableBarItem;
    [tabBarBtn addTarget:self action:@selector(ClickTabBarButton:) forControlEvents:UIControlEventTouchDown];
    
    [self addSubview:tabBarBtn];
    [self.tabbarBtnArray addObject:tabBarBtn];
    if (self.tabbarBtnArray.count == 1)
    {
        [self ClickTabBarButton:tabBarBtn];
    }

}
- (void)ClickTabBarButton:(MainTabBarButton *)tabBarBtn
{
    
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectButtonFrom:to:)])
    {
        [self.delegate tabBar:self didSelectButtonFrom:self.selectedButton.tag to:tabBarBtn.tag];
    }
    
    self.selectedButton.selected = NO;
    tabBarBtn.selected = YES;
    self.selectedButton = tabBarBtn;
}

@end

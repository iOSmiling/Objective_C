//
//  MainTabBar.h
//  TableBar6.27
//
//  Created by Administrator on 16/6/27.
//  Copyright © 2016年 glanway. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MainTabBar;

@protocol MainTabBarDelegate <NSObject>

@optional

- (void)tabBar:(MainTabBar *)tabBar didSelectButtonFrom:(long)fromBtnTag to:(long)toBtnTag;


@end

@interface MainTabBar : UIView
- (void)addTabBarButtonWithTabBarItem:(UITabBarItem *)tableBarItem;
@property(nonatomic,weak)id <MainTabBarDelegate>delegate;
@end

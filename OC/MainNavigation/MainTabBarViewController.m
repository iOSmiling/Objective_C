//
//  MainTabBarViewController.m
//  OC
//
//  Created by 薛坤龙 on 2016/12/19.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import "MainTabBarViewController.h"
#import "ViewController.h"
#import "SettingVC.h"
#import "BaseNavigationController.h"

@interface MainTabBarViewController ()

@end

@implementation MainTabBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
  
    [self loadTabBarViewController];
}

+(id)shareMainTabBarInstance
{
    static MainTabBarViewController *mainController=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mainController=[[self alloc] init];
    });
    return mainController;
}

-(void)loadTabBarViewController
{
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] =[UIColor lightGrayColor];
    
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    
    ViewController *homePageViewController = [[ViewController alloc] init];
    BaseNavigationController *homePageNavigation = [[BaseNavigationController alloc] initWithRootViewController:homePageViewController];
    homePageNavigation.tabBarItem.title=@"学习";
    homePageNavigation.tabBarItem.image = [[UIImage imageNamed:@"bluefaces_1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    homePageNavigation.tabBarItem.selectedImage = [[UIImage imageNamed:@"bluefaces_2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    SettingVC *liveViewController = [[SettingVC alloc] init];
    BaseNavigationController *livePageNavigation = [[BaseNavigationController alloc] initWithRootViewController:liveViewController];
    livePageNavigation.tabBarItem.title=@"设置";
    livePageNavigation.tabBarItem.image = [[UIImage imageNamed:@"bluefaces_3"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    livePageNavigation.tabBarItem.selectedImage = [[UIImage imageNamed:@"bluefaces_4"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [homePageNavigation.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [homePageNavigation.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    
    [livePageNavigation.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [livePageNavigation.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    
//    self.tabBar.tintColor=[UIColor orangeColor];
    self.delegate=self;
    self.viewControllers=@[homePageNavigation,livePageNavigation];
    self.selectedIndex=0;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end

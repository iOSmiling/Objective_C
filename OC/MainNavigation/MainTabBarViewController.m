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
#import "OCBaseNavigationController.h"

@interface MainTabBarViewController ()

@end

@implementation MainTabBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
    //发现
    ViewController *homePageViewController = [[ViewController alloc] init];
    OCBaseNavigationController *homePageNavigation = [[OCBaseNavigationController alloc] initWithRootViewController:homePageViewController];
    homePageNavigation.tabBarItem.title=@"学习";

    
    //关注
    SettingVC *liveViewController = [[SettingVC alloc] init];
    OCBaseNavigationController *livePageNavigation = [[OCBaseNavigationController alloc] initWithRootViewController:liveViewController];
    livePageNavigation.tabBarItem.title=@"设置";
    self.tabBar.tintColor=[UIColor colorWithRed:252.0/255.0 green:57.0/255.0 blue:108.0/255.0 alpha:1.0];
    self.delegate=self;
    self.viewControllers=@[homePageNavigation,livePageNavigation];
    self.selectedIndex=0;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

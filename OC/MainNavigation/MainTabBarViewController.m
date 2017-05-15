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
#import "MainTabBar.h"


const CGFloat tabbarHeight = 49.0;

@interface MainTabBarViewController ()<MainTabBarDelegate,UINavigationControllerDelegate>
{
    BOOL tabBarIsShow;
}



@property (nonatomic ,weak)MainTabBar *mainTabBar;

@end

@implementation MainTabBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self SetupMainTabBar];
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

- (void)SetupMainTabBar
{
    MainTabBar *mainTabBar = [[MainTabBar alloc]init];
    //    mainTabBar.frame = self.tabBar.bounds;
    mainTabBar.frame = CGRectMake(0,self.view.frame.size.height-tabbarHeight,self.view.frame.size.width, tabbarHeight);
    mainTabBar.delegate = self;
    //    [self.tabBar addSubview:mainTabBar];
    [self.view addSubview:mainTabBar];
    _mainTabBar =mainTabBar;
}

-(void)loadTabBarViewController
{
    
    
    
    
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] =[UIColor lightGrayColor];
    
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    
    ViewController *homePageViewController = [[ViewController alloc] init];
    BaseNavigationController *homePageNavigation = [[BaseNavigationController alloc] initWithRootViewController:homePageViewController];
    homePageNavigation.delegate = self;
    homePageNavigation.tabBarItem.title=@"学习";
    homePageNavigation.tabBarItem.image = [[UIImage imageNamed:@"bluefaces_1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    homePageNavigation.tabBarItem.selectedImage = [[UIImage imageNamed:@"bluefaces_2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
     [self.mainTabBar addTabBarButtonWithTabBarItem:homePageNavigation.tabBarItem];
    
    SettingVC *liveViewController = [[SettingVC alloc] init];
    BaseNavigationController *livePageNavigation = [[BaseNavigationController alloc] initWithRootViewController:liveViewController];
    livePageNavigation.delegate = self;
    livePageNavigation.tabBarItem.title=@"设置";
    livePageNavigation.tabBarItem.image = [[UIImage imageNamed:@"bluefaces_3"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    livePageNavigation.tabBarItem.selectedImage = [[UIImage imageNamed:@"bluefaces_4"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
     [self.mainTabBar addTabBarButtonWithTabBarItem:livePageNavigation.tabBarItem];
    
    
    [homePageNavigation.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [homePageNavigation.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    
    [livePageNavigation.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [livePageNavigation.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    
//    self.tabBar.tintColor=[UIColor orangeColor];
    self.delegate=self;
    self.viewControllers=@[homePageNavigation,livePageNavigation];
    self.selectedIndex=0;
    
}

- (void)tabBar:(MainTabBar *)tabBar didSelectButtonFrom:(long)fromBtnTag to:(long)toBtnTag
{
    self.selectedIndex = toBtnTag;
}


- (void)navigationController:(UINavigationController *)navController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    //    for (UIView *tabBar in viewController.tabBarController.tabBar.subviews)
    //    {
    //        if ([tabBar isKindOfClass:NSClassFromString(@"UITabBarButton")])
    //        {
    //            [tabBar removeFromSuperview];
    //        }
    //        [tabBar removeFromSuperview];
    //    }
    
    viewController.tabBarController.tabBar.hidden = YES;
    
    
    if (viewController.hidesBottomBarWhenPushed)
    {
        [self hideTabBar];
    }
    else
    {
        [self showTabBar];
    }
    
}

//- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
//    //删除系统自带的tabBarButton
//    for (UIView *tabBar in self.tabBarController.tabBar.subviews) {
//        if ([tabBar isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
//            [tabBar removeFromSuperview];
//        }
//    }
//
//}

/// 屏幕宽
#define SCREEN_WIDTH     [[UIScreen mainScreen] bounds].size.width

/// 屏幕高
#define SCREEN_HEIGHT    [[UIScreen mainScreen] bounds].size.height

- (void)hideTabBar
{
    if (!tabBarIsShow)
    { //is hidden
        return;
    }
    [UIView animateWithDuration:0.5
                     animations:^{
                         CGRect tabFrame = _mainTabBar.frame;
                         tabFrame.origin.y = SCREEN_HEIGHT;
                         //                         tabFrame.origin.x = 0 - tabFrame.size.width;
                         _mainTabBar.frame = tabFrame;
                     }];
    tabBarIsShow = NO;
}


- (void)showTabBar
{
    if (tabBarIsShow)
    { // is showing
        return;
    }
    [UIView animateWithDuration:0.5
                     animations:^{
                         CGRect tabFrame = _mainTabBar.frame;
                         tabFrame.origin.y = SCREEN_HEIGHT - tabbarHeight;
                         //                         tabFrame.origin.x = CGRectGetWidth(tabFrame) + CGRectGetMinX(tabFrame);
                         _mainTabBar.frame = tabFrame;
                     }];
    tabBarIsShow = YES;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end

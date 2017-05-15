//
//  AppDelegate.m
//  OC
//
//  Created by 薛坤龙 on 2016/12/19.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import "AppDelegate.h"
#import "MainTabBarViewController.h"
#import "AppDelegate+APNS.h"
#import "AppDelegate+InitLocalData.h"
#import "AYYFPSIndicator.h"
#import "AppDelegate+Widget.h"

#import "NetworkToos.h"

@interface AppDelegate ()

@property (nonatomic,strong) NetworkToos *netWorkTools;

@property (nonatomic,assign) NetWorkingState status;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    NSLog(@"程序已经启动...");
    
    
    //真机测试时在同一个页面测试不同的网络的状态
    [NetworkToos LGwithSuccessBlock:^(NetWorkingState status)
    {
        
        switch (status) {
            case 0:
            {
                NSLog(@" 未知网络");
            
            }
                
                break;
            case 1:
            {
                NSLog(@" 无网络");
            
            }
                break;
            case 2:
            {
                NSLog(@" wifi");
            
            }
                break;
            case 3:
            {
                NSLog(@" 手机自带网络");
            
            }
                break;
            
            default:
                break;
        }
        
        
        
    }] ;
    
    
    NSLog(@"launchOptions appdegate ");
    [self initAPNSServse:application withOptions:launchOptions]; //apns
    [self initWidgetServse:application withOptions:launchOptions];//widget
    
    
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    [self.window setRootViewController:[MainTabBarViewController shareMainTabBarInstance]];
    [self.window makeKeyAndVisible];
    
    if (TARGET_VERSION == 1)
    {
        NSLog(@" 1 :Dev");
    }else if (TARGET_VERSION ==2)
    {
        NSLog(@"2：Dis");
    }
    
#ifdef DEBUG
    // 1. 默认位置开启 FPS 监听,可拖动
    [[AYYFPSIndicator sharedInstance] start];
    
    //    // 2. 在 statusBar 显示 FPS
    //    [[AYYFPSIndicator sharedInstance] start];
    //    [AYYFPSIndicator sharedInstance].indicatorPosition = AYYFPSIndicatorPositionStatusBar;
#endif
    
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    [self Widget_application:application openURL:url sourceApplication:sourceApplication annotation:annotation];//widget

    return YES;
}

- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void(^)(BOOL succeeded))completionHandler
{

    
}

- (void)applicationWillResignActive:(UIApplication *)application
{
     NSLog(@"程序将要失去焦点...");
    [self APNS_applicationWillResignActive:application]; //APNS
    [self LocalData_applicationWillResignActive:application]; //LocalData
}


- (void)applicationDidEnterBackground:(UIApplication *)application
{
    NSLog(@"程序已经进入后台1...");
}


- (void)applicationWillEnterForeground:(UIApplication *)application
{
    NSLog(@"程序将要进入前台...");
}


- (void)applicationDidBecomeActive:(UIApplication *)application
{
    NSLog(@"程序已经获得焦点...");

}


- (void)applicationWillTerminate:(UIApplication *)application
{
    NSLog(@"程序将要终止...");
    
    
}

-(void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
    NSLog(@"用于在内存占用过多发出内存警告时调用");
    
}


@end

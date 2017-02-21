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

#import "NetworkToos.h"

@interface AppDelegate ()

@property (nonatomic,strong) NetworkToos *netWorkTools;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    NSLog(@"程序已经启动...");
    
  
 
   self.netWorkTools = [NetworkToos sharedManager];
    
    NSLog(@"[NetworkToos sharedManager].state :%ld",[ self.netWorkTools getState]);
    
    
    [self initAPNSServse:application withOptions:launchOptions]; //apns
    
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    [self.window setRootViewController:[MainTabBarViewController shareMainTabBarInstance]];
    [self.window makeKeyAndVisible];
    
    return YES;
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

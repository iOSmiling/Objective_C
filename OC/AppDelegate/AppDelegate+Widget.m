//
//  AppDelegate+Widget.m
//  OC
//
//  Created by 薛坤龙 on 2017/4/10.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import "AppDelegate+Widget.h"

@implementation AppDelegate (Widget)

- (void)initWidgetServse:(UIApplication *)application withOptions:(NSDictionary *)launchOptions
{
    //test
    NSString *str = @"testAppGroupsDemo";
    NSUserDefaults *userD = [[NSUserDefaults alloc] initWithSuiteName:@"group.com.test.oc"];
    [userD setObject:str forKey:@"test"];
    [userD synchronize];

}

- (BOOL)Widget_application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{

    return YES;
}

- (void)Widget_application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void(^)(BOOL succeeded))completionHandler
{
    
    
}

@end

//
//  AppDelegate+Widget.h
//  OC
//
//  Created by 薛坤龙 on 2017/4/10.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (Widget)

- (void)initWidgetServse:(UIApplication *)application withOptions:(NSDictionary *)launchOptions;

- (BOOL)Widget_application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation;

- (void)Widget_application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void(^)(BOOL succeeded))completionHandler;

@end

//
//  AppDelegate.h
//  OC
//
//  Created by 薛坤龙 on 2016/12/19.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


@end




/*   UIApplication   类的一些功能
 
 1.设置icon上的数字图标
 //设置主界面icon上的数字图标，在2.0中引进， 缺省为0
 
 [UIApplication sharedApplication].applicationIconBadgeNumber = 4;
 
 2.设置摇动手势的时候，是否支持redo,undo操作
 //摇动手势，是否支持redo undo操作。
 
 //3.0以后引进，缺省YES
 
 [UIApplication sharedApplication].applicationSupportsShakeToEdit =YES;
 
 3.判断程序运行状态
 //判断程序运行状态，在2.0以后引入
 
         UIApplicationStateActive,
         
         UIApplicationStateInactive,
         
         UIApplicationStateBackground
 
        if([UIApplication sharedApplication].applicationState ==UIApplicationStateInactive)
        {
            NSLog(@"程序在运行状态");
        }

    4.阻止屏幕变暗进入休眠状态
    //阻止屏幕变暗，慎重使用,缺省为no 2.0

    [UIApplication sharedApplication].idleTimerDisabled =YES;

    慎重使用本功能，因为非常耗电。

    5.显示联网状态
    //显示联网标记 2.0

    [UIApplication sharedApplication].networkActivityIndicatorVisible =YES;

    6.在map上显示一个地址
    NSString* addressText =@"1 Infinite Loop, Cupertino, CA 95014";

    // URL encode the spaces

    addressText =  [addressText stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding];

    NSString* urlText = [NSString stringWithFormat:@"http://maps.google.com/maps?q=%@", addressText];

    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:urlText]];

    7.发送电子邮件
    NSString *recipients =@"mailto:first@example.com?cc=second@example.com,third@example.com&subject=Hello from California!";

    NSString *body =@"&body=It is raining in sunny California!";

    NSString *email = [NSString stringWithFormat:@"%@%@", recipients, body];

    email = [email stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:email]];

    8.打电话到一个号码
    // Call Google 411

    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"tel://8004664411"]];

    9.发送短信
    // Text to Google SMS

    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"sms://466453"]];

    10.打开一个网址
    // Lanuch any iPhone developers fav site

    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://itunesconnect.apple.com"]];



*/

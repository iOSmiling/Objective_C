//
//  UIViewController+Utils.m
//  OC
//
//  Created by 薛坤龙 on 2017/2/5.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import "UIViewController+Utils.h"

@implementation UIViewController (Utils)

+(UIViewController *) findBestViewController:(UIViewController*)vc
{
    if (vc.presentedViewController)
    {
        return [UIViewController findBestViewController:vc.presentedViewController];
        
    }else if([vc isKindOfClass:[UISplitViewController class]])
    {
        UISplitViewController *svc = (UISplitViewController*) vc;
        if (svc.viewControllers.count > 0)
        {
        return [UIViewController findBestViewController:svc.viewControllers.lastObject];
        }else
        {
          return vc;
        }
        
    }else if ([vc isKindOfClass:[UINavigationController class]])
    {
        UINavigationController *svc = (UINavigationController*) vc;
        if (svc.viewControllers.count > 0)
        {
            return [UIViewController findBestViewController:svc.topViewController];
        }else
        {
            return vc;
        }
    } else if ([vc isKindOfClass:[UITabBarController class]])
    {
        UITabBarController *svc = (UITabBarController*) vc;
        if (svc.viewControllers.count > 0)
        {
             return [UIViewController findBestViewController:svc.selectedViewController];
        }else
        {
            return vc;

        }
      } else
    {
        return vc;
    }
}

+ (UIViewController *)currentViewController
{
    UIViewController *viewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    return [UIViewController findBestViewController:viewController];
}

+ (UINavigationController *)currentNavigationController
{
    return [self currentViewController].navigationController;
}

@end

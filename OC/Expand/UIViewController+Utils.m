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
        // Return presented view controller
        return [UIViewController findBestViewController:vc.presentedViewController];
        
    } else if([vc isKindOfClass:[UISplitViewController class]])
    {
        // Return right hand side
        UISplitViewController *svc = (UISplitViewController*) vc;
        if (svc.viewControllers.count > 0)
            return [UIViewController findBestViewController:svc.viewControllers.lastObject];
        else
            return vc;
    } else if ([vc isKindOfClass:[UINavigationController class]])
    {
        // Return top view
        UINavigationController *svc = (UINavigationController*) vc;
        if (svc.viewControllers.count > 0)
            return [UIViewController findBestViewController:svc.topViewController];
        else
            return vc;
    } else if ([vc isKindOfClass:[UITabBarController class]])
    {
        // Return visible view
        UITabBarController *svc = (UITabBarController*) vc;
        if (svc.viewControllers.count > 0)
            return [UIViewController findBestViewController:svc.selectedViewController];
        else
            return vc;
    } else {
        // Unknown view controller type, return last child view controller
        return vc;
    }
}

+(UIViewController *) currentViewController
{
    // Find best view controller
    UIViewController *viewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    return [UIViewController findBestViewController:viewController];
}

+ (UINavigationController *)currentNavigationController
{
    return [self currentViewController].navigationController;
}

@end

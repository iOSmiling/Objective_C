//
//  IntoSystemLimitsVC.m
//  OC
//
//  Created by 薛坤龙 on 2016/12/27.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import "IntoSystemLimitsVC.h"

@interface IntoSystemLimitsVC ()

@end

@implementation IntoSystemLimitsVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"跳转"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(navigationRightItemEnent:)];
  
}

- (void)navigationRightItemEnent:(id)sender
{
    //进入系统APP权限设置
    NSURL * url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    if([[UIApplication sharedApplication] canOpenURL:url])
    {
        NSURL*url =[NSURL URLWithString:UIApplicationOpenSettingsURLString];
        [[UIApplication sharedApplication] openURL:url];
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}



@end

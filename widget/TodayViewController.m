//
//  TodayViewController.m
//  widget
//
//  Created by 薛坤龙 on 2017/4/11.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //视图大小
//    self.preferredContentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 100);
    
    self.view.backgroundColor = [UIColor yellowColor];
    
//    NSUserDefaults *userD = [[NSUserDefaults alloc] initWithSuiteName:@"group.com.test.oc"];
//    NSString *str = [userD objectForKey:@"test"];
    

    self.preferredContentSize = CGSizeMake(self.view.bounds.size.width, 100);
    //  添加一个button,点击button后改变背景的颜色
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"点击一下" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor whiteColor];
    [button addTarget:self action:@selector(clickAction) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(50, 10, 100, 30);
    [self.view addSubview:button];
}

- (void)clickAction{
    self.view.backgroundColor = [UIColor redColor];
}

//
//- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets
//{
//    return UIEdgeInsetsMake(0, 0, 0, 0);
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler
{
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

@end

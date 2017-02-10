//
//  InheritVC.m
//  OC
//
//  Created by 薛坤龙 on 2017/2/6.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import "InheritVC.h"

#import "InheritB.h" //InheritA的子类

@interface InheritVC ()<InteritDelegate>

@end

@implementation InheritVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"继承";
    
    //父类
    InheritA *inheritA = [[InheritA alloc] initWith:@"薛坤龙" andSex:@"nan"];
    NSLog(@"inheritA.name:%@",inheritA.name);
    
    //子类
    InheritB *inheritB = [[InheritB alloc] initWith:@"李便纳" andSex:@"女"];
    NSLog(@"inheritB.name:%@",inheritB.name);
    inheritB.inheritAString = @"inheritA";
    inheritB.inheritBString = @"inheritB";
    inheritB.delegate = self; //子类继承父类的代理事件
    [inheritB inheritAPrint]; //
    NSLog(@"私有的全局变量 %d",[InheritB getStatic]) ;
    
}

#pragma mark - InteritDelegate
- (void)eat
{
    NSLog(@"继承代理 eat");
}

- (void)lovePeople:(NSString *)name
{
    NSLog(@"代理传值：%@",name);

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



@end

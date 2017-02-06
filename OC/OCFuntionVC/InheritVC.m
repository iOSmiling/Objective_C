//
//  InheritVC.m
//  OC
//
//  Created by 薛坤龙 on 2017/2/6.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import "InheritVC.h"

#import "InheritB.h"

@interface InheritVC ()

@end

@implementation InheritVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"继承";
   
    InheritB *inheritB = [[InheritB alloc] init];
    inheritB.inheritAString = @"inheritA";
    inheritB.inheritBString = @"inheritB";
    [inheritB inheritAPrint];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



@end

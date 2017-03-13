//
//  FattributesVC.m
//  OC
//
//  Created by 薛坤龙 on 2017/3/10.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import "FattributesVC.h"

@interface FattributesVC ()

@end

@implementation FattributesVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"系统文件操作";
    
    //文件大小
    NSFileManager *fm = [NSFileManager defaultManager];
    NSDictionary *fattributes = [fm attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    NSLog(@"容量%lldG",[[fattributes objectForKey:NSFileSystemSize] longLongValue]/1000000000);
    NSLog(@"可用%lldG",[[fattributes objectForKey:NSFileSystemFreeSize] longLongValue]/1000000000);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end

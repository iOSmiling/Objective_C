//
//  OCMethodVC.m
//  OC
//
//  Created by 薛坤龙 on 2016/12/20.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import "MethodVC.h"

@interface MethodVC ()

@end

@implementation MethodVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"OC常用方法";
    
    //随机数的使用
    int random = [self getRandomNumber:1 to:3];
    NSLog(@"1-3 随机：%d",random);
}

//获取一个随机整数，范围在[from,to]，包括from，包括to
-(int)getRandomNumber:(int)from to:(int)to
{
    return (int)(from + (arc4random() % (to - from + 1)));
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
 
}



@end

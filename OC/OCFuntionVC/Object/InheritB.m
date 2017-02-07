//
//  InheritB.m
//  OC
//
//  Created by 薛坤龙 on 2017/2/6.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import "InheritB.h"

static int sCount = 100;

@implementation InheritB

//重写父类方法
- (void) inheritAPrint1
{
    [super inheritAPrint]; //调用执行父类的方法
    
    NSLog(@"InheritB :%@",_inheritBString);
}


+ (int)getStatic
{
    return sCount;
}

@end

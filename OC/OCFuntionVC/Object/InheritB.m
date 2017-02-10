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

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        
    }
    return self;
}

- (instancetype)initWith:(NSString *)name andSex:(NSString *)sex
{
    self = [super initWith:name andSex:sex];
    if (self)
    {
        
    }
    return self;
}

//重写父类方法
- (void) inheritAPrint1
{
    [super inheritAPrint]; //调用执行父类的方法
    
    NSLog(@"InheritB :%@",_inheritBString);
}

+ (int)getStatic
{
    return sCount * 3;
}

@end

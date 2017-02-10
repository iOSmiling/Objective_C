//
//  InheritA.m
//  OC
//
//  Created by 薛坤龙 on 2017/2/6.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import "InheritA.h"

@interface InheritA ()

@end

@implementation InheritA


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
    //第一张方式
    self = [super init];
    if (self)
    {
        _name = name;
        _sex = sex;
    }
    return self;
    
    //第二种方式
    /*
    InheritA *inheritA = [[InheritA alloc] init];
    inheritA.name = name;
    inheritA.sex = sex;
    return inheritA;
     */
}

- (void)inheritAPrint
{
    NSLog(@"InheritA");
    NSLog(@"InheritA :%@",_inheritAString);
    
    // 判断代理对象是否实现这个方法，没有实现会导致崩溃
    if ([self.delegate respondsToSelector:@selector(lovePeople:)])
    {
        [self.delegate eat];
        
        [self.delegate lovePeople:@"薛坤龙"];
    }
    
}

- (void)inheritANSLog
{
    NSLog(@"NSLog");

}

@end

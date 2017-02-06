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

- (void)inheritAPrint
{
    NSLog(@"InheritA");
    NSLog(@"InheritA :%@",_inheritAString);
    
    
    if (self.delegate)
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

//
//  Person.h
//  OC
//  都喜欢用 Person举例子
//  Created by 薛坤龙 on 2016/12/28.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import "BaseModel.h"

@interface Person : BaseModel
{
    NSString *name;
    NSString *sex;
    NSInteger age;
}

@property (nonatomic,copy) NSString *stature;

- (NSString *)getName;

- (void)setName:(NSString *)_name;


@end

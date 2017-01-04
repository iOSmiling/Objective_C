//
//  StringVC.m
//  OC
//
//  Created by 薛坤龙 on 2016/12/29.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import "StringVC.h"

@interface StringVC ()

@end

@implementation StringVC

- (void)viewDidLoad
{
    [super viewDidLoad];
  
    self.navigationItem.title = @"NSString";
    
    NSString *string1 = @"string1";
    NSString *string2 = [[NSString alloc] initWithString:string1];
    
    NSLog(@"string1 :%p",&string1);
    NSLog(@"string2 :%p",&string2);
    
    //字符串的遍历
    NSString *string3 = @"TEST";
    NSInteger count = [string3 length];
    for (int i = 0; i < count; i++)
    {
        char c = [string3 characterAtIndex:i];
        NSLog(@"字符串第 %d 位为 %c",i,c);
    }
    
    //字符串的比较
    NSString *string4 = @"testcoding";
    NSString *string5 = @"testcoding";
    if ([string4 isEqualToString:string5])
    {
        NSLog(@"字符串完全相同");
    }
    
    if ([string5 hasPrefix:@"test"])
    {
        NSLog(@"字符串以test开头");
    }
    
    if ([string5 hasSuffix:@"coding"])
    {
        NSLog(@"字符串以coding结尾");
    }
    
    NSString *string6 = @"this is String";
    NSString *string7 = @"This is String";
    
    //字符串对比：NSOrderedAscending(升序),NSOrderedSame（同序）,NSOrderedDescending（降序）
    //NSOrderedDescending 判断两对象值的大小(按字母顺序进行比较，string6小于string7为真)
    BOOL result = [string6 compare:string7] == NSOrderedDescending;
    NSLog(@"result : %d",result);
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
  
}



@end

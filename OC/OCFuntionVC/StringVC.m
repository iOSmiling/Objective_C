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
    
    NSString *string1 = @"string1111";
    NSString *string2 = [[NSString alloc] initWithString:string1];
    
    NSLog(@"string1 :%p",&string1);
    NSLog(@"string2 :%p",&string2);
    
    //字符串成员的引用（取字符
    unichar character = [string1 characterAtIndex:4];
    NSLog(@"取第四个字符 %c", character);
    
    //字符串的拼接
    NSLog(@"字符串拼接 :%@",[string1 stringByAppendingString:string2]);
    NSLog(@"字符串拼接 :%@",[string1 stringByAppendingFormat:@"%@",string2]);
    
    //字符串的遍历
    NSString *string3 = @"TEST";
    NSUInteger count = [string3 length];
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
    
    //字符串大小写字符的转换
    NSLog(@"string6转大写 ：%@",[string6 uppercaseString]);
    NSLog(@"string6:%@",string6);
    
    NSLog(@"string7转小写 : %@",[string7 lowercaseString]);
    NSLog(@"string7 %@",string7);
    
    NSLog(@"string6 首字母大写 %@",[string6 capitalizedString]);
    NSLog(@"string6 :%@",string6);
    
    //字符串转数字
    NSString *string8 = @"12306";
    int intValue = [string8 intValue];
    NSLog(@"string8 intValue :%d",intValue);
    
    //在字符串中查找子串的位置
    NSString *string9 = @"bei jing nin hao nin hao";
    NSString *string10 = @"ninn";
    NSRange range1 = [string9 rangeOfString:string10];
    if (range1.location == NSNotFound)
    {
        NSLog(@"没有找到 %@", NSStringFromRange(range1));
        
    }else
    {
        NSLog(@"%lu %lu", range1.location, range1.length);
    }
    
    //2、条件查找
    
    /*
     NSCaseInsensitiveSearch = 1,   // “A”等同于“a”，不分大小写查找
     NSLiteralSearch = 2,           // Unicode 的点对点比较。它只在所有字符都用相同的方式组成的情况下才会返回相等。
     NSBackwardsSearch = 4,         // 在字符串的末尾开始反向搜索
     NSAnchoredSearch = 8,          // 只考虑搜索的起始点（单独使用）或终止点（当与 NSBackwardsSearch 结合使用时）。
     这个方法可以用来检查前缀或者后缀，以及大小写不敏感（case-insensitive）或者
     音调不敏感（diacritic-insensitive）的比较。
     
     NSNumericSearch = 64,          // 它对字符串里的数字排序
     
     NSDiacriticInsensitiveSearch = 128,   // “A” 等同于 “Å” 等同于 “Ä.”
     NSWidthInsensitiveSearch = 256,       // 一些东亚文字（平假名和片假名）有全宽与半宽两种形式
     NSForcedOrderingSearch = 512,
     NSRegularExpressionSearch = 1024      // 使用正则表达式搜索
     */
    
    // 从后往前查找，找到第一个即停止查找
    NSRange range2 = [string9 rangeOfString:string10 options:NSBackwardsSearch];
    
    if (range2.location == NSNotFound)
    {
        NSLog(@"没有找到 %@", NSStringFromRange(range2));
    } else
    {
        NSLog(@"%lu %lu", range2.location, range2.length);
    }
    
    // 3、在某个范围内查找
    
    // 查找范围
    NSRange range = {8, 10};
    
    NSRange range3 = [string9 rangeOfString:string10 options:NSCaseInsensitiveSearch range:range];
    
    if (range3.location == NSNotFound)
    {
        NSLog(@"没有找到 %@", NSStringFromRange(range3));
    } else
    {
        NSLog(@"%lu %lu", range3.location, range3.length);
    }
    
    //字符串子串的提取（取子串）
    NSString *string11 = @"今天天气真不错，是风和日丽的，我们下午没有课，是心情也不错";
    NSLog(@"从某个位置开始到结尾 :%@", [string11 substringFromIndex:17]);
    NSLog(@"从开始到某个位置 : %@",[string11 substringToIndex:7]);
    NSRange rang4 = {7,10};
    NSLog(@"某个范围内 %@",[string11 substringWithRange:rang4]);
    NSRange rang5 = [string11 rangeOfString:@"我们下午没有课"];
    NSLog(@"%lu %@", (unsigned long)rang5.location, [string11 substringFromIndex:rang5.location]);
    
    //字符串切割/组合
    NSString *str12 = @"chen$chao$ni$hao$ma";
    NSString *str13 = @"bei$jing#ni@hao&ma";
    NSString *str14 = @"Users/JHQ0228/Desktop";
    
    NSArray *arry1 = [str12 componentsSeparatedByString:@"$"];
    NSLog(@"string字符串 按照字符 切割 arry1%@",arry1);
  
    NSArray *arry2 = [str13 componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"$#@&"]];
    NSLog(@"字符串 按照字符集 切割 arry2 %@  ",arry2);
    
    NSArray *array3 = [str14 pathComponents];
    NSLog(@"自动按照 / 分割字符串 %@",array3);
    
    NSString *string15 = [arry1 componentsJoinedByString:@","];  // 以 “，”把数组的元素组合成字符串
    NSLog(@"组合 -- 数组元素组合成 string15 :%@",string15);
    
    NSLog(@"组合 -- 将数组中的元素自动组合成路径 :%@",[NSString pathWithComponents:array3]);
    
    
    //可变字符串
    NSMutableString *stM0 = [[NSMutableString alloc] initWithCapacity:0];
    NSMutableString *stM1 = [NSMutableString stringWithCapacity:0];
    [stM1 appendString:@"sssssss"];
    NSLog(@"stM1 : %@",stM1);
    
    //字符串添加
    [stM0 appendString:@"sdd"];
    NSLog(@"追加:%@",stM0);
    [stM0 appendFormat:@"%d",111];
    NSLog(@"追加:%@",stM0);
    
    [stM0 insertString:@"插入" atIndex:3];
    NSLog(@"插入: %@",stM0);
    
    [stM1 setString:@"ddddddd"];
    NSLog(@"stM1 修改整个字符串（覆盖重写）: %@",stM1);
    
    NSRange rang6 = [stM0 rangeOfString:@"插入"];
    [stM0 deleteCharactersInRange:rang6];
    NSLog(@"字符串删除 %@",stM0);
    
    NSMutableString *stM3 = [NSMutableString stringWithFormat:@"%@",@"bei jing ren min huan ying nin"];
    [stM3 replaceCharactersInRange:[stM3 rangeOfString:@"huan ying nin"] withString:@"ni hao ma"];
    NSLog(@"字符串替换 %@",stM3);
    
    // 查找并替换字符串
    [stM3 replaceOccurrencesOfString:@"i" withString:@"X" options:NSLiteralSearch range:NSMakeRange(0, [stM3 length])];
    
    /*
     NSCaseInsensitiveSearch = 1,         // “A”等同于“a”，不分大小写查找
     NSLiteralSearch = 2,                 // Unicode 的点对点比较。它只在所有字符都用相同的方式组成的情况下才会返回相等。
     NSBackwardsSearch = 4,               // 在字符串的末尾开始反向搜索
     NSAnchoredSearch = 8,                // 只考虑搜索的起始点（单独使用）或终止点（当与 NSBackwardsSearch 结合使用时）。
     这个方法可以用来检查前缀或者后缀，以及大小写不敏感（case-insensitive）或者
     音调不敏感（diacritic-insensitive）的比较。
     NSNumericSearch = 64,                // 它对字符串里的数字排序
     NSDiacriticInsensitiveSearch = 128,  // “A” 等同于 “Å” 等同于 “Ä.”
     NSWidthInsensitiveSearch = 256,      // 一些东亚文字（平假名和片假名）有全宽与半宽两种形式
     NSForcedOrderingSearch = 512,
     NSRegularExpressionSearch = 1024     // 使用正则表达式搜索
     */
    
    NSLog(@"stM3 :%@",stM3);
    
    


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
  
}



@end

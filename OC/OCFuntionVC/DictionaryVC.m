//
//  DictionaryVC.m
//  OC
//
//  Created by 薛坤龙 on 2016/12/22.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import "DictionaryVC.h"

@interface DictionaryVC ()

@end

@implementation DictionaryVC

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    self.navigationItem.title = @"集合";
    
    NSMutableDictionary *dic = [NSMutableDictionary new];
    
    [dic setValue:@"@1" forKey:@"key1"];
    
    NSLog(@"字典:%@", [dic valueForKey:@"key1"]);
    NSLog(@"字典:%@", dic[@"key1"]);
    
    
    
    
    [self iteratorEvent];
    
}

//迭代器
- (void)iteratorEvent
{
    //数组
    NSArray *array = [NSArray arrayWithObjects:@"bei", @"jing", @"huan", @"ying", @"nin", nil];
    
    // 获取数组的正序迭代器
    NSEnumerator *enu1 = [array objectEnumerator];
    
    // 获取数组的反序迭代器
    NSEnumerator *enu2 = [array reverseObjectEnumerator];
    
    // 遍历数组
    id obj = nil;
    
    // 正序，获取下一个需要遍历的元素
    while (obj = [enu1 nextObject])
    {
        NSLog(@"%@", obj);
    }
    
    // 反序，获取下一个需要遍历的元素
    while (obj = [enu2 nextObject])
    {
        NSLog(@"%@", obj);
    }

    //2.集合迭代器
    
    NSSet *set = [NSSet setWithObjects:@5, @23, @3, @8, @21, @33, @18, nil];
    NSEnumerator *enu = [set objectEnumerator];
    id obj1 = nil;
    while (obj1 = [enu nextObject])
    {
        NSLog(@"%@", obj1);
    }
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"value1", @"key1", @"value2", @"key2", nil];
    
    // key 迭代器
    NSEnumerator *keyEnumer = [dic keyEnumerator];
    
    id key = nil;
    while (key = [keyEnumer nextObject]) {
        NSLog(@"%@ = %@", key, [dic objectForKey:key]);
    }
    
    // 对象迭代器
    NSEnumerator *objEnumer = [dic objectEnumerator];
    
    id obj2 = nil;
    while (obj2 = [objEnumer nextObject]) {
        NSLog(@"%@", obj2);
    }

}

//基于块的枚举
- (void)chunk
{
    //快速遍历
    NSArray *array1 = @[@"张三", @"李四", @"王五"];
    for (id item in array1) {
        NSLog(@"item is :%@", item);
    }
    
    //数组
    NSArray *array = @[@"张三", @"李四", @"王五"];
    NSString *str = @"李四";
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSLog(@"item is :%@", obj);
        
        if ([obj localizedStandardCompare:str] == NSOrderedSame) {
            *stop = YES;
            NSLog(@"停止遍历");
        }
    }];
    
    //字典
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"value1", @"key1", @"value2", @"key2", nil];
    
    [dic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        NSLog(@"item is :%@", obj);
        
    }];
    
    //set
    NSSet *set = [NSSet setWithObjects:@5, @23, @3, @8, @21, @33, @18, nil];
    
    [set enumerateObjectsUsingBlock:^(id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        NSLog(@"%@", obj);
        
    }];

}

- (int)getX
{
    return x;
}

- (void)setX:(int)_x
{
    x = _x;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
  
}



@end

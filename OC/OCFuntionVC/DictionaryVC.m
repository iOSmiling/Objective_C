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
   
    self.navigationItem.title = @"字典";
    
    NSMutableDictionary *dic = [NSMutableDictionary new];
    
    [dic setValue:@"@1" forKey:@"key1"];
    
    NSLog(@"字典：%@", [dic valueForKey:@"key1"]);
    
    
    
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
  
}



@end

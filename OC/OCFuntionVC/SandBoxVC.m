//
//  SandBoxVC.m
//  OC
//
//  Created by 薛坤龙 on 2017/2/13.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import "SandBoxVC.h"

@interface SandBoxVC ()

@end

@implementation SandBoxVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"沙盒";
    
    [self creatDocument];
    
    [self getTestName];
  
}

//创建目录
- (void)creatDocument
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    NSLog(@"根目录%@",documentDirectory);
    
    //创建目录
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *testDirectory = [documentDirectory stringByAppendingPathComponent:@"test"];
    [fileManager createDirectoryAtPath:testDirectory withIntermediateDirectories:YES attributes:nil error:nil];
    
    //创建文件
    NSString *testPath = [testDirectory stringByAppendingPathComponent:@"text.txt"];
    NSString *string = @"写入内容 ";
    [fileManager createFileAtPath:testPath contents:[string dataUsingEncoding:NSUTF8StringEncoding] attributes:nil];

}

- (void)getTestName
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSLog(@"documentsDirectory%@",documentsDirectory);
    
    NSFileManager *fileManage = [NSFileManager defaultManager];
    NSString *myDirectory = [documentsDirectory stringByAppendingPathComponent:@"test"];
    
    NSArray *file = [fileManage subpathsOfDirectoryAtPath: myDirectory error:nil];
    NSLog(@"%@",file);
    
    
    NSArray *files = [fileManage subpathsAtPath: myDirectory ];
    NSLog(@"%@",files);


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

@end

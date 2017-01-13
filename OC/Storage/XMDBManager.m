//
//  XMDBManager.m
//  OC
//
//  Created by 薛坤龙 on 2016/12/20.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import "XMDBManager.h"

#import "FMDatabase.h"

#define kXMDBName @"xm.sqlite"

@implementation XMDBManager

static XMDBManager * _sharedDBManager;

+ (XMDBManager *)shardDBManager
{
    if (!_sharedDBManager)
    {
        _sharedDBManager = [[XMDBManager alloc] init];
    }
    return _sharedDBManager;
}

- (id) init
{
    self = [super init];
    if (self)
    {
        int state = [self initializeDBWithName:kXMDBName];
        if (state == -1) {
            NSLog(@"数据库初始化失败");
        } else {
            NSLog(@"数据库初始化成功");
        }

    }
    return self;
}

- (int) initializeDBWithName : (NSString *)name
{
    if (!name)
    {
        return -1;  // 返回数据库创建失败
    }
    // 沙盒Docu目录
    NSString * docp = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) objectAtIndex:0];
    _name = [docp stringByAppendingString:[NSString stringWithFormat:@"/%@",name]];
    NSFileManager * fileManager = [NSFileManager defaultManager];
    BOOL exist = [fileManager fileExistsAtPath:_name];
    [self connect];
    if (!exist)
    {
        return 0;
    } else
    {
        return 1; // 返回 数据库已经存在
        
    }
}

- (void) connect
{
    if (!_dataBase)
    {
        _dataBase = [[FMDatabase alloc] initWithPath:_name];
    }
    if (![_dataBase open])
    {
        NSLog(@"不能打开数据库");
    }
}

- (void)close
{
    [_dataBase close];
    _sharedDBManager = nil;
}

- (void)dealloc
{
    [self close];
}


@end

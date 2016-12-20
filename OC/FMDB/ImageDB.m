//
//  ImageDB.m
//  OC
//
//  Created by 薛坤龙 on 2016/12/20.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import "ImageDB.h"
#import "ImageModel.h"

#define kImageTableName @"imageTable"

@implementation ImageDB

- (id) init
{
    self = [super init];
    if (self)
    {
        _db = [XMDBManager shardDBManager].dataBase;
    }
    return self;
}

- (void) createDataBase
{
    if([_db open])
    {
        BOOL result = [_db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_imageTable (id integer PRIMARY KEY, imageURL text NOT NULL, imageID text NOT NULL);"];
        if (result)
        {
            NSLog(@"创建表成功");
        }else
        {
            NSLog(@"t_imageTable 创建失败 ");
        }
        
        [_db close];
        
    }else
    {
        NSLog(@"打开数据库失败");
    }
}

- (void) saveUser:(ImageModel *) image
{
    if ([_db open])
    {
        BOOL result = [_db executeUpdate:@"INSERT INTO t_imageTable (imageURL,imageID) VALUES (?,?);",image.imageUrl,image.imageID];
        if (result)
        {
            NSLog(@"数据保存成功");
            
        }else
        {
            NSLog(@"数据保存失败");
        }
        [_db close];
        
    }else
    {
        NSLog(@"打开数据库失败");
    }
}

- (void) deleteUserWithId:(ImageModel *) image
{
    
    if ([_db open])
    {
        NSString * query = [NSString stringWithFormat:@"DELETE FROM t_imageTable WHERE imageID = '%@'",image.imageID];
        BOOL result = [_db executeUpdate:query];
        if (result)
        {
            NSLog(@"数据删除成功");
        }else
        {
            NSLog(@"数据删除失败");
        }
        
    }else
    {
        
    }
}

- (void) mergeWithUser:(ImageModel *) image
{
    
    
    
}

@end

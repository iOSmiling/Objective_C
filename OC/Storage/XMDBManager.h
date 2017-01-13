//
//  XMDBManager.h
//  OC
//
//  Created by 薛坤龙 on 2016/12/20.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabaseAdditions.h"

@interface XMDBManager : NSObject
{
    NSString * _name;
}

@property (nonatomic, readonly) FMDatabase * dataBase;  // 数据库操作对象

+ (XMDBManager *)shardDBManager;

// 关闭数据库
- (void) close;


@end

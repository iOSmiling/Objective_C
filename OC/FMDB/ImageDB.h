//
//  ImageDB.h
//  OC
//
//  Created by 薛坤龙 on 2016/12/20.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMDBManager.h"
@class ImageModel;

@interface ImageDB : NSObject
{
    FMDatabase * _db;
}

- (void) createDataBase;
- (void) saveUser:(ImageModel *) image;
- (void) deleteUserWithId:(ImageModel *) image;
- (void) mergeWithUser:(ImageModel *) image;

@end

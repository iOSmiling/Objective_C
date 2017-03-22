//
//  XMURLSessionWrapperOperation.h
//  OC
//
//  Created by 薛坤龙 on 2017/3/21.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMURLSessionWrapperOperation : NSOperation

+ (instancetype)operationWithURLSessionTask:(NSURLSessionTask*)task;

@end

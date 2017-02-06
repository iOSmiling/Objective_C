//
//  InheritA.h
//  OC
//
//  Created by 薛坤龙 on 2017/2/6.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol InteritDelegate <NSObject>

@required //@required修饰的方法必须实现    协议默认声明在其中的方法为必须实现的方法
- (void)eat;

- (void)lovePeople:(NSString *)name;

@optional //@optional修饰的方法是可选实现的

- (void)run;

@end

@interface InheritA : NSObject

@property (nonatomic,copy) NSString *inheritAString;

@property (nonatomic,weak) id<InteritDelegate>delegate;

- (void)inheritAPrint;

- (void)inheritANSLog;

@end

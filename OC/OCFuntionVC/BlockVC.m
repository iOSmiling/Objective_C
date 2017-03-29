//
//  BlockVC.m
//  OC
//
//  Created by 薛坤龙 on 2017/1/9.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import "BlockVC.h"
#import "XXEngine.h"

typedef void(^SUCESSBLOCK)(BOOL isSucessBlock);
typedef void(^FAILEDBLOCK)(BOOL isFailure);

@interface BlockVC ()

@property (nonatomic,copy) SUCESSBLOCK sucessBlock;
@property (nonatomic,copy) FAILEDBLOCK faileBlock;

@end

@implementation BlockVC

- (void)viewDidLoad
{
    [super viewDidLoad];
  
    self.navigationItem.title = @"Block";
    
    int (^MyBlock)(int) = ^(int num){ return  num*4;};
    
    NSLog(@"block :%d",MyBlock(3));
    
    [self testGlobalBlock:@"11" sucess:^(BOOL isSucess){
        NSLog(@"成功");
    } failure:^(BOOL isFaie) {
        
        NSLog(@"失败");
    }];
    
    [self testBlock1:@"11" sucess:^(NSString *name) {
        NSLog(@"block :%@",name);
        
    } failure:^(NSString *sex) {
        NSLog(@"block :%@",sex);
    }];
    
    // XXEngine
    
    XXEngine *xxEngine1 = [[XXEngine alloc] init];
    [xxEngine1 testGlobalBlock:nil success:^(BOOL isSuccess) {
        NSLog(@"2秒已到");
    } failure:^(BOOL isSuccess) {
        NSLog(@"2秒结束");
    }];
    
    XXEngine *xxEngine2 = [[XXEngine alloc] init];
    [xxEngine2 testMallocBlock:nil success:^(BOOL isSuccess) {
        NSLog(@"2秒已到");
    } failure:^(BOOL isSuccess) {
        NSLog(@"2秒结束");
    }];
    
}

- (void)testGlobalBlock:(NSString *)url sucess:(void (^)(BOOL isSucess))sucess failure:(void (^)(BOOL isFaie))failue
{
    if ([url isEqualToString:@"11"])
    {
         sucess(YES);
    }else
    {
         failue(NO);
    }
}

- (void)testBlock1:(NSString *)url sucess:(void(^)(NSString * name))name failure:(void (^)(NSString * sex))failue
{
    if ([url isEqualToString:@"11"])
    {
        name(@"name :11");
    }else
    {
        failue(@"sex :22");
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



@end

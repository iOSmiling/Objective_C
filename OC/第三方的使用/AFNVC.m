//
//  AFNVC.m
//  OC
//
//  Created by 薛坤龙 on 2017/1/20.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import "AFNVC.h"
#import <AFNetworking.h>

@interface AFNVC ()

@end

@implementation AFNVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"AFN";
    
//    NSString *url = @"http://qiniu.xiangmei123.com/Uploads/pic/discuss/2016/20161104/581c47d9aa764.jpg?imageView2/1/format/webp";
    
    
    NSString *url = @"https://test.api.xiangmei123.com/3.0/shoneme/api.php/Tips/TipsList";
//    [self afnGetRequest:url];
//    [self afnPostRequest:url];
    
    [self afnDownLoad:url];
   
}


/**
 afn GET

 @param urlString url
 */
- (void)afnGetRequest:(NSString *)urlString
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:urlString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"这里打印请求成功要做的事");
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);  //这里打印错误信息
    }];
}


/**
 afn POST

 @param urlString urlString description
 */
- (void)afnPostRequest:(NSString *)urlString
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSMutableDictionary *parameters = [NSMutableDictionary new];

    [manager POST:urlString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);  //这里打印错误信息
    }];

}


/**
 afn 下载

 @param urlString urlString
 */
- (void)afnDownLoad:(NSString *)urlString
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDownloadTask *task = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        
        NSLog(@"%lf",1.0 * downloadProgress.completedUnitCount / downloadProgress.totalUnitCount);
        
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        
        NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject];
        return [NSURL fileURLWithPath:filePath];
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        
        NSLog(@"下载完成");
    }];
    
    //开始启动任务
    [task resume];


}

- (void)AFNetworkStatus
{
    //1.创建网络监测者
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    
    /*枚举里面四个状态  分别对应 未知 无网络 数据 WiFi
     typedef NS_ENUM(NSInteger, AFNetworkReachabilityStatus) {
     AFNetworkReachabilityStatusUnknown          = -1,      未知
     AFNetworkReachabilityStatusNotReachable     = 0,       无网络
     AFNetworkReachabilityStatusReachableViaWWAN = 1,       蜂窝数据网络
     AFNetworkReachabilityStatusReachableViaWiFi = 2,       WiFi
     };
     */
    
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        //这里是监测到网络改变的block  可以写成switch方便
        //在里面可以随便写事件
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"未知网络状态");
                break;
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"无网络");
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"蜂窝数据网");
                break;
                
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"WiFi网络");
                
                break;
                
            default:
                break;
        }
        
    }] ;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

@end

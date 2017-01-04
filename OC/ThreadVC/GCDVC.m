//
//  GCDVC.m
//  OC
//
//  Created by 薛坤龙 on 2016/12/20.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import "GCDVC.h"
#import "UIImage+Extend.h"

#import <AFNetworking.h>

@interface GCDVC ()
{
    dispatch_queue_t socketQueue;
    
    AFNetworkReachabilityManager *manager;
    
}

@property (nonatomic,strong) UIImageView *imageView1;
@property (nonatomic,strong) UIImageView *imageView2;

@end

@implementation GCDVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"GCD";
    
    [self.view addSubview:self.imageView1];
    [self.view addSubview:self.imageView2];
    
    _imageView1.frame = CGRectMake(100, 120, 100, 100);
    _imageView2.frame = CGRectMake(100, 240, 100, 100);
    
    
    manager = [AFNetworkReachabilityManager sharedManager];
    __weak typeof(self) weakSelf = self;
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status)
    {
        /*
        // 一共有四种状态
        switch (status)
        {
            case AFNetworkReachabilityStatusNotReachable:
                
                NSLog(@"AFNetworkReachability Not Reachable");
                
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                
                NSLog(@"AFNetworkReachability Reachable via WWAN");
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                
                NSLog(@"AFNetworkReachability Reachable via WiFi");
                break;
                
            case AFNetworkReachabilityStatusUnknown:
                
            default:
                NSLog(@"AFNetworkReachability Unknown");
                break;
        }
         */
       
        if (status != AFNetworkReachabilityStatusNotReachable)
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [weakSelf reconnect];
            });
        }
    }];
    
    [manager startMonitoring];
    
    
    //GCD
    
    /*
     
     //dispatch_queue_create(const char *label, dispatch_queue_attr_t attr);
     
     NOTE: dispatch_queue_attr_t设置成NULL的时候默认代表串行。
     
     */
    
    //串行队列
    dispatch_queue_t serialQueue;
    serialQueue = dispatch_queue_create("com.example.SerialQueue", NULL);
    
    //并发队列
    dispatch_queue_t concurrentQueue;
    concurrentQueue = dispatch_queue_create("com.example.ConcurrentQueue", DISPATCH_QUEUE_CONCURRENT);
    
    //main队列
    dispatch_queue_t mainQueue;
    mainQueue = dispatch_get_main_queue();
    

    dispatch_queue_t myCustomQueue;
    myCustomQueue = dispatch_queue_create("com.example.MyCustomQueue", NULL);
    //异步执行
    dispatch_async(myCustomQueue, ^{
        NSLog(@"Do some work here.");
    });
    //同步执行
    dispatch_sync(myCustomQueue, ^{
        NSLog(@"Do some more work here.");
    });
    
    /*
     dispatch_async在不同队列类型执行的情况
     
     1 自定义串行队列：当你想串行执行后台任务并追踪它时就是一个好选择。这消除了资源争用，因为你知道一次只有一个任务在执行。
     2 主队列：这是在一个并发队列上完成任务后更新 UI 的一般选择。
     3 并发队列：这是在后台执行非 UI 工作的一般选择
     */
    
    [self downLoadImage];
    
    
}

- (void)reconnect
{
    NSLog(@"网络变化，重连");
}

- (void)downLoadImage
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        
        //GCD group的使用
        dispatch_group_t group = dispatch_group_create();
        
        __block UIImage *image1 = nil;
        __block UIImage *image2 = nil;
        
        dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSString *url1 = @"http://car0.autoimg.cn/upload/spec/9579/u_20120110174805627264.jpg";
            image1 = [UIImage getImageFromURLString:url1];
        });
        
        dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            // 下载第一张图片
            NSString *url2 = @"http://hiphotos.baidu.com/lvpics/pic/item/3a86813d1fa41768bba16746.jpg";
            image2 = [UIImage getImageFromURLString:url2];;
        });
        
        // 等待组中的任务执行完毕,回到主线程执行block回调
        dispatch_group_notify(group, dispatch_get_main_queue(), ^{
            self.imageView1.image = image1;
            self.imageView2.image = image2;
            
        });
        
    });
}

- (UIImageView *)imageView1
{
    if (!_imageView1)
    {
        _imageView1 = [[UIImageView alloc] init];
    }
    return _imageView1;
}

- (UIImageView *)imageView2
{
    if (!_imageView2)
    {
        _imageView2 = [[UIImageView alloc] init];
    }
    return _imageView2;
}

- (void)dealloc
{
    [manager stopMonitoring];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   
}

@end

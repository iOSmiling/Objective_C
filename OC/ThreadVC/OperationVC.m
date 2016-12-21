//
//  OperationVC.m
//  OC
//
//  Created by 薛坤龙 on 2016/12/20.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import "OperationVC.h"
#import "UIImage+Extend.h"

@interface OperationVC ()

@property (nonatomic,strong) UIImageView *imageView;

@end

@implementation OperationVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"NSOperation";
    
    
    [self.view addSubview:self.imageView];
    
    self.imageView.frame = CGRectMake(self.view.frame.size.width/4, 200, self.view.frame.size.width/2, self.view.frame.size.height/2);
    
    [self requestData];
    
    //注意：只要NSBlockOperation封装的操作数 >1，就会异步执行操作
    NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
        // 在主线程
        NSLog(@"下载1------%@", [NSThread currentThread]);
    }];
    
    [op addExecutionBlock:^{
        NSLog(@"下载2------%@", [NSThread currentThread]);
    }];
    
    [op addExecutionBlock:^{
        NSLog(@"下载3------%@", [NSThread currentThread]);
    }];
    
    [op addExecutionBlock:^{
        NSLog(@"下载4------%@", [NSThread currentThread]);
    }];
    [op start];
    
    //创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    // 设置最大并发操作数
    queue.maxConcurrentOperationCount = 3;// 并发队列
    //    queue.maxConcurrentOperationCount = 1; // 就变成了串行队列
    
    //创建操作  第一种方式
    NSBlockOperation *qOp1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"download1 --- %@", [NSThread currentThread]);
    }];
    
    
    //创建操作 第二种方式
    [queue addOperationWithBlock:^{
        NSLog(@"download2 --- %@", [NSThread currentThread]);
    }];
    
    //创建多个操作，增加依赖
    NSBlockOperation *qOp3 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"download3 --- %@", [NSThread currentThread]);
    }];
    
    
    NSBlockOperation *qOp4 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"download4 --- %@", [NSThread currentThread]);
    }];
    
    // 设置依赖(保证op1在op4和op3都执行完之后再执行)  注意：不能相互依赖  也可以在不同queue的NSOperation之间创建依赖关系
    //NSOperation添加到queue之后,绝对不要再修改NSOperation对象的状态。因为NSOperation对象可能会在任何时候运行,因此改变NSOperation对象的依赖或数据会产生不利的影响。你只能查看NSOperation对象的状态, 比如是否正在运行、等待运行、已经完成等
    [qOp1 addDependency:qOp4];
    [qOp1 addDependency:qOp3];
    
    [queue addOperation:qOp1];
    [queue addOperation:qOp3];
    [queue addOperation:qOp4];
    
    //监听一个操作的执行完毕
    [qOp4 setCompletionBlock:^{
        NSLog(@"qOP4完成");
    }];

   
}

-(void)requestData
{
    //在子线程下载图片，再回答到主线程在imageView添加图片
    [[[NSOperationQueue alloc] init] addOperationWithBlock:^{
        
        //        NSURL *url = [NSURL URLWithString:@"http://qiniu.xiangmei123.com/Uploads/pic/discuss/2016/20161104/581c47d9aa764.jpg?imageView2/1/format/webp"];
        UIImage *image = [UIImage getImageFromURLString:@"http://qiniu.xiangmei123.com/Uploads/pic/discuss/2016/20161104/581c47d9aa764.jpg?imageView2/1/format/webp"];
        //        UIImage *image = [UIImage imageWithData:data];
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.imageView.image = image;
        }];
    }];
}

-(UIImageView *)imageView
{
    if (!_imageView)
    {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}



@end

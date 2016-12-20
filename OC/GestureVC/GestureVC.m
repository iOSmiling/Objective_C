//
//  GestureVC.m
//  OC
//
//  Created by 薛坤龙 on 2016/12/20.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import "GestureVC.h"

@interface GestureVC ()

@property (nonatomic,strong) UIImageView *testView;

@end

@implementation GestureVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"手势";
    
    [self.view addSubview:self.testView];
    
    self.testView.frame = CGRectMake(self.view.frame.size.width/4, 200, self.view.frame.size.width/2, self.view.frame.size.height/2);
    
    //1，点按手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture)];
    [tap setNumberOfTouchesRequired:1];//设置手指数
    [tap setNumberOfTapsRequired:1];//设置点击次数
    [self.testView addGestureRecognizer:tap];
    //2，旋转手势
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationGesture:)];
    [self.testView addGestureRecognizer:rotation];
    
    //3，缩放手势
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchGesture:)];
    [self.testView addGestureRecognizer:pinch];
    
    //4.移动手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
    [self.testView addGestureRecognizer:pan];
    
    //5.长按手势
    UILongPressGestureRecognizer *longPress =[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressGesture:)];
    [self.testView addGestureRecognizer:longPress];
    
    //6.轻扫手势
    //轻扫手势需要指定方向，如果不指定方向，默认是向右扫
    //向左扫
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGesture:)];
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self.testView addGestureRecognizer:swipeLeft];
    
    //向右扫
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGesture:)];
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.testView addGestureRecognizer:swipeRight];
    
    //向上扫
    UISwipeGestureRecognizer *swipeUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGesture:)];
    [swipeUp setDirection:UISwipeGestureRecognizerDirectionUp];
    [self.testView addGestureRecognizer:swipeUp];
    
    //向下扫
    UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGesture:)];
    [swipeDown setDirection:UISwipeGestureRecognizerDirectionDown];
    [self.testView addGestureRecognizer:swipeDown];


}

//点按手势
-(void)tapGesture
{
    NSLog(@"点我了");
}

//旋转手势
-(void)rotationGesture:(UIRotationGestureRecognizer *)gesture
{
    //改变角度参数
    gesture.view.transform = CGAffineTransformRotate(gesture.view.transform, gesture.rotation);
    gesture.rotation = 0.0f;//重置角度
    
    NSLog(@"旋转了");
}
//缩放手势
-(void)pinchGesture:(UIPinchGestureRecognizer *)gesture
{
    //第一个参数是原来的transform，第二个参数是水平方向缩放的倍数，第三个参数是垂直反方向的倍数
    gesture.view.transform = CGAffineTransformScale(gesture.view.transform, gesture.scale, gesture.scale);
    //会多次调用这个方法，所以每次都要充实缩放的倍数为原始倍数
    gesture.scale = 1.0f;
    
    NSLog(@"缩放了");
}

//移动手势
-(void)panGesture:(UIPanGestureRecognizer *)gesture
{
    [self resetanchorPoint:gesture];
    if (gesture.state != UIGestureRecognizerStateEnded && gesture.state != UIGestureRecognizerStateFailed)
    {
        //获取手势对应的视图
        
        UIView *view = [gesture view];
        CGPoint point = [gesture locationInView:view.superview];
        view.center = point;
        
    }
    NSLog(@"移动了");
}

//重置锚点的方法
-(void)resetanchorPoint:(UIGestureRecognizer *)recognizer
{
    
    if (recognizer.state == UIGestureRecognizerStateBegan)
    {
        
        UIView *view = [recognizer view];
        CGPoint point = [recognizer locationInView:view];
        view.layer.anchorPoint = CGPointMake(point.x/view.frame.size.width, point.y/view.frame.size.height);
        CGPoint point2 = [recognizer locationInView:view.superview];
        view.center = point2;
    }
}

//5.长按手势
-(void)longPressGesture:(UILongPressGestureRecognizer *)gesture
{
    //可以设置如果长按了就缩小，并且改变颜色
    CGFloat scale;
    UIColor *bgColor;
    if(_testView.tag == 0)
    {
        scale = 0.5;
        _testView.tag =1;
        bgColor=[UIColor yellowColor];
    }else
    {
        scale = 1.0;
        _testView.tag =0;
        bgColor = [UIColor purpleColor];
    }
    gesture.view.transform = CGAffineTransformScale(gesture.view.transform, scale, scale);
    gesture.view.backgroundColor = bgColor;
    NSLog(@"长按了");
}

//6.轻扫手势
-(void)swipeGesture:(UISwipeGestureRecognizer *)gesture
{
    switch (gesture.direction)
    {
        case UISwipeGestureRecognizerDirectionLeft:
            NSLog(@"向左扫");
            break;
        case UISwipeGestureRecognizerDirectionRight:
            NSLog(@"向右扫");
            break;
        case UISwipeGestureRecognizerDirectionUp:
            NSLog(@"向上扫");
            break;
        case UISwipeGestureRecognizerDirectionDown:
            NSLog(@"向下扫");
            break;
        default:
            break;
    }
    
}

#pragma mark - Getters and Setters

-(UIImageView *)testView
{
    if (!_testView)
    {
        _testView = [[UIImageView alloc] init];
        _testView.backgroundColor = [UIColor yellowColor];
        _testView.userInteractionEnabled = YES;
    }
    return _testView;
}

#pragma mark - dealloc

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   
}



@end

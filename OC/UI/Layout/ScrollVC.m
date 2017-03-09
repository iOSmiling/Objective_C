//
//  ScrollVC.m
//  OC
//
//  Created by 薛坤龙 on 2017/3/8.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import "ScrollVC.h"

#define SCREEN_WIDTH     [[UIScreen mainScreen] bounds].size.width
#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]
#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

@interface ScrollVC ()<UIScrollViewDelegate>

@property (nonatomic,strong) UIView *contentView;
@property (nonatomic,strong) UIScrollView *scrollView_1;
@property (nonatomic,strong) UIPageControl *pageControl;

@property (nonatomic,strong) NSMutableArray *imageArray; //图片数组

@end

@implementation ScrollVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"scroll";
    self.edgesForExtendedLayout = UIRectEdgeNone;
//    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //本地图片数组
    for (NSInteger i = 1; i < 5; i++)
    {
        [self.imageArray addObject:[UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpg",(long)i]]];
    }
    
    [self initSubViewUI];
    
}

- (void)initSubViewUI
{
    [self.view addSubview:self.scrollView_1];
    [_scrollView_1 addSubview:self.contentView];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //scorllView
    CGFloat scr_h = 300;
    NSDictionary *scroll_me = @{@"scr_h":@(scr_h)};
    NSArray *scroll_h = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_scrollView_1]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_scrollView_1)];
    NSArray *scroll_v = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[_scrollView_1(==scr_h)]" options:0 metrics:scroll_me views:NSDictionaryOfVariableBindings(_scrollView_1)];
    [self.view addConstraints:scroll_h];
    [self.view addConstraints:scroll_v];
    
    //contentview
    NSArray *content_h = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(0)-[_contentView]-(0)-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_contentView)];
    NSArray *content_v = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(0)-[_contentView]-(0)-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_contentView)];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1 constant:scr_h]];
    [self.view addConstraints:content_h];
    [self.view addConstraints:content_v];
    
    //box
    for (int i = 0; i<_imageArray.count; i++)
    {
        UIView *boxView = [UIView new];
        boxView.backgroundColor = randomColor;
        boxView.translatesAutoresizingMaskIntoConstraints = NO;
        [_contentView addSubview:boxView];
        
        UILabel *tipsLabel = [[UILabel alloc] init];
        tipsLabel.backgroundColor = [UIColor whiteColor];
        tipsLabel.textColor = [UIColor blueColor];
        tipsLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [boxView addSubview:tipsLabel];
        NSArray *tipsL_h = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[tipsLabel(==100)]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(tipsLabel)];
        NSArray *tipsL_v = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[tipsLabel(==46)]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(tipsLabel)];
        [self.view addConstraints:tipsL_h];
        [self.view addConstraints:tipsL_v];
        tipsLabel.text = [NSString stringWithFormat:@"%d",i];
        
        NSArray *boxView_v = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(0)-[boxView]-(0)-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(boxView)];
        [self.view addConstraints:boxView_v];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:boxView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_scrollView_1 attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
        
        if (i == 0)
        {
            [self.view addConstraint:[NSLayoutConstraint constraintWithItem:boxView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_contentView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0]];
            
        }else
        {
            UIView *previousBox = _contentView.subviews[i - 1];
            [self.view addConstraint:[NSLayoutConstraint constraintWithItem:boxView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:previousBox attribute:NSLayoutAttributeRight multiplier:1.0 constant:0]];
            
            if (i == _imageArray.count-1)
            {
                [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_contentView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:boxView attribute:NSLayoutAttributeRight multiplier:1.0 constant:0]];
                
            }
        }
    }
}

// 是否支持滑动至顶部
- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView
{
    return YES;
}

// 滑动到顶部时调用该方法
- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidScrollToTop");
}

// scrollView 已经滑动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidScroll");
}

// scrollView 开始拖动
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewWillBeginDragging");
}

// scrollView 结束拖动
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"scrollViewDidEndDragging");
}

// scrollView 开始减速（以下两个方法注意与以上两个方法加以区别）
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewWillBeginDecelerating");
}

// scrollview 减速停止
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidEndDecelerating");
}

- (UIScrollView *)scrollView_1
{
    if (!_scrollView_1)
    {
        _scrollView_1 = [[UIScrollView alloc] init];
        _scrollView_1.backgroundColor = [UIColor purpleColor];
        _scrollView_1.translatesAutoresizingMaskIntoConstraints = NO;
        _scrollView_1.delegate = self;
        
        _scrollView_1.bounces = NO;//是否反弹
        _scrollView_1.pagingEnabled = YES; //是否分页
        _scrollView_1.scrollEnabled = YES;//是否滚动
        _scrollView_1.scrollsToTop = YES;//是否支持滑动到顶端
        
    }
    return _scrollView_1;
}

- (UIView *)contentView
{
    if (!_contentView)
    {
        _contentView = [[UIView alloc] init];
        _contentView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _contentView;
}

- (UIPageControl *)pageControl
{
    if (!_pageControl)
    {
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.pageIndicatorTintColor = [UIColor redColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
        _pageControl.enabled = NO;
    }
    return _pageControl;
}

- (NSMutableArray *)imageArray
{
    if (!_imageArray)
    {
        _imageArray = [NSMutableArray new];
    }
    return _imageArray;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end

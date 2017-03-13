//
//  ScrollVC.m
//  OC
//
//  Created by 薛坤龙 on 2017/3/8.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import "ScrollVC.h"

#define SCREEN_WIDTH  [[UIScreen mainScreen] bounds].size.width
#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]
#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

@interface ScrollVC ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UIView *contentView;
@property (nonatomic,strong) UIScrollView *scrollView_1;
@property (nonatomic,strong) UIPageControl *pageControl;
@property (nonatomic,strong) NSMutableArray *imageArray; //scroll图片数组
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *tableviewArray;//tableView数据数组

@end

@implementation ScrollVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"scroll";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    //本地图片数组
    for (NSInteger i = 1; i < 5; i++)
    {
        [self.imageArray addObject:[UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpg",(long)i]]];
    }
    
    for (NSInteger i = 0; i < 40; i++)
    {
        [self.tableviewArray addObject:[NSString stringWithFormat:@"%ld",i]];
    }
    
    [self initSubViewUI];
    
}

- (void)initSubViewUI
{
    [self.view addSubview:self.tableView];
    _tableView.tableHeaderView = self.scrollView_1;
    [_scrollView_1 addSubview:self.contentView];
    [_scrollView_1 addSubview:self.pageControl];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //tableview
    NSArray *table_h = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_tableView]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_tableView)];
    NSArray *table_v = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[_tableView]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_tableView)];
    [self.view addConstraints:table_h];
    [self.view addConstraints:table_v];
    
    //scorllView
    CGFloat scr_h = 300;
    NSDictionary *scroll_me = @{@"scr_h":@(scr_h)};
    NSArray *scroll_v = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_scrollView_1(==scr_h)]" options:0 metrics:scroll_me views:NSDictionaryOfVariableBindings(_scrollView_1)];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_scrollView_1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
    [self.view addConstraints:scroll_v];
    self.tableView.tableHeaderView = _scrollView_1;
    [self.tableView layoutIfNeeded];

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
        
        UILabel *tipsLabel = [[UILabel alloc] init];
        tipsLabel.backgroundColor = [UIColor whiteColor];
        tipsLabel.textColor = [UIColor blueColor];
        tipsLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [boxView addSubview:tipsLabel];
        NSArray *tipsL_h = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[tipsLabel(==100)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(tipsLabel)];
        NSArray *tipsL_v = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[tipsLabel(==46)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(tipsLabel)];
        [self.view addConstraints:tipsL_h];
        [self.view addConstraints:tipsL_v];
        tipsLabel.text = [NSString stringWithFormat:@"%d",i];
        
    }
    
    //pageControll
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_pageControl attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_pageControl attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:200]];
    NSArray *pageControl_v = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_pageControl(==30)]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_pageControl)];
    [self.view addConstraints:pageControl_v];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   return self.tableviewArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    cell.textLabel.text = _tableviewArray[indexPath.row];
    
    cell.backgroundColor = randomColor;
    [cell.textLabel setTextColor:[UIColor redColor]];
    cell.detailTextLabel.text =[NSString stringWithFormat:@"%ld",(long)indexPath.row];
    cell.imageView.image = [UIImage imageNamed:@"29"];
    
    return cell;

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
    
    NSInteger currentPage = (int)(scrollView.contentOffset.x) / (int)(self.view.frame.size.width);
    self.pageControl.currentPage = currentPage;
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
        _scrollView_1.showsVerticalScrollIndicator = NO;
        _scrollView_1.showsHorizontalScrollIndicator = NO;
        
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
        _pageControl.translatesAutoresizingMaskIntoConstraints = NO;
        _pageControl.pageIndicatorTintColor = [UIColor redColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
        _pageControl.enabled = NO;
        _pageControl.numberOfPages = _imageArray.count;
        _pageControl.currentPage = 0;
        
    }
    return _pageControl;
}

- (UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.translatesAutoresizingMaskIntoConstraints = NO;
        
    }
    return _tableView;
}

- (NSMutableArray *)tableviewArray
{
    if (!_tableviewArray)
    {
        _tableviewArray = [NSMutableArray new];
    }
    return _tableviewArray;
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

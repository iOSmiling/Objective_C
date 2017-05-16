//
//  UIMainVC.m
//  OC
//
//  Created by 薛坤龙 on 2017/2/8.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import "UIMainVC.h"
#import <Masonry.h>
#import "UILabelVC.h"
#import "ScrollShowMainVC.h"
#import "CollectionMainVC.h"
#import "WKWebViewVC.h"
#import "LayoutVC.h"
#import "ActivityViewVC.h"
#import "TableMainVC.h"
#import "RefreshMainVC.h"
#import "ProgressMainVC.h"

static const CGFloat tableViewCellHight = 60.0;

@interface UIMainVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *array;
@property (nonatomic,strong) NSArray *viewControllers;

@end

@implementation UIMainVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"UI";
    
    _array = @[@"UILabel",
               @"ScrollView",
               @"Collection",
               @"WKWebView",
               @"LayoutVC",
               @"ActivityViewVC",
               @"TableMainVC",
               @"Refresh",
               @"进度条"];
    _viewControllers = @[[UILabelVC class],
                         [ScrollShowMainVC class],
                         [CollectionMainVC class],
                         [WKWebViewVC class],
                         [LayoutVC class],
                         [ActivityViewVC class],
                         [TableMainVC class],
                         [RefreshMainVC class],
                         [ProgressMainVC class]];
    
    
    [self.view addSubview:self.tableView];
    
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    __weak typeof(self) weakSelf = self;
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(weakSelf.view.mas_top).offset(0);
        make.left.equalTo(weakSelf.view.mas_left).offset(0);
        make.right.equalTo(weakSelf.view.mas_right).offset(0);
        make.bottom.equalTo(weakSelf.view.mas_bottom).offset(-64);
        
    }];
    
}

#pragma mark - UITableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return tableViewCellHight;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    cell.textLabel.text = _array[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *vc = [_viewControllers[indexPath.row] new];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - Getters and Setters
-(UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

#pragma mark - dealloc
- (void)dealloc
{
    _tableView.delegate = nil;
    _tableView.dataSource = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end

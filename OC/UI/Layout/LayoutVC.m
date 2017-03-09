//
//  LayoutVC.m
//  OC
//
//  Created by 薛坤龙 on 2017/3/6.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import "LayoutVC.h"
#import "Layout_1VC.h"
#import "LayoutTestTableViewCell.h"
#import "LayoutModel.h"
#import "ScrollVC.h"

static NSString * const DCell = @"Cell";

@interface LayoutVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *array;
@property (nonatomic,strong) NSArray *viewControllers;
@property (nonatomic,strong) NSMutableArray *dataArray;


@end

@implementation LayoutVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"layout";
    _viewControllers = @[[Layout_1VC class],
                         [ScrollVC class]];
    
    [self initSubViewUI];
    
    LayoutModel *model1 =[[LayoutModel alloc] init];
    model1.name = @"test1";
    model1.cellH = 100;
    
    LayoutModel *model2 = [[LayoutModel alloc] init];
    model2.name = @"test2";
    model2.cellH = 200;
    
    self.dataArray = [NSMutableArray new];
    [_dataArray addObject:model1];
    [_dataArray addObject:model2];
    
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    NSArray *tableview_h = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_tableView]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_tableView)];
    NSArray *tableview_v = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[_tableView]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_tableView)];
    
    [self.view addConstraints:tableview_h];
    [self.view addConstraints:tableview_v];
    
}

- (void)initSubViewUI
{
     self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_tableView];

}

#pragma mark - UITableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LayoutTestTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DCell];
    if (cell==nil)
    {
        cell = [[LayoutTestTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:DCell];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [cell loadData:_dataArray[indexPath.row]];
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
        _tableView.estimatedRowHeight = 70.0;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        [_tableView registerClass:[LayoutTestTableViewCell class] forCellReuseIdentifier:DCell];
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        
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

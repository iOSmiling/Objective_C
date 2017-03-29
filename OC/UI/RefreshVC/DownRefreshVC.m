//
//  DownRefreshVC.m
//  OC
//
//  Created by 薛坤龙 on 2017/3/28.
//  Copyright © 2017年 sigboat. All rights reserved.
//


#import "DownRefreshVC.h"

#import <Masonry.h>

#import "XMRefreshExtension.h"

@interface DownRefreshVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

/** <#desc#>  */
@property (nonatomic, strong) NSMutableArray *titles;
/** <#desc#>  */
@property (nonatomic, strong) NSArray *classNames;

@end

@implementation DownRefreshVC

- (NSMutableArray *)titles
{
    if (!_titles)
    {
        _titles = [NSMutableArray array];
    }
    return _titles;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"下拉刷新";
    
    // 注意若是存在导航控制器 ，请设置一下属性，不然会导致刷新控件以及tableView的位置异常(没有根据导航控制器的位置自动调节)
    self.tableView.autoresizingMask = UIViewAutoresizingNone;
    self.navigationController.navigationBar.translucent = NO;
    
    [self.view addSubview:self.tableView];
    _tableView.frame = self.view.frame;
    
    [self.titles addObject:@"测试数据1"];
    [self.titles addObject:@"测试数据2"];
    [self.titles addObject:@"测试数据3"];
    [self.tableView reloadData];
    
    self.tableView.xm_footer = [XMHeaderRefresh headerRefreshWithScrollView:self.tableView headerRefreshingBlock:^{
        [self loadNewData];
    }];
    
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
 
    
//    __weak typeof(self) weakSelf = self;
//    
//    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//        make.top.equalTo(weakSelf.view.mas_top).offset(0);
//        make.left.equalTo(weakSelf.view.mas_left).offset(0);
//        make.right.equalTo(weakSelf.view.mas_right).offset(0);
//        make.bottom.equalTo(weakSelf.view.mas_bottom).offset(-64);
//        
//    }];
    
}

- (void)loadNewData
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        for (int i = 0; i < arc4random_uniform(20) + 1; i++) {
            [self.titles insertObject:[NSString stringWithFormat:@"下拉测试数据---%zd",arc4random_uniform(999)] atIndex:0];
        }
        [self.tableView.xm_footer endHeaderRefreshing];
        [self.tableView reloadData];
    });
    
}

//- (void)reloadData{
//    [self.tableView reloadData];
//}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titles.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.titles[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

@end

//
//  TableMainVC.m
//  OC
//
//  Created by 薛坤龙 on 2017/3/13.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import "TableMainVC.h"
#import <Masonry.h>
#import "HelpCenterViewController.h"

static const CGFloat tableViewCellHight = 60.0;

@interface TableMainVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *array;
@property (nonatomic,strong) NSArray *viewControllers;

@end

@implementation TableMainVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"tableview";
    
    _array = @[@"HelpCenterViewController"];
    _viewControllers = @[[HelpCenterViewController class]];
    
    
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


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

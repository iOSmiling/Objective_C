//
//  MenuTableViewController.m
//  MXBarManagerDemo
//
//  Created by apple on 16/5/27.
//  Copyright © 2016年 desn. All rights reserved.
//

#import "MenuTableViewController.h"
#import "MXNavigationBarManager.h"
#import "GradientTableViewController.h"
#import "TranslateTableViewController.h"
#import "MutationTableViewController.h"
#import "ReversalTableViewController.h"

#import "NaviTestShowOneVC.h"

static NSString *const menuCellIdentifer = @"menuCellIdentifer";

@interface MenuTableViewController ()

@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) NSArray *viewControllers;

@end

@implementation MenuTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Menu";
    _titles = @[@"全透明导航栏",
                @"渐变导航栏",
                @"突变导航栏",
                @"颜色反转导航栏",
                @"自定义Navi"];
    _viewControllers = @[[TranslateTableViewController class],
                         [GradientTableViewController class],
                         [MutationTableViewController class],
                         [ReversalTableViewController class],
                         [NaviTestShowOneVC class]];
    
    [self.tableView registerClass:[UITableViewCell class]forCellReuseIdentifier:menuCellIdentifer];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tableView.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.tableView.delegate = nil;
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:menuCellIdentifer forIndexPath:indexPath];
    cell.textLabel.text = _titles[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.navigationController pushViewController:[_viewControllers[indexPath.row] new] animated:YES];
}

@end

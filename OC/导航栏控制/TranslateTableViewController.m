//
//  TranslateTableViewController.m
//  MXBarManagerDemo
//
//  Created by apple on 16/5/27.
//  Copyright © 2016年 desn. All rights reserved.
//

#import "TranslateTableViewController.h"
#import "MXNavigationBarManager.h"

#define SCREEN_RECT [UIScreen mainScreen].bounds

static NSString *const kMXCellIdentifer = @"kMXCellIdentifer";

static const CGFloat headerImageHeight = 260.0f;

@interface TranslateTableViewController ()

@property (nonatomic, strong) UINavigationBar *naviCopy;

@end

@implementation TranslateTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initBaseData];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tableView.delegate = self;
    [self initBarManager];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.tableView.delegate = nil;
    [MXNavigationBarManager reStoreToSystemNavigationBar];
}

- (void)initBarManager
{
    //required
    [MXNavigationBarManager managerWithController:self];
    [MXNavigationBarManager setBarColor:[UIColor clearColor]];
    
    //optional
    [MXNavigationBarManager setTintColor:[UIColor blackColor]];
    [MXNavigationBarManager setStatusBarStyle:UIStatusBarStyleDefault];
}

- (void)initBaseData
{
    self.title = @"长草颜文字";
    
    [self.tableView registerClass:[UITableViewCell class]forCellReuseIdentifier:kMXCellIdentifer];
    self.tableView.showsVerticalScrollIndicator = NO;
    
    UIImageView *headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,
                                                                                 0,
                                                                                 CGRectGetWidth(SCREEN_RECT), headerImageHeight)];
    headerImageView.image = [UIImage imageNamed:@"headerImage"];
    self.tableView.tableHeaderView = headerImageView;
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"right_arrow"]  style:UIBarButtonItemStylePlain target:self action:@selector(pushToBackView)];
    
    self.navigationItem.rightBarButtonItem = barButtonItem;
}

- (void)pushToBackView
{
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMXCellIdentifer forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    
    return cell;
}

@end

//
//  LayoutVC.m
//  OC
//
//  Created by 薛坤龙 on 2017/3/6.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import "LayoutVC.h"
#import "Layout_1VC.h"

@interface LayoutVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *array;
@property (nonatomic,strong) NSArray *viewControllers;



@end

@implementation LayoutVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"layout";
    
    _array = @[@"test"];
    
    _viewControllers = @[[Layout_1VC class]];
    
    [self initSubViewUI];

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
    return 46.0;
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
    [cell.textLabel setTextColor:[UIColor redColor]];
    cell.detailTextLabel.text =[NSString stringWithFormat:@"%ld",(long)indexPath.row];
    cell.imageView.image = [UIImage imageNamed:@"29"];
    
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

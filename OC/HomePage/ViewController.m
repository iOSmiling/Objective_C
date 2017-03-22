//
//  ViewController.m
//  OC
//
//  Created by 薛坤龙 on 2016/12/19.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>
#import "AnimationViewController.h"
#import "GestureVC.h"
#import "ThreadMainVC.h"
#import "PhotoMainVC.h"
#import "MethodMainVC.h"
#import "StorageMainVC.h"
#import "ThirdPartyVC.h"
#import "InteractiveMainVC.h"
#import "MenuTableViewController.h"
#import "UIMainVC.h"
#import "MediatorVC.h"
#import "MediaMainVC.h"

#import "NetworkToos.h"

static const CGFloat tableViewCellHight = 60.0;

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *array;
@property (nonatomic,strong) NSArray *viewControllers;

@end

@implementation ViewController

#pragma mark - Life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"学习";
    
    _array = @[@"Animation",
               @"GestureVC",
               @"Thread",
               @"Storage",
               @"图片操作",
               @"OC常用方法",
               @"第三方使用",
               @"自定义转场",
               @"导航栏渐变控制",
               @"UI",
               @"组件化尝试",
               @"多媒体"];

    _viewControllers = @[[AnimationViewController class],
                         [GestureVC class],
                         [ThreadMainVC class],
                         [StorageMainVC class],
                         [PhotoMainVC class],
                         [MethodMainVC class],
                         [ThirdPartyVC class],
                         [InteractiveMainVC class],
                         [MenuTableViewController class],
                         [UIMainVC class],
                         [MediatorVC class],
                         [MediaMainVC class]];
    
    [self.view addSubview:self.tableView];
    
  NSLog(@"state :%ld",(long)[NetworkToos sharedManager].state)  ;
    
    
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    __weak typeof(self) weakSelf = self;
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(weakSelf.view.mas_top).offset(0);
        make.left.equalTo(weakSelf.view.mas_left).offset(0);
        make.right.equalTo(weakSelf.view.mas_right).offset(0);
        make.bottom.equalTo(weakSelf.view.mas_bottom).offset(-49);
        
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
    /*
     设置 Cell 的存在差异性的那些属性（包括样式和内容）时，有了 if 最好就要有 else，要显式的覆盖所有可能性。
     设置 Cell 的存在差异性的那些属性时，代码要放在初始化代码块的外部。
     */
    
    static NSString *identifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    cell.textLabel.text = _array[indexPath.row];
    
    if (indexPath.row % 2 == 0)
    {
        [cell.textLabel setTextColor:[UIColor redColor]];
        cell.detailTextLabel.text =[NSString stringWithFormat:@"%ld",(long)indexPath.row];
        cell.imageView.image = [UIImage imageNamed:@"29"];
        
    }else
    {
        [cell.textLabel setTextColor:[UIColor blueColor]];
        cell.detailTextLabel.text =nil;
        cell.imageView.image = [UIImage imageNamed:@"Test_1"];
    }
    
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

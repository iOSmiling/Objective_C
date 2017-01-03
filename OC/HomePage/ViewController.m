//
//  ViewController.m
//  OC
//
//  Created by 薛坤龙 on 2016/12/19.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import "ViewController.h"
#import "AnimationViewController.h"
#import "GestureVC.h"
#import "ThreadMainVC.h"
#import "PhotoMainVC.h"
#import "MethodMainVC.h"
#import "ScrollShowMainVC.h"
#import "CollectionMainVC.h"
#import "StorageMainVC.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *array;

@end

@implementation ViewController

#pragma mark - Life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.title = @"学习";
    
    self.array = [[NSMutableArray alloc] init];
    
    [_array addObject:@"Animation"];
    [_array addObject:@"GestureVC"];
    [_array addObject:@"Thread"];
    [_array addObject:@"Storage"];
    [_array addObject:@"图片操作"];
    [_array addObject:@"OC常用方法"];
    [_array addObject:@"ScrollView"];
    [_array addObject:@"Collection"];
    
    [self.view addSubview:self.tableView];
    _tableView.frame = self.view.frame;
    
}

#pragma mark - UITableViewDataSource

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
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = _array[indexPath.row];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row;
    switch (row)
    {
        case 0:
        {
            AnimationViewController *vc1 = [[AnimationViewController alloc] init];
            vc1.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc1 animated:YES];
            break;
        }
        case 1:
        {
            GestureVC *vc2 = [[GestureVC alloc] init];
            vc2.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc2 animated:YES];
            break;
        }
        case 2:
        {
            ThreadMainVC *vc3 = [[ThreadMainVC alloc] init];
            vc3.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc3 animated:YES];
            break;
        }
        case 3:
        {
            StorageMainVC *vc4 = [[StorageMainVC alloc] init];
            vc4.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc4 animated:YES];
            break;
        }
        case 4:
        {
            PhotoMainVC *vc5 = [[PhotoMainVC alloc] init];
            vc5.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc5 animated:YES];
            break;
        }
        case 5:
        {
            MethodMainVC *vc6 = [[MethodMainVC alloc] init];
            vc6.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc6 animated:YES];
            break;
        }
        case 6:
        {
            ScrollShowMainVC *vc7 = [[ScrollShowMainVC alloc] init];
            vc7.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc7 animated:YES];
            break;
        }
        case 7:
        {
            CollectionMainVC *vc = [[CollectionMainVC alloc] init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        
            break;
        }
        default:
            break;
            
    }

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


@end

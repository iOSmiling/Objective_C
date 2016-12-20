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

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong,nonnull) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *array;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.title = @"学习";
    
    self.array = [[NSMutableArray alloc] init];
    
    [_array addObject:@"Animation"];
    [_array addObject:@"GestureVC"];
    
    
    [self.view addSubview:self.tableView];
    _tableView.frame = self.view.frame;
    
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
        default:
            break;
            
    }

}


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

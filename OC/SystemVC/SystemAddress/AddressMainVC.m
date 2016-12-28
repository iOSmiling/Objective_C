//
//  AddressMainVC.m
//  OC
//
//  Created by 薛坤龙 on 2016/12/28.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import "AddressMainVC.h"

#import "AddressOneVC.h"
#import "AddressListVC.h"
#import "AddressSortListVC.h"


@interface AddressMainVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong,nonnull) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *array;


@end

@implementation AddressMainVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"通讯录";
    
    self.array = [[NSMutableArray alloc] init];
    
    [_array addObject:@"通讯录单人"];
    [_array addObject:@"通讯录列表"];
    [_array addObject:@"通讯录排序"];
    
    
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
            AddressOneVC *vc = [[AddressOneVC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 1:
        {
            AddressListVC *vc = [[AddressListVC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 2:
        {
            AddressSortListVC *vc = [[AddressSortListVC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 3:
        {
            
            break;
        }
        case 4:
        {
            
            break;
        }
        case 5:
        {
            
            break;
        }
        case 6:
        {
            
            break;
        }
        case 7:
        {
            
            
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
 
}


@end

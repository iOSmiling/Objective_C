//
//  ThreadMainVC.m
//  OC
//
//  Created by 薛坤龙 on 2016/12/20.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import "ThreadMainVC.h"
#import "OperationVC.h"
#import "GCDVC.h"

@interface ThreadMainVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong,nonnull) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *array;

@end

@implementation ThreadMainVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"线程";
    
    self.array = [[NSMutableArray alloc] init];
    
    [_array addObject:@"Operation"];
    [_array addObject:@"GCD"];

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
            OperationVC *vc1 = [[OperationVC alloc] init];
            [self.navigationController pushViewController:vc1 animated:YES];
            break;
        }
        case 1:
        {
            GCDVC *vc2 = [[GCDVC alloc] init];
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
 
}



@end

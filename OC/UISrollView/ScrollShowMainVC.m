//
//  ScrollShowMainVC.m
//  OC
//
//  Created by 薛坤龙 on 2016/12/21.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import "ScrollShowMainVC.h"
#import "ScrollShowTestOneVC.h"
#import "ScrollShowTwoVC.h"

@interface ScrollShowMainVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong,nonnull) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *array;

@end

@implementation ScrollShowMainVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"ScrollView";
    
    self.array = [[NSMutableArray alloc] init];
    
    [_array addObject:@"ShowOne"];
    [_array addObject:@"ShowTwo"];
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
            ScrollShowTestOneVC *vc1 = [[ScrollShowTestOneVC alloc] init];
            [self.navigationController pushViewController:vc1 animated:YES];
            break;
        }
        case 1:
        {
            ScrollShowTwoVC *vc2 = [[ScrollShowTwoVC alloc] init];
            [self.navigationController pushViewController:vc2 animated:YES];
            
            break;
        }
        case 2:
        {
      
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

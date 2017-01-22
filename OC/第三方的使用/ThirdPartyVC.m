//
//  ThirdPartyVC.m
//  OC
//
//  Created by 薛坤龙 on 2017/1/20.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import "ThirdPartyVC.h"
#import <Masonry.h>
#import "AFNVC.h"

@interface ThirdPartyVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *array;

@end

@implementation ThirdPartyVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"第三方的使用";
    
    self.array = [[NSMutableArray alloc] init];
    [_array addObject:@"AFN"];
    
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
            AFNVC *vc = [[AFNVC alloc] init];
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
  
}



@end

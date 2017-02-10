//
//  MasonryMainVC.m
//  OC
//
//  Created by 薛坤龙 on 2017/2/5.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import "MasonryMainVC.h"
#import <Masonry.h>
#import "MasonryMainTableViewCell.h"
#import "MasonryCellModel.h"

static NSString * const cellIdentifer = @"CellIdentifer";

@interface MasonryMainVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *dataArray;

@property (strong, nonatomic) MasonryMainTableViewCell *templateCell;

@end

@implementation MasonryMainVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"Masonry";
    
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[MasonryMainTableViewCell class] forCellReuseIdentifier:NSStringFromClass([MasonryMainTableViewCell class])];
    
    [self generateData];
    
    [_tableView reloadData];
    
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    __weak typeof(self) weakSelf = self;
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(weakSelf.view.mas_top).offset(0);
        make.left.equalTo(weakSelf.view.mas_left).offset(0);
        make.right.equalTo(weakSelf.view.mas_right).offset(0);
        make.bottom.equalTo(weakSelf.view.mas_bottom).offset(0);
        
    }];
}

#pragma mark - UITableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!_templateCell)
    {
        _templateCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MasonryMainTableViewCell class])];
        _templateCell.tag = -1000; // For debug dealloc
    }
    
    // 获取对应的数据
    MasonryCellModel *dataEntity = _dataArray[(NSUInteger) indexPath.row];
    
    // 判断高度是否已经计算过
    if (dataEntity.cellHeight <= 0)
    {
        // 填充数据
        [_templateCell setupData:dataEntity];
        // 根据当前数据，计算Cell的高度，注意+1
        dataEntity.cellHeight = [_templateCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height + 0.5f;
        NSLog(@"Calculate: %ld, height: %g", (long) indexPath.row, dataEntity.cellHeight);
    } else
    {
        NSLog(@"Get cache: %ld, height: %g", (long) indexPath.row, dataEntity.cellHeight);
    }
    return dataEntity.cellHeight;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MasonryMainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MasonryMainTableViewCell class]) forIndexPath:indexPath];
    [cell setupData:_dataArray[(NSUInteger) indexPath.row]];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.estimatedRowHeight = 80.0f;
        
 

    }
    return _tableView;
}

// 生成数据
- (void)generateData
{
    NSMutableArray *tmpData = [NSMutableArray new];
    
    for (int i = 0; i < 20; i++)
    {
        MasonryCellModel *dataEntity = [MasonryCellModel new];
        dataEntity.avatar = [UIImage imageNamed:[NSString stringWithFormat:@"bluefaces_%d", (i % 4) + 1]];
        dataEntity.title = [NSString stringWithFormat:@"Title: %d", i];
        dataEntity.content = [self getText:@"content-" withRepeat:i * 2 + 1];
        [tmpData addObject:dataEntity];
    }
    
    _dataArray = tmpData;
}

- (NSString *)getText:(NSString *)text withRepeat:(int)repeat
{
    NSMutableString *tmpText = [NSMutableString new];
    
    for (int i = 0; i < repeat; i++) {
        [tmpText appendString:text];
    }
    
    return tmpText;
}



#pragma mark - dealloc
- (void)dealloc
{

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end

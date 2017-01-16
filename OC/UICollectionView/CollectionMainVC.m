//
//  CollectionMainVC.m
//  OC
//
//  Created by 薛坤龙 on 2016/12/27.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import "CollectionMainVC.h"
#import "CollectionWaterFallVC.h"

@interface CollectionMainVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong,nonnull) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *array;


@end

@implementation CollectionMainVC

- (void)viewDidLoad
{
    [super viewDidLoad];
 
    self.navigationItem.title = @"CollectionView";
    self.array = [[NSMutableArray alloc] init];
    [_array addObject:@"瀑布流"];

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
            CollectionWaterFallVC *vc = [[CollectionWaterFallVC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            
            break;
        }
        case 1:
        {
           
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

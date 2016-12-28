//
//  PhotoMainVC.m
//  OC
//
//  Created by 薛坤龙 on 2016/12/20.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import "PhotoMainVC.h"
#import "SelectMorePhotoVC.h"
#import "SavePhotoToAlbumVC.h"
#import "SelectPhotoAndEditVC.h"
#import "XMSelectPhotoTwoVC.h"

@interface PhotoMainVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong,nonnull) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *array;

@end

@implementation PhotoMainVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"图片操作";
    self.array = [[NSMutableArray alloc] init];
    
    [_array addObject:@"图片多选1"];
    [_array addObject:@"保存图片到系统相册"];
    [_array addObject:@"选取编辑"];
    [_array addObject:@"图片多选2"];
   
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
            SelectMorePhotoVC *vc1 = [[SelectMorePhotoVC alloc] init];
            [self.navigationController pushViewController:vc1 animated:YES];
            break;
        }
        case 1:
        {
            SavePhotoToAlbumVC *vc2 = [[SavePhotoToAlbumVC alloc] init];
            [self.navigationController pushViewController:vc2 animated:YES];
        
            break;
        }
        case 2:
        {
            SelectPhotoAndEditVC *vc3 = [[SelectPhotoAndEditVC alloc] init];
            [self.navigationController pushViewController:vc3 animated:YES];
         
            break;
        }
        case 3:
        {
            XMSelectPhotoTwoVC *vc = [[XMSelectPhotoTwoVC alloc] init];
             [self.navigationController pushViewController:vc animated:YES];
           
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

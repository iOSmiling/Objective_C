//
//  SettingVC.m
//  OC
//
//  Created by 薛坤龙 on 2016/12/19.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import "SettingVC.h"
#import <Masonry.h>
#import "IntoSystemLimitsVC.h"
#import "AddressMainVC.h"
#import "LocationVC.h"

#import <AVFoundation/AVFoundation.h>
#import <AVFoundation/AVCaptureDevice.h>
#import <AVFoundation/AVMediaFormat.h>

#import <AssetsLibrary/AssetsLibrary.h> //相册
#import <CoreLocation/CoreLocation.h> //定位

#import "FattributesVC.h"
#import "MapTestVC.h"

@interface SettingVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong,nonnull) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *array;

@end

@implementation SettingVC

#pragma mark - Life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"系统";
    
    self.array = [[NSMutableArray alloc] init];
    
    [_array addObject:@"权限设置跳转"];
    [_array addObject:@"通讯录"];
    [_array addObject:@"系统定位"];
    [_array addObject:@"Fattributes"];
    [_array addObject:@"地图"];
  
    
    [self.view addSubview:self.tableView];
    _tableView.frame = self.view.frame;
    
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];

    __weak typeof(self) weakSelf = self;
    
    [self.view addSubview:self.tableView];
    
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
            IntoSystemLimitsVC *vc = [[IntoSystemLimitsVC alloc] init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 1:
        {
            AddressMainVC *vc = [[AddressMainVC alloc] init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
 
            break;
        }
        case 2:
        {
            LocationVC *vc = [[LocationVC alloc] init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
 
            break;
        }
        case 3:
        {
            FattributesVC *vc = [[FattributesVC alloc] init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
     
            break;
        }
        case 4:
        {
            MapTestVC *vc = [[MapTestVC alloc] init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
    
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

//相册
- (void)rules
{

    ALAuthorizationStatus author = [ALAssetsLibrary authorizationStatus];
    if (author == ALAuthorizationStatusRestricted || author ==ALAuthorizationStatusDenied){
        //无权限 做一个友好的提示
        UIAlertView * alart = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"请您设置允许APP访问您的相册\n设置>隐私>照片" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alart show];
        return ;
    } else
    {
        //打开相机
    }
    
}

//相机
- (void)rules1
{

    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (authStatus == AVAuthorizationStatusRestricted || authStatus ==AVAuthorizationStatusDenied)
    {
        //无权限 做一个友好的提示
        UIAlertView * alart = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"请您设置允许APP访问您的相机\n设置>隐私>相机" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alart show];
        return ;
    } else
    {
        //调用相机
    }
    
}

- (void)rules2
{
    
    
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

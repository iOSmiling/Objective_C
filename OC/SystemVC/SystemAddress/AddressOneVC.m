//
//  AddressOneVC.m
//  OC
//
//  Created by 薛坤龙 on 2016/12/28.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import "AddressOneVC.h"

#import "OCBaseViewController+getContactInfor.h"

@interface AddressOneVC ()

@property (nonatomic, strong) UIButton *button;

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *photoLabel;


@end

@implementation AddressOneVC

- (void)viewDidLoad
{
    [super viewDidLoad];
 
    self.navigationItem.title = @"单个信息";
    
    [self.view addSubview:self.button];
    [self.view addSubview:self.nameLabel];
    [self.view addSubview:self.photoLabel];
    
    _button.frame = CGRectMake((self.view.frame.size.width-150)/2, 152, 150, 50);
    _nameLabel.frame = CGRectMake((self.view.frame.size.width-150)/2, CGRectGetMaxY(_button.frame)+20, 150, 50);
    _photoLabel.frame = CGRectMake((self.view.frame.size.width-150)/2, CGRectGetMaxY(_nameLabel.frame)+20, 150, 50);
    
    
    
}

- (void)readContactInfor:(UIButton *)sender
{
    
    [self CheckAddressBookAuthorizationandGetPeopleInfor:^(NSDictionary *data)
    {
        
        if (data != nil)
        {
            _nameLabel.text = data[@"name"];
            _photoLabel.text = data[@"phone"];
        }
    }];
    
}


- (UIButton *)button
{
    if (!_button)
    {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button setTitle:@"选取" forState:UIControlStateNormal];
        [_button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(readContactInfor:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

- (UILabel *)nameLabel
{
    if (!_nameLabel)
    {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.backgroundColor = [UIColor orangeColor];
        _nameLabel.textColor = [UIColor whiteColor];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _nameLabel;
}

- (UILabel *)photoLabel
{
    if (!_photoLabel)
    {
        _photoLabel = [[UILabel alloc] init];
        _photoLabel.backgroundColor = [UIColor orangeColor];
        _photoLabel.textColor = [UIColor whiteColor];
        _photoLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _photoLabel;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}


@end

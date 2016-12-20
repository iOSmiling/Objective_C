//
//  FMDBVC.m
//  OC
//
//  Created by 薛坤龙 on 2016/12/20.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import "FMDBVC.h"

@interface FMDBVC ()

@property (nonatomic,strong) UIImageView *imageView;

@end

@implementation FMDBVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"FMDB";
    [self.view addSubview:self.imageView];
    self.imageView.frame = CGRectMake(self.view.frame.size.width/4, 200, self.view.frame.size.width/2, self.view.frame.size.height/2);
}

-(UIImageView *)imageView
{
    if (!_imageView)
    {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   
}



@end

//
//  FMDBVC.m
//  OC
//
//  Created by 薛坤龙 on 2016/12/20.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import "FMDBVC.h"
#import "ImageDB.h"
#import "ImageModel.h"
#import "UIImage+Extend.h"
#import <UIImageView+WebCache.h>

@interface FMDBVC ()

@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) ImageDB *imageDB;
@property (nonatomic,strong) ImageModel *model1;
@property (nonatomic,strong) ImageModel *model2;

@end

@implementation FMDBVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"FMDB";
    [self.view addSubview:self.imageView];
    self.imageView.frame = CGRectMake(self.view.frame.size.width/4, 200, self.view.frame.size.width/2, self.view.frame.size.height/2);
    
    
    //创建表
    self.imageDB = [[ImageDB alloc] init];
    
    [_imageDB createDataBase];
    
    //增加数据
    [self addData];

    //删除数据
//    [self deleteData];
}

- (void)addData
{
    _model2 = [[ImageModel alloc] init];
    _model2.imageID = @"image_2";
    _model2.imageUrl = @"http://qiniu.xiangmei123.com/Uploads/pic/discuss/2016/20161104/581c47d9aa764.jpg?imageView2/1/format/webp";
    
    _model1 = [[ImageModel alloc] init];
    _model1.imageID = @"image_1";
    _model1.imageUrl = @"http://qiniu.xiangmei123.com/Uploads/pic/discuss/2016/20161104/581c47d9aa764.jpg?imageView2/1/format/webp";
    
    
    [[[NSOperationQueue alloc] init] addOperationWithBlock:^{
    
//        UIImage *image = [UIImage getImageFromURLString:_model2.imageUrl];
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//            self.imageView.image = image;
            
            [self.imageView sd_setImageWithURL:[NSURL URLWithString:_model1.imageUrl] placeholderImage:nil options:SDWebImageRetryFailed];
        }];
    }];
    
    [_imageDB saveUser:_model1];
    [_imageDB saveUser:_model2];
    
}

- (void)deleteData
{
    [_imageDB deleteUserWithId:_model1];

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

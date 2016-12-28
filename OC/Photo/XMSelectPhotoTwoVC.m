//
//  XMSelectPhotoTwoVC.m
//  OC
//
//  Created by 薛坤龙 on 2016/12/28.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import "XMSelectPhotoTwoVC.h"

#import "FCSmallImageViewController.h"

@interface XMSelectPhotoTwoVC ()

@property (strong,nonatomic)UIScrollView *myScrollView;

@property (nonatomic,strong) UIButton *selectButton;

@end

@implementation XMSelectPhotoTwoVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"图片选取";
    
    self.selectButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_selectButton setTitle:@"选取图片" forState:UIControlStateNormal];
    [_selectButton setBackgroundColor:[UIColor orangeColor]];
    self.selectButton.frame = CGRectMake(30, 94, (self.view.frame.size.width-60), 30);
    [_selectButton addTarget:self action:@selector(chooseImageToShow) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.selectButton];
    
    CGFloat scrollW = [UIScreen mainScreen].bounds.size.width-40;
    _myScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(20, 160, scrollW, 80)];
    _myScrollView.showsVerticalScrollIndicator = NO;
    _myScrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_myScrollView];
}

- (void)chooseImageToShow
{
    FCSmallImageViewController *smallVC = [[FCSmallImageViewController alloc]init];
    smallVC.maxSelect = 5;
    smallVC.returnBlock = ^(NSArray *imageArr){
        //选择的图片
        [_myScrollView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
        {
            [obj removeFromSuperview];
        }];
        _myScrollView.contentSize = CGSizeMake((imageArr.count+1)*10+imageArr.count*80, 0);
        [imageArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
         {
            UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(10*(idx+1)+80*idx, 0, 80, 80)];
            image.image = obj;
            [_myScrollView addSubview:image];
         }];
    };
    [self.navigationController pushViewController:smallVC animated:YES];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

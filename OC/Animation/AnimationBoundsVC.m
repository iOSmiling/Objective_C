//
//  AnimationBoundsVC.m
//  OC
//
//  Created by 薛坤龙 on 2016/12/19.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import "AnimationBoundsVC.h"

@interface AnimationBoundsVC ()

@property (nonatomic,strong) UIView *AView;
@property (nonatomic,strong) UIView *BView;
@property (nonatomic,strong) UIView *CView;

@property (nonatomic,strong) UIButton *btn;

@property (nonatomic) CGRect originalBFrame;

@end

@implementation AnimationBoundsVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self.view addSubview:self.AView];
    self.AView.frame = CGRectMake(0, 0, 100, 100);
    self.AView.backgroundColor = [UIColor yellowColor];
    
    [self.AView addSubview:self.BView];
    self.BView.frame = CGRectMake(0, 0, 50, 50);
    self.BView.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:self.CView];
    self.CView.frame = CGRectMake(100, 100, 100, 100);
    self.CView.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:self.btn];
    self.btn.frame = CGRectMake((self.view.frame.size.width - 100)/2, self.view.frame.size.height - 46 -64, 100, 46);
    [self.btn setTitle:@"测试" forState:UIControlStateNormal];
    [self.btn addTarget:self action:@selector(btnEvent:) forControlEvents:UIControlEventTouchUpInside];
    
    CGRect originalFrame = self.BView.frame;
    self.originalBFrame = originalFrame;
    
}

- (void)btnEvent:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    btn.selected = !btn.isSelected;
    
    NSLog(@"%@",self.BView);

    
    if (btn.selected)
    {
        CGRect targetFrame = [_AView convertRect:_BView.frame toView:_CView];
        self.BView.frame = targetFrame;
        NSLog(@"%@",self.BView);
      
        
    }else
    {
        self.BView.frame = self.originalBFrame;
        NSLog(@"%@",self.BView);
    }
    

    
   
  
   
    
    
    
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
  
}

- (UIView *)AView
{
    if (!_AView)
    {
        _AView = [[UIView alloc] init];
    }
    return _AView;
}

- (UIView *)BView
{
    if (!_BView)
    {
        _BView = [[UIView alloc] init];
    }
    return _BView;
}

- (UIView *)CView
{
    if (!_CView)
    {
        _CView = [[UIView alloc] init];
    }
    return _CView;
}

- (UIButton *)btn
{
    if (!_btn)
    {
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn.layer.masksToBounds = YES;
        _btn.layer.borderWidth = 1;
        _btn.layer.borderColor = [UIColor blueColor].CGColor;
        [_btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }
    return _btn;
}

@end

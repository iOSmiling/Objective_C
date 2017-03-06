//
//  Layout_1VC.m
//  OC
//
//  Created by 薛坤龙 on 2017/3/6.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import "Layout_1VC.h"

@interface Layout_1VC ()

@property (nonatomic,strong) UIView *view_1;

@property (nonatomic,strong) UIView *bottom_1;
@property (nonatomic,strong) UIView *bottom_2;
@property (nonatomic,strong) UIView *bottom_3;


@end

@implementation Layout_1VC

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initSubViewUI];
    
    self.edgesForExtendedLayout=UIRectEdgeBottom;
    
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    //view_1
    NSDictionary *view_1_metrics = @{@"margin":@20};
    NSArray *view_1_h = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-margin-[_view_1(50)]" options:NSLayoutFormatAlignAllTop metrics:view_1_metrics views:NSDictionaryOfVariableBindings(_view_1)];
    NSArray *view_1_v = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-margin-[_view_1(100)]" options:NSLayoutFormatAlignAllLeft metrics:view_1_metrics views:NSDictionaryOfVariableBindings(_view_1)];
    [self.view addConstraints:view_1_h];
    [self.view addConstraints:view_1_v];
    
    //bottom_1
    NSArray *bottom_1_h = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[_bottom_1]-20-[_bottom_2(==_bottom_1)]-20-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_bottom_1,_bottom_2)];
    NSArray *bottom_1_v = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_bottom_1(46)]-20-|" options:NSLayoutFormatAlignAllBottom metrics:nil views:NSDictionaryOfVariableBindings(_bottom_1,_bottom_2)];
    [self.view addConstraints:bottom_1_h];
    [self.view addConstraints:bottom_1_v];
    
    //bottom_2
//    NSArray *bottom_2_h = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[_bottom_1]-20-[_bottom_2(==_bottom_1)]-20-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_bottom_2,_bottom_1)];
    NSArray *bottom_2_v = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_bottom_2(46)]-20-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_bottom_2,_bottom_1)];
//    [self.view addConstraints:bottom_2_h];
    [self.view addConstraints:bottom_2_v];
    
    //view
    UIView *redView = [[UIView alloc]init];
    redView.backgroundColor = [UIColor redColor];
    redView.translatesAutoresizingMaskIntoConstraints= NO;
    [self.view addSubview:redView];
    
    UIView *blueView = [[UIView alloc]init];
    blueView.backgroundColor = [UIColor blueColor];
    blueView.translatesAutoresizingMaskIntoConstraints= NO;
    [self.view addSubview:blueView];
    
    //水平方向
    NSString *hVFL=@"H:|-20-[redView]-30-[blueView(==redView)]-20-|";
    NSArray *hCons =[NSLayoutConstraint constraintsWithVisualFormat:hVFL options:NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllBottom metrics:nil views:@{@"redView":redView,@"blueView":blueView}];
    [self.view addConstraints:hCons];
        //垂直方向
    NSString *vVFL =@"V:|-20-[redView(50)]";
    NSArray *vCons =[NSLayoutConstraint constraintsWithVisualFormat:vVFL options:0 metrics:nil views:@{@"redView":redView}];
    [self.view addConstraints:vCons];
    
    
}

- (void)initSubViewUI
{
    [self.view addSubview:self.view_1];
    [self.view addSubview:self.bottom_1];
    [self.view addSubview:self.bottom_2];
    [self.view addSubview:self.bottom_3];

}


- (UIView *)view_1
{
    if (!_view_1)
    {
        _view_1 = [[UIView alloc] init];
        _view_1.backgroundColor = [UIColor redColor];
        _view_1.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _view_1;
}

- (UIView *)bottom_1
{
    if (!_bottom_1)
    {
        _bottom_1 = [[UIView alloc] init];
        _bottom_1.backgroundColor = [UIColor blueColor];
        _bottom_1.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _bottom_1;
}

- (UIView *)bottom_2
{
    if (!_bottom_2)
    {
        _bottom_2 = [[UIView alloc] init];
        _bottom_2.backgroundColor = [UIColor yellowColor];
        _bottom_2.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _bottom_2;
}
- (UIView *)bottom_3
{
    if (!_bottom_3)
    {
        _bottom_3 = [[UIView alloc] init];
        _bottom_3.backgroundColor = [UIColor orangeColor];
        _bottom_3.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _bottom_3;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



@end

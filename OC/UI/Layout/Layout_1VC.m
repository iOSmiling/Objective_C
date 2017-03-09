//
//  Layout_1VC.m
//  OC
//
//  Created by 薛坤龙 on 2017/3/6.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import "Layout_1VC.h"

@interface Layout_1VC ()

@property (strong, nonatomic)  NSLayoutConstraint *height;

@property (nonatomic,assign) CGFloat magin_h;

@property (nonatomic,strong) UIView *view_1;
@property (nonatomic,strong) UIView *redView;

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
    
    _magin_h = 20;
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
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
    _redView = [[UIView alloc]init];
    _redView.backgroundColor = [UIColor redColor];
    _redView.translatesAutoresizingMaskIntoConstraints= NO;
    [self.view addSubview:_redView];
    
    UIView *blueView = [[UIView alloc]init];
    blueView.backgroundColor = [UIColor blueColor];
    blueView.translatesAutoresizingMaskIntoConstraints= NO;
    [self.view addSubview:blueView];
    
    //水平方向
    NSString *hVFL=@"H:|-20-[_redView]-30-[blueView(==_redView)]-20-|";
    NSArray *hCons =[NSLayoutConstraint constraintsWithVisualFormat:hVFL options:NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllBottom metrics:nil views:@{@"_redView":_redView,@"blueView":blueView}];
    [self.view addConstraints:hCons];
    //垂直方向
    NSString *vVFL =@"V:|-20-[_redView(50)]";
    NSArray *vCons =[NSLayoutConstraint constraintsWithVisualFormat:vVFL options:0 metrics:nil views:@{@"_redView":_redView}];
    [self.view addConstraints:vCons];
    
    //view_1
    NSDictionary *view_1_metrics = @{@"margin":@(_magin_h)};
    
    _height = [NSLayoutConstraint constraintWithItem:_view_1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:200];
    
    NSArray *view_1_h = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-margin-[_view_1(50)]" options:0 metrics:view_1_metrics views:NSDictionaryOfVariableBindings(_view_1)];
    NSArray *view_1_v = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_redView]-[_view_1]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_view_1,_redView)];
    [self.view addConstraints:view_1_h];
    [self.view addConstraints:view_1_v];
    [self.view addConstraint:_height];
    
    //button
    UIButton *button_1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button_1.translatesAutoresizingMaskIntoConstraints = NO;
    button_1.backgroundColor = [UIColor orangeColor];
    [button_1 addTarget:self action:@selector(buttonEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button_1];
    
    NSArray *button_h = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[_view_1]-[button_1(100)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(button_1,_view_1)];
    
    NSArray *button_v = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_redView]-[button_1(46)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(button_1,_redView)];
    [self.view addConstraints:button_h];
    [self.view addConstraints:button_v];


}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
}

- (void)updateViewConstraints
{
    [super updateViewConstraints];
    
}

- (void)loadViewIfNeeded
{
    [super loadViewIfNeeded];
    
}


- (void)initSubViewUI
{
    [self.view addSubview:self.view_1];
    [self.view addSubview:self.bottom_1];
    [self.view addSubview:self.bottom_2];
    [self.view addSubview:self.bottom_3];

}

- (void)buttonEvent
{
    NSLog(@"up");
    
    [self.view layoutIfNeeded];
    
    [UIView animateWithDuration:2.0 animations:^{
        
        _height.constant = 100;
        _view_1.alpha = 0.5;
        
        [self.view layoutIfNeeded];
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:2.0 animations:^{
            _height.constant = 200;
            _view_1.alpha = 1.0;
            [self.view layoutIfNeeded];
            
        } completion:^(BOOL finished) {
            
        }];
    }];
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

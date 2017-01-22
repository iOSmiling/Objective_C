//
//  AnimationTransformVC.m
//  OC
//
//  Created by 薛坤龙 on 2016/12/19.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import "AnimationTransformVC.h"

const CGFloat kCircleViewSize = 90.0f;

@interface AnimationTransformVC ()

@property (nonatomic,strong,nonnull) UIButton *btn;

@property(nonatomic, strong) UIView *circleView;
@property(nonatomic) BOOL animationHappening;

@end

@implementation AnimationTransformVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:self.btn];
    
    [self setupCircleView];
    [self setupTapActions];
    
}

-(void)viewDidLayoutSubviews
{
    if(self.circleView.superview == nil)
    {
        [self.view addSubview: self.circleView];
    }
    
    self.circleView.center = self.view.center;
}

#pragma mark - Setup
-(void)setupCircleView
{
    self.circleView = [[UIView alloc] initWithFrame: CGRectMake(0, 0, kCircleViewSize, kCircleViewSize)];
    self.circleView.layer.cornerRadius = kCircleViewSize/2.0f;
    self.circleView.backgroundColor = [UIColor purpleColor];
}

-(void)setupTapActions
{
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedOnMainView:)];
    singleTap.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer: singleTap];
    
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedOnMainView:)];
    doubleTap.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer: doubleTap];
    
    [singleTap requireGestureRecognizerToFail: doubleTap];
}

#pragma makr - Actions
-(void)tappedOnMainView: (UITapGestureRecognizer*)tap
{
    if(self.animationHappening)
    {
        return;
    }
    
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    if(tap.numberOfTapsRequired == 1)
    {
        transform = CGAffineTransformScale(self.circleView.transform, 1.3, 1.3);
    }
    
    self.animationHappening = YES;
    [UIView animateWithDuration:0.3f
                     animations:^{
                         self.circleView.transform = transform;
                     } completion:^(BOOL finished) {
                         self.animationHappening = NO;
                     }];
}

- (void)btnEvent:(id)sender
{

    NSLog(@"btn");
    
    _btn.transform = CGAffineTransformMakeScale(1.5, 1.5);
    //    _btn.transform = CGAffineTransformScale(_btn.transform, 1.5, 1.5);
    
}

- (UIButton *)btn
{
    if (!_btn)
    {
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn addTarget:self action:@selector(btnEvent:) forControlEvents:UIControlEventTouchUpInside];
        _btn.frame = CGRectMake((self.view.frame.size.width - 100)/2, self.view.frame.size.height - 246, 100, 46);
        
        [_btn setTitle:@"点击" forState:UIControlStateNormal];
        [_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _btn.layer.borderWidth = 1;
        _btn.layer.borderColor = [UIColor blackColor].CGColor;
        
    }
    return _btn;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



@end

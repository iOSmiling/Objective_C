//
//  AnimationKeyFramesVC.m
//  OC
//
//  Created by 薛坤龙 on 2016/12/19.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import "AnimationKeyFramesVC.h"

@interface AnimationKeyFramesVC ()

@property (nonatomic,strong) UIImageView *anImageView;
@property (nonatomic,strong) UIButton *anButton;

@end

@implementation AnimationKeyFramesVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Animation_keyFrames";
    
    [self.view addSubview:self.anImageView];
    self.anImageView.frame = CGRectMake(self.view.frame.size.width/2-100, 200, 200, 100);
    
    [self.view addSubview:self.anButton];
    self.anButton.frame = CGRectMake(self.view.frame.size.width/2-50, self.view.frame.size.height-146, 100, 46);
}

-(void)changeKeyFrames
{
    
    /**
     *  添加关键帧方法
     *
     *  @param duration   动画时长
     *  @param delay      动画延迟
     *  @param options    动画效果选项
     *  @param animations 动画执行代码
     *  @param completion 动画结束执行代码
     */
    
    [UIView animateKeyframesWithDuration:9.0 delay:0.f options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
        
        /**
         *  添加关键帧
         *
         *  @param frameStartTime 动画相对开始时间
         *  @param frameDuration  动画相对持续时间
         *  @param animations     动画执行代码
         */
        [UIView addKeyframeWithRelativeStartTime:0.f relativeDuration:1.0 / 4 animations:^{
            self.anImageView.backgroundColor = [UIColor colorWithRed:0.9475 green:0.1921 blue:0.1746 alpha:1.0];
        }];
        [UIView addKeyframeWithRelativeStartTime:1.0 / 4 relativeDuration:1.0 / 4 animations:^{
            self.anImageView.backgroundColor = [UIColor colorWithRed:0.1064 green:0.6052 blue:0.0334 alpha:1.0];
        }];
        [UIView addKeyframeWithRelativeStartTime:2.0 / 4 relativeDuration:1.0 / 4 animations:^{
            self.anImageView.backgroundColor = [UIColor colorWithRed:0.1366 green:0.3017 blue:0.8411 alpha:1.0];
        }];
        [UIView addKeyframeWithRelativeStartTime:3.0 / 4 relativeDuration:1.0 / 4 animations:^{
            self.anImageView.backgroundColor = [UIColor colorWithRed:0.619 green:0.037 blue:0.6719 alpha:1.0];
        }];
        [UIView addKeyframeWithRelativeStartTime:3.0 / 4 relativeDuration:1.0 / 4 animations:^{
            self.anImageView.backgroundColor = [UIColor whiteColor];
        }];
        
        
    } completion:^(BOOL finished) {
        
        NSLog(@"动画完成");
        
    }];
    
}

-(UIImageView *)anImageView
{
    if (!_anImageView)
    {
        _anImageView = [[UIImageView alloc] init];
        //        _anImageView.image = [UIImage imageNamed:@"1.jpg"];
        _anImageView.layer.borderWidth = 1;
        _anImageView.layer.borderColor = [UIColor blackColor].CGColor;
        _anImageView.layer.cornerRadius = 5;
    }
    return _anImageView;
}

-(UIButton *)anButton
{
    if (!_anButton)
    {
        _anButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _anButton.layer.borderWidth = 1;
        _anButton.layer.borderColor = [UIColor blackColor].CGColor;
        [_anButton setTitle:@"动画" forState:UIControlStateNormal];
        [_anButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_anButton addTarget:self action:@selector(changeKeyFrames) forControlEvents:UIControlEventTouchUpInside];
    }
    return _anButton;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

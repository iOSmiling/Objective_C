//
//  AnimationSpringVC.m
//  OC
//
//  Created by 薛坤龙 on 2016/12/19.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import "AnimationSpringVC.h"

@interface AnimationSpringVC ()

@property (nonatomic,strong) UIImageView *anImageView;
@property (nonatomic,strong) UIButton *anButton;

@end

@implementation AnimationSpringVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Animation_spring";
    
    [self.view addSubview:self.anImageView];
    self.anImageView.frame = CGRectMake(self.view.frame.size.width/2-100, 200, 200, 100);
    
    [self.view addSubview:self.anButton];
    self.anButton.frame = CGRectMake(self.view.frame.size.width/2-50, self.view.frame.size.height-146, 100, 46);
    
}

-(void)springAnimation
{
    CGRect originalRect = self.anImageView.frame;
    CGRect rect = CGRectMake(self.anImageView.frame.origin.x-80, self.anImageView.frame.origin.y, 120, 120);
    
    [UIView animateWithDuration:0.4 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:4 options:UIViewAnimationOptionCurveLinear animations:^{
        self.anImageView.frame = rect;
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:1 delay:1 usingSpringWithDamping:0.5 initialSpringVelocity:4 options:UIViewAnimationOptionCurveLinear animations:^{
            self.anImageView.frame = originalRect;
        } completion:^(BOOL finished) {
            
        }];
    }];
    
}

-(UIImageView *)anImageView
{
    if (!_anImageView)
    {
        _anImageView = [[UIImageView alloc] init];
        _anImageView.image = [UIImage imageNamed:@"1.jpg"];
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
        [_anButton addTarget:self action:@selector(springAnimation) forControlEvents:UIControlEventTouchUpInside];
    }
    return _anButton;
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

//
//  AnimationFrameVC.m
//  OC
//
//  Created by 薛坤龙 on 2016/12/19.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import "AnimationFrameVC.h"

@interface AnimationFrameVC ()

@property (nonatomic,strong) UIImageView *anImageView;
@property (nonatomic,strong) UIButton *anButton;

@end

@implementation AnimationFrameVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"Animation_Frame";
    
    
    
    [self.view addSubview:self.anImageView];
    self.anImageView.frame = CGRectMake(self.view.frame.size.width/2-100, 200, 200, 100);
    
    
    
    [self.view addSubview:self.anButton];
    self.anButton.frame = CGRectMake(self.view.frame.size.width/2-50, self.view.frame.size.height-146, 100, 46);
}

-(void)changeFrame
{
    CGRect originalRect = self.anImageView.frame;
    CGRect rect = CGRectMake(self.anImageView.frame.origin.x-20, self.anImageView.frame.origin.y-120, 200, 100);
    
    [UIView animateWithDuration:1 animations:^{
        self.anImageView.frame = rect;
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:1 animations:^{
            self.anImageView.frame = originalRect;
        }];
        
    }];
    
    
    
    
}

-(UIImageView *)anImageView
{
    if (!_anImageView)
    {
        _anImageView = [[UIImageView alloc] init];
        _anImageView.image = [UIImage imageNamed:@"1.jpg"];
        //图层
        //        _anImageView.layer.masksToBounds = YES;
        _anImageView.layer.borderWidth = 1;
        _anImageView.layer.borderColor = [UIColor blackColor].CGColor;
        _anImageView.layer.cornerRadius = 5;
        
        _anImageView.layer.shadowColor = [UIColor blackColor].CGColor;
        _anImageView.layer.shadowOffset = CGSizeMake(15, 10);
        _anImageView.layer.shadowOpacity = 0.6;
        
        
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
        [_anButton addTarget:self action:@selector(changeFrame) forControlEvents:UIControlEventTouchUpInside];
    }
    return _anButton;
}

- (void)didReceiveMemoryWarning {
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

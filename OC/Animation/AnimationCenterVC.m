//
//  AnimationCenterVC.m
//  OC
//
//  Created by 薛坤龙 on 2016/12/19.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import "AnimationCenterVC.h"
#import "UIImage+CLObjcSugar.h"

@interface AnimationCenterVC ()

@property (nonatomic,strong) UIImageView *anImageView;

/** 动画元素 */
@property(nonatomic, strong)UIImageView *animationImageView;

/** 是否是打开预览动画 */
@property(nonatomic, assign)BOOL isOpenOverView;



@end

// 放大倍数
const CGFloat magnificateMultiple = 3.;

@implementation AnimationCenterVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:self.anImageView];
    self.anImageView.frame = CGRectMake(self.view.frame.size.width/2-100, 200, 100, 100);
    
    self.isOpenOverView = YES;

}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    // 先将文件夹那个视图进行截图
    UIImage *animationImage = [UIImage snapImageForView:self.anImageView];
    
    // 再将文件夹视图的坐标系迁移到窗口坐标系（绝对坐标系）
    CGRect targetFrame_start = [self.anImageView.superview convertRect:self.anImageView.frame toView:nil];
    
    // 计算动画终点位置
    CGFloat targetW = targetFrame_start.size.width*magnificateMultiple;
    CGFloat targetH = targetFrame_start.size.height*magnificateMultiple;
    CGFloat targetX = (ScreenWidth - targetW) / 2.0;
    CGFloat targetY =(ScreenHeight - targetH) / 2.0;
    CGRect targetFrame_end = CGRectMake(targetX, targetY, targetW, targetH);
    
    // 添加做动画的元素
    if (!self.animationImageView.superview)
    {
        self.animationImageView.image = animationImage;
        self.animationImageView.frame = targetFrame_start;
        [self.view addSubview:self.animationImageView];
    }
    
    if (self.isOpenOverView)
    {
        // 预览动画
        [UIView animateWithDuration:1 delay:0. options:UIViewAnimationOptionCurveEaseIn animations:^{
            
            self.animationImageView.frame = targetFrame_end;
            
        } completion:^(BOOL finished)
        {
            
        }];
    }
    else
    {
        // 关闭预览动画
        [UIView animateWithDuration:1 delay:0. options:UIViewAnimationOptionCurveEaseOut animations:^{
            
            self.animationImageView.frame = targetFrame_start;
            
        } completion:^(BOOL finished) {
            
            [self.animationImageView removeFromSuperview];
        }];
    }
    
    self.isOpenOverView = !self.isOpenOverView;
}

-(UIImageView *)anImageView
{
    if (!_anImageView)
    {
        _anImageView = [[UIImageView alloc] init];
        _anImageView.userInteractionEnabled = YES;
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

-(UIImageView *)animationImageView
{
    if (!_animationImageView)
    {
        _animationImageView = [UIImageView new];
    }
    return _animationImageView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



@end

//
//  XLGifRefreshAnimation.m
//  OC
//
//  Created by 薛坤龙 on 2017/4/1.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import "XLRefreshGifAnimationView.h"

@interface XLRefreshGifAnimationView ()
{
    UIImageView *_gifImageView;
    BOOL _animating;
}

@end

@implementation XLRefreshGifAnimationView

- (instancetype)init
{
    if (self = [super init])
    {
        _gifImageView = [[UIImageView alloc] init];
        [_gifImageView setImage:[UIImage imageNamed:@"deliveryStaff0"]];
        [self addSubview:_gifImageView];
        
        NSMutableArray *ary=[NSMutableArray new];
        for (int i = 0; i < 4; i++)
        {
            NSString *imageName=[NSString stringWithFormat:@"deliveryStaff%d",i];
            UIImage *image=[UIImage imageNamed:imageName];
            [ary addObject:image];
        }
        
        // 设置播放周期时间
        _gifImageView.animationDuration = 0.4;
        // 设置播放次数
        _gifImageView.animationRepeatCount = 0;
        
        _gifImageView.animationImages = ary;
        
    }
    return self;
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    _gifImageView.frame = self.bounds;
}


-(void)startAnimation
{
    _animating = true;
    [_gifImageView startAnimating];
    
}

-(void)endAnimation
{
    [_gifImageView stopAnimating];
    _animating = false;
}

@end

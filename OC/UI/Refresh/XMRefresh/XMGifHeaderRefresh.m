//
//  XMGifHeaderRefresh.m
//  OC
//
//  Created by 薛坤龙 on 2017/3/28.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import "XMGifHeaderRefresh.h"

#define kXMGIFRefreshHeaderHeight 80

// 定制文字
#define XMGIFHeaderRefreshNormalStateDescription          @"下拉刷新"
#define XMGIFHeaderRefreshWillRefreshingStateDescription  @"松手即将刷新"

@interface XMGifHeaderRefresh ()

@end

@implementation XMGifHeaderRefresh

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self initSubViewUI];
    }
    return self;
}

- (void)initSubViewUI
{
    [self addSubview:self.headerImageView];
    [self addSubview:self.headerLabel];

}

- (void)layoutSubviews
{
    [super layoutSubviews];

    

}

+ (void)show
{
    
    
}

- (UIImageView *)headerImageView
{
    if (!_headerImageView)
    {
        _headerImageView = [[UIImageView alloc] init];
    }
    return _headerImageView;
}

- (UILabel *)headerLabel
{
    if (!_headerLabel)
    {
        _headerLabel = [[UILabel alloc] init];
        _headerLabel.textAlignment = NSTextAlignmentCenter;
        _headerLabel.text = XMGIFHeaderRefreshNormalStateDescription;
        _headerLabel.font = [UIFont systemFontOfSize:14.0f];
        _headerLabel.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
        
    }
    return _headerLabel;
}


@end

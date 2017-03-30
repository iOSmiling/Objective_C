//
//  XMGifHeaderRefresh.h
//  OC
//
//  Created by 薛坤龙 on 2017/3/28.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import "XMRefresh.h"

@interface XMGifHeaderRefresh : XMRefresh

@property (nonatomic,strong) UIImageView *headerImageView;
@property (nonatomic,strong) UILabel *headerLabel;

+ (void)show;

@end

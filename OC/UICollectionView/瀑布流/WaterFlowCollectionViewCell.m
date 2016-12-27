//
//  WaterFlowCollectionViewCell.m
//  OC
//
//  Created by 薛坤龙 on 2016/12/27.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import "WaterFlowCollectionViewCell.h"
#import <UIImageView+WebCache.h>
#import "ShopModel.h"

@implementation WaterFlowCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self initSubView];
    }
    return self;
}

- (void)initSubView
{
    [self.contentView addSubview:self.picture];
    [self.contentView addSubview:self.priceLabel];

}

-(void)setShopModel:(ShopModel *)shopModel
{
    _shopModel = shopModel;
    
    //图片的高度宽度 (model 中的数据 图片的真实高度宽度)
    CGFloat imagH = shopModel.h;
    CGFloat imagW = shopModel.w;
    
    //cell宽度 （图片显示宽度和cell）
    CGFloat cellW = self.contentView.frame.size.width;
    
    //宽度的比例
    CGFloat scale_w = cellW / imagW;
    
    //cell 中 图片显示的高度
    _picture.frame = CGRectMake(0, 0, cellW, imagH * scale_w);
    
    _priceLabel.frame = CGRectMake(0, CGRectGetMaxY(_picture.frame), cellW, 30);
    
    // 1.图片
    [self.picture sd_setImageWithURL:[NSURL URLWithString:shopModel.img] placeholderImage:[UIImage imageNamed:@"loading"]];
    
    // 2.价格
    self.priceLabel.text = shopModel.price;

}

- (UIImageView *)picture
{
    if (!_picture)
    {
        _picture = [[UIImageView alloc] init];
    }
    return _picture;
}

- (UILabel *)priceLabel
{
    if (!_priceLabel)
    {
        _priceLabel = [[UILabel alloc] init];
        _priceLabel.backgroundColor = [UIColor lightGrayColor];
        _priceLabel.textColor = [UIColor whiteColor];
        _priceLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _priceLabel;
}

@end

//
//  MasonryMainTableViewCell.m
//  OC
//
//  Created by 薛坤龙 on 2017/2/7.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import "MasonryMainTableViewCell.h"
#import "MasonryCellModel.h"
#import <Masonry.h>

@interface MasonryMainTableViewCell ()

@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *contentLabel;

@property (nonatomic, weak) MasonryCellModel *dataEntity;

@end

@implementation MasonryMainTableViewCell

// 调用UITableView的dequeueReusableCellWithIdentifier方法时会通过这个方法初始化Cell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self initView];
    }
    return self;
}

- (void)initView
{
    self.tag = 1000;
    // Avatar头像
    _avatarImageView = [UIImageView new];
    [self.contentView addSubview:_avatarImageView];
    
    [_avatarImageView mas_makeConstraints:^(MASConstraintMaker *make)
     {
        make.width.and.height.equalTo(@44);
        make.left.and.top.equalTo(self.contentView).with.offset(4);
    }];
    
    // Title - 单行
    _titleLabel = [UILabel new];
    [self.contentView addSubview:_titleLabel];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@22);
        make.top.equalTo(self.contentView).with.offset(4);
        make.left.equalTo(_avatarImageView.mas_right).with.offset(4);
        make.right.equalTo(self.contentView).with.offset(-4);
    }];
    
    // 计算UILabel的preferredMaxLayoutWidth值，多行时必须设置这个值，否则系统无法决定Label的宽度
    CGFloat preferredMaxWidth = [UIScreen mainScreen].bounds.size.width - 44 - 4 * 3; // 44 = avatar宽度，4 * 3为padding
    
    // Content - 多行
    _contentLabel = [UILabel new];
    _contentLabel.numberOfLines = 0;
    _contentLabel.preferredMaxLayoutWidth = preferredMaxWidth; // 多行时必须设置
    [self.contentView addSubview:_contentLabel];
    
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make)
    {
        make.top.equalTo(_titleLabel.mas_bottom).with.offset(4);
        make.left.equalTo(_avatarImageView.mas_right).with.offset(4);
        make.right.equalTo(self.contentView).with.offset(-4);
        make.bottom.equalTo(self.contentView).with.offset(-4);
    }];
    
    [_contentLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
}

- (void)setupData:(MasonryCellModel *)dataEntity
{
    _dataEntity = dataEntity;
    _avatarImageView.image = dataEntity.avatar;
    _titleLabel.text = dataEntity.title;
    _contentLabel.text = dataEntity.content;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

}

@end

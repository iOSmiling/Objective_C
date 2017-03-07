//
//  LayoutTestTableViewCell.m
//  OC
//
//  Created by 薛坤龙 on 2017/3/7.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import "LayoutTestTableViewCell.h"
#import "LayoutModel.h"


@interface LayoutTestTableViewCell ()

@property (nonatomic,strong) UIImageView *DimageView;
@property (nonatomic,strong) UILabel *Dlabel;

@property (nonatomic,strong) LayoutModel *dataModel;

@end

@implementation LayoutTestTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self initSubViewUI];
    }
    return self;
}

- (void)initSubViewUI
{
    self.dataModel = [[LayoutModel alloc] init];
    
    [self.contentView addSubview:self.DimageView];
    [self.contentView addSubview:self.Dlabel];

}

- (void)loadData:(LayoutModel *)model
{
    _dataModel = model;
    [self updateConstraints];
}

- (void)updateConstraints
{
    [super updateConstraints];

    NSDictionary *me = @{@"Image_h":@(_dataModel.cellH)};
    NSArray *Dimage_h = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_DimageView(50)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_DimageView)];
    NSArray *Dimage_v = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[_DimageView(Image_h)]-|" options:0 metrics:me views:NSDictionaryOfVariableBindings(_DimageView)];
    [self.contentView addConstraints:Dimage_h];
    [self.contentView addConstraints:Dimage_v];
    
    NSArray *Dlabel_h = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[_DimageView]-[_Dlabel]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_Dlabel,_DimageView)];
    NSArray *Dlabel_v = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_Dlabel(60)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_Dlabel)];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_Dlabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    [self.contentView addConstraints:Dlabel_h];
    [self.contentView addConstraints:Dlabel_v];
    
    
}

- (UIImageView *)DimageView
{
    if (!_DimageView)
    {
        _DimageView = [[UIImageView alloc] init];
        _DimageView.backgroundColor = [UIColor yellowColor];
        _DimageView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _DimageView;
}

- (UILabel *)Dlabel
{
    if (!_Dlabel)
    {
        _Dlabel = [[UILabel alloc] init];
        _Dlabel.translatesAutoresizingMaskIntoConstraints = NO;
        _Dlabel.backgroundColor = [UIColor orangeColor];
    }
    return _Dlabel;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

}

@end

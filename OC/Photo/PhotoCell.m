//
//  PhotoCell.m
//  OC
//
//  Created by 薛坤龙 on 2016/12/20.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import "PhotoCell.h"

@interface PhotoCell ()

@property (nonatomic, strong) UIButton *deleteButton;

@property (nonatomic, strong) UIImageView *chooseImageView;

@end


@implementation PhotoCell

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self.contentView addSubview:self.chooseImageView];
        [_chooseImageView addSubview:self.deleteButton];
        _chooseImageView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        _chooseImageView.userInteractionEnabled = YES;
        _deleteButton.frame = CGRectMake(frame.size.width-100, 0, 100, 46);
    }
    return self;
}

-(void)loadData:(NSData *)imageData
{
    _chooseImageView.image = [UIImage imageWithData:imageData];
    
    
}

-(void)deleteButtonEvent:(UIButton *)sender
{
    if (self.delegate)
    {
        [self.delegate deletePhoto:self];
    }
}


-(UIImageView *)chooseImageView
{
    if (!_chooseImageView)
    {
        _chooseImageView = [[UIImageView alloc] init];
    }
    return _chooseImageView;
}

-(UIButton *)deleteButton
{
    if (!_deleteButton)
    {
        _deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_deleteButton setTitle:@"删除" forState:UIControlStateNormal];
        [_deleteButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        _deleteButton.backgroundColor = [UIColor whiteColor];
        [_deleteButton addTarget:self action:@selector(deleteButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _deleteButton;
}



@end

//
//  BigPhotoImageCell.m
//  PhotoCatchTest
//
//  Created by pg on 2016/11/19.
//  Copyright © 2016年 DZHFCompany. All rights reserved.
//

#import "BigPhotoImageCell.h"
#import "FCPhotoManager.h"
#define KScale [UIScreen mainScreen].scale
@implementation BigPhotoImageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _bigImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.clipsToBounds = YES;
}

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView WithIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"bigImageViewCell";
    BigPhotoImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    return cell;
}

-(void)setSourceAsset:(PHAsset *)sourceAsset{
    _sourceAsset = sourceAsset;
    CGSize size = CGSizeMake(_sourceAsset.pixelWidth * KScale, _sourceAsset.pixelHeight * KScale);
    [FCPhotoManager getImageByAsset:_sourceAsset makeSize:size makeResizeMode:PHImageRequestOptionsResizeModeNone completion:^(UIImage *image) {
        _bigImageView.image = image;
    }];
}



@end

//
//  PhotoImageCell.m
//  PhotoCatchTest
//
//  Created by pg on 2016/11/18.
//  Copyright © 2016年 DZHFCompany. All rights reserved.
//

#import "PhotoImageCell.h"
#import "FCPhotoManager.h"
@interface PhotoImageCell ()

@property (weak, nonatomic) IBOutlet UIImageView *myImageView;

@end


@implementation PhotoImageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.myImageView.image = [UIImage imageNamed:@"PhotoManagerResource.bundle/camera"];
    [self.selectedBtn setImage:[UIImage imageNamed:@"PhotoManagerResource.bundle/ImageSelectedOff"] forState:UIControlStateNormal];
    [self.selectedBtn setImage:[UIImage imageNamed:@"PhotoManagerResource.bundle/ImageSelectedOn"] forState:UIControlStateSelected];
}

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView WithIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"MarkCollectionCell";
    PhotoImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    return cell;
}

-(void)setAssetModel:(PHAsset *)assetModel{
    _assetModel = assetModel;
    _myImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.clipsToBounds = YES;
    CGSize size = self.frame.size;
    size.width *= [UIScreen mainScreen].scale;
    size.height *= [UIScreen mainScreen].scale;
    [FCPhotoManager getImageByAsset:_assetModel makeSize:size makeResizeMode:PHImageRequestOptionsResizeModeNone completion:^(UIImage *image) {
        _myImageView.image = image;
    }];
}

@end

//
//  BigPhotoImageCell.h
//  PhotoCatchTest
//
//  Created by pg on 2016/11/19.
//  Copyright © 2016年 DZHFCompany. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>
@interface BigPhotoImageCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIScrollView *myScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *bigImageView;

//数据源
@property (nonatomic,strong)PHAsset *sourceAsset;

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView WithIndexPath:(NSIndexPath *)indexPath;
@end

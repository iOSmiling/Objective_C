//
//  PhotoImageCell.h
//  PhotoCatchTest
//
//  Created by pg on 2016/11/18.
//  Copyright © 2016年 DZHFCompany. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>
@interface PhotoImageCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIButton *selectedBtn;

@property (strong,nonatomic) PHAsset *assetModel;

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView WithIndexPath:(NSIndexPath *)indexPath;

@end

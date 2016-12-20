//
//  PhotoCell.h
//  OC
//
//  Created by 薛坤龙 on 2016/12/20.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JKAssets.h"

@protocol PhotoCellDelegate <NSObject>

- (void)deletePhoto:(UICollectionViewCell *)cell;

@end

@interface PhotoCell : UICollectionViewCell

@property (nonatomic,weak) id<PhotoCellDelegate>delegate;

-(void)loadData:(JKAssets *)asset;

@end

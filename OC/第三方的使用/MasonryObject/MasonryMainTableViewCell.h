//
//  MasonryMainTableViewCell.h
//  OC
//
//  Created by 薛坤龙 on 2017/2/7.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MasonryCellModel;

@interface MasonryMainTableViewCell : UITableViewCell

- (void)setupData:(MasonryCellModel *)dataEntity;

@end

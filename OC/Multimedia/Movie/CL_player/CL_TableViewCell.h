//
//  TableViewCell.h
//  CLPlayerDemo
//
//  Created by JmoVxia on 2016/11/18.
//  Copyright © 2016年 JmoVxia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CL_Model.h"
@class CL_TableViewCell;

@protocol VideoDelegate <NSObject>

- (void)PlayVideoWithCell:(CL_TableViewCell *)cell;

@end

@interface CL_TableViewCell : UITableViewCell

/**model*/
@property (nonatomic,copy) CL_Model *model;

@property (nonatomic,weak) id <VideoDelegate>videoDelegate;


- (CGFloat)cellOffset;


@end

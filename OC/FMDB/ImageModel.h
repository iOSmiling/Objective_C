//
//  ImageModel.h
//  OC
//
//  Created by 薛坤龙 on 2016/12/20.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import "OCBaseModel.h"

@interface ImageModel : OCBaseModel

@property (nonatomic,copy,nonnull) NSString *imageID; //图片id   //唯一值
@property (nonatomic,copy,nonnull) NSString * imageUrl; //图片url

@end

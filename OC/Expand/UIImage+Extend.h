//
//  UIImage+Extend.h
//  OC
//
//  Created by 薛坤龙 on 2016/12/20.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extend)


+(UIImage *) getWebpImageFromURLString:(NSString *)fileURL;

+(UIImage *) getImageFromURLString:(NSString *)fileURL;

/**
 *  根据颜色 描绘出一个改颜色的  纯色区域
 *
 *  @param color 图片颜色
 *
 *  @return 一个纯色的图片
 */
+ (UIImage*) createImageWithColor: (UIColor*) color;

/**
 *  根据图片名字  自动加载 IOS6 /IOS 7 图片
 *
 *  @param name 图片名字
 *
 *  @return UIIamge
 */
+ (UIImage *)imageWithName:(NSString *)name;
/**
 *  图片拉伸
 *
 *  @param name name description
 *
 *  @return return value description
 */
+ (UIImage *)resizedImage:(NSString *)name;
+ (UIImage *)image:(UIImage *)image rotation:(UIImageOrientation)orientation;

@end

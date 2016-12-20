//
//  UIImage+Extend.m
//  OC
//
//  Created by 薛坤龙 on 2016/12/20.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import "UIImage+Extend.h"

//#import "NSData+ImageContentType.h"

#import <UIImage+WebP.h>

@implementation UIImage (Extend)

+(UIImage *) getImageFromURLString:(NSString *)fileURL
{
    UIImage * result;
    
    //判断url后缀
    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:fileURL]];
    
    result = [UIImage sd_imageWithWebPData:data];
    
    //    NSLog(@"图片类型：%@",[NSData sd_contentTypeForImageData:data]);
    //
    //    NSString *imageType = [NSData sd_contentTypeForImageData:data];
    
    //    if ([imageType isEqualToString:@"image/webp"])
    //    {
    //        result = [UIImage imageWithWebPData:data];
    //
    //    }else
    //    {
    //        result = [UIImage imageWithData:data];
    //    }
    
    return result;
}


@end

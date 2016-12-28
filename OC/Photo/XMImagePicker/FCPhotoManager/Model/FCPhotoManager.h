//
//  ViewController.m
//  PhotoCatchTest
//
//  Created by pg on 2016/11/18.
//  Copyright © 2016年 DZHFCompany. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <Photos/Photos.h>

typedef NS_ENUM(NSInteger,PhotoAlbumType){
    PhotoAlbumType_Recent = 0,//最近添加
    PhotoAlbumType_CameraRoll = 1,//相机胶卷
    PhotoAlbumType_Selfies = 2,//自拍
    PhotoALbumType_Videos = 3,//视频
    PhotoAlbumType_Screenshots =4,//屏幕快照
};

#pragma mark -照片模型
@interface FCPhotoModel : NSObject

/**
 *  通过asset取到照片
 */
@property(nonatomic,strong)PHAsset * asset;
/**
 *  照片的名字
 */
@property(nonatomic,strong)NSString * imageName;


@end



#pragma mark -相册模型
@interface FCPhotoList : NSObject
/**
 *  相册的名字
 */
@property(nonatomic,strong)NSString * title;
/**
 *  该相册的照片数量
 */
@property(nonatomic,assign)NSInteger  photoNum;
/**
 *  该相册的第一张图片
 */
@property(nonatomic,strong)PHAsset * firstAsset;
/**
 *  同过该属性可以取得该相册的所有照片
 */
@property(nonatomic,strong)PHAssetCollection * assetCollection;


@end



#pragma mark -照片库管理类
@interface FCPhotoManager : NSObject

+(instancetype)defaultFZJPhotoTool;


/**
 *  相册的使用权限
 */
+(BOOL)FCHaveAlbumAuthority:(void(^)(NSInteger stateIndex))completion;


/**
 相机的使用权限
 */
+(BOOL)FCHaveCameraAuthority;


/**
 *  获得所有的相册
 *
 *  @return  FZJPhotoList样式的相册
 */

+(NSArray<FCPhotoList *> *)getAllPhotoList;


/**
 获取指定相册的信息
 */
+(FCPhotoList*)getSpecialAlbumWithType:(PhotoAlbumType)type;

/**
 *  取到对应的照片实体
 *
 *  @param asset      索取照片实体的媒介
 *  @param size       实际想要的照片大小
 *  @param resizeMode 控制照片尺寸
 *  @param completion block返回照片实体
 */
+(void)getImageByAsset:(PHAsset *)asset makeSize:(CGSize)size makeResizeMode:(PHImageRequestOptionsResizeMode)resizeMode completion:(void (^)(UIImage * AssetImage))completion;

/**
 *   取得所有的照片资源
 *
 *  @param ascending 排序方式
 *
 *  @return 照片资源
 */

+(NSArray<PHAsset *> *)getAllAssetInPhotoAblumWithAscending:(BOOL)ascending;

/**
 *  获取指定相册内的所有图片
 */
+(NSArray<PHAsset *> *)getAssetsInAssetCollection:(PHAssetCollection *)assetCollection ascending:(BOOL)ascending;


@end

//
//  AnimationKeyFramesVC.h
//  OC
//
//  Created by 薛坤龙 on 2016/12/19.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import "BaseViewController.h"

@interface AnimationKeyFramesVC : BaseViewController


/*
 与CABasicAnimation的区别
 
 CABasicAnimation：
 
 只能从一个数值（fromValue）变到另一个数值（toValue）
 CAKeyframeAnimation：
 
 会使用一个NSArray保存这些数值
 CABasicAnimation可看做是只有2个关键帧的CAKeyframeAnimation关键帧动画
 
 
 
 
 
 values 关键帧数组
     上述的NSArray对象。里面的元素称为“关键帧”(keyframe)。
     动画对象会在指定的时间（duration）内，依次显示values数组中的每一个关键帧
 path 路径轨迹
    path：可以设置一个CGPathRef、CGMutablePathRef，让图层按照路径轨迹移动。
    path只对CALayer的anchorPoint和position起作用。
        注意：如果设置了path，那么values关键帧将被忽略
 keyTimes：关键帧所对应的时间点
     keyTimes：可以为对应的关键帧指定对应的时间点，其取值范围为0到1.0
     keyTimes中的每一个时间值都对应values中的每一帧。如果没有设置keyTimes，各个关键帧的时间是平分的
 
 
 */

@end

//
//  AnimationTransformVC.h
//  OC
//
//  Created by 薛坤龙 on 2016/12/19.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import "BaseViewController.h"

@interface AnimationTransformVC : BaseViewController


/*
 UIView有CGAffineTransform类型的属性transform，它是定义在二维空间上完成View的平移，旋转，缩放等效果的实现。
 
 transform 是一种状态，并且只有一种状态
 
 (1)CGAffineTransformMakeTranslation(<#CGFloat tx#>, <#CGFloat ty#>):只能变化一次，因为这种方式的变化始终是以最原始的状态值进行变化的，所以只能变化一次
 
 例如：
 
 UIButton *head = (UIButton *) [self.view viewWithTag:10];
 head.transform = CGAffineTransformMakeTranslation(0,-10);
 (2)CGAffineTransformTranslate(CGAffineTransform t, <#CGFloat tx#>, <#CGFloat ty#>):能够多次变化，每次变化都是以上一次的状态（CGAffineTransform t）进行的变化，所以可以多次变化
 
 head.transform = CGAffineTransformTranslate(head.transform, 0, -10);
 
 （3） CGAffineTransformIdentity:清空所有的设置的transform(一般和动画配合使用，只能使用于transfofrm设置的画面)
 
 UIButton *head = (UIButton *) [self.view viewWithTag:10];
 head.transform = CGAffineTransformIdentity;
 
 （4）CGAffineTransformMakeScale( CGFloat  sx,  CGFloat  sy) （缩放:设置缩放比例）仅通过设置缩放比例就可实现视图扑面而来和缩进频幕的效果。
 
 UIButton *head = [self.view viewWithTag:10];
 head.transform = CGAffineTransformScale(head.transform,1.5,1.5);
 
 （5） CGAffineTransformMakeRotation( CGFloat  angle) （旋转:设置旋转角度）
 
 UIButton *head =  [self.view viewWithTag:10];
 head.transform = CGAffineTransformMakeRotation(M_PI_2);
 
 */

@end

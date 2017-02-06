//
//  MasonryMainVC.h
//  OC
//
//  Created by 薛坤龙 on 2017/2/5.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import "BaseViewController.h"

@interface MasonryMainVC : BaseViewController

@end


/**
 
 //这个方法只会添加新的约束
 [blueView mas_makeConstraints:^(MASConstraintMaker *make)  {
 
 }];
 
 // 这个方法会将以前的所有约束删掉，添加新的约束
 [blueView mas_remakeConstraints:^(MASConstraintMaker *make) {
 
 }];
 
 // 这个方法将会覆盖以前的某些特定的约束
 [blueView mas_updateConstraints:^(MASConstraintMaker *make) {
 
 }];
 
*/



/**
 1.尺寸：width、height、size
 2.边界：left、leading、right、trailing、top、bottom
 3.中心点：center、centerX、centerY
 4.边界：edges
 5.偏移量：offset、insets、sizeOffset、centerOffset
 6.priority()约束优先级（0~1000），multipler乘因数, dividedBy除因数
 */



/**
 
 当约束冲突发生的时候，我们可以设置view的key来定位是哪个view
 redView.mas_key = @"redView";
 greenView.mas_key = @"greenView";
 blueView.mas_key = @"blueView";
 若是觉得这样一个个设置比较繁琐，怎么办呢，Masonry则提供了批量设置的宏MASAttachKeys
 MASAttachKeys(redView,greenView,blueView); //一句代码即可全部设置
 
 */



/**
    equalTo 和 mas_equalTo的区别
 
    mas_equalTo只是对其参数进行了一个BOX(装箱) 操作，
    目前支持的类型：数值类型（NSNumber）、 点（CGPoint）、大小（CGSize）、边距（UIEdgeInsets），
    而equalTo：这个方法不会对参数进行包装。
 
 
 */



//更新约束的问题
/**
 
 //1.告知需要更新约束，但不会立刻开始，系统然后调用updateConstraints
    [self setNeedsUpdateConstraints];

    //2.告知立刻更新约束，系统立即调用updateConstraints
    [self updateConstraintsIfNeeded];

    //3.这里动画当然可以取消，具体看项目的需求
    //系统block内引用不会导致循环引用，block结束就会释放引用对象
    [UIView animateWithDuration:0.4 animations:^{
        [self layoutIfNeeded]; //告知页面立刻刷新，系统立即调用updateConstraints
    }];

*/


//
//  BlockVC.h
//  OC
//
//  Created by 薛坤龙 on 2017/1/9.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import "BaseViewController.h"

@interface BlockVC : BaseViewController

@end


/*
 使用场景
 
 任务完成时回调处理
 消息监听回调处理
 错误回调处理
 枚举回调
 视图动画、变换
 排序


*/

/*  强引用  --弱引用
    强引用持有对象，而弱引用不持有对象
    使用strong 和weak的区别，因为strong的对象会使retainCount+1，而weak的并不会
 
    只有该对象持有block，而block里的代码块又持有该对象时才需要用到weak。
 
 */

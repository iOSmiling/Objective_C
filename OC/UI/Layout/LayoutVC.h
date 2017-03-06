//
//  LayoutVC.h
//  OC
//
//  Created by 薛坤龙 on 2017/3/6.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import "BaseViewController.h"

@interface LayoutVC : BaseViewController

@end


/*

 format:此参数为你的vfl语句，比如:@"H:|-[button]-|"
 
 opts:枚举参数，默认写0，具体跟据你所实现的需求去选择你想要的枚举
 
 metrics:这里是一个字典，当在format中使用了动态数据比如上现这句:@"H:|-[button(==width)]-|",表示这个button的宽度为width,那么这个参数去哪里找呢？就是在这个字典里面找到key对就的值，如果没有找到这个值，app就会crash.
 
 views:顾名思义，这是传所有你在vfl中使用到的view，那在上面这句例子中的应该怎么传呢？结果是这样的：NSDictionaryOfVariableBindings(button).如果你使用到了多个view，就可以这样NSDictionaryOfVariableBindings(button,button1,button3...),这个名字也要跟参数format中的一一对应，缺一不可.

*/

//
//  InheritB.h
//  OC
//
//  Created by 薛坤龙 on 2017/2/6.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import "InheritA.h"

@interface InheritB : InheritA

@property (nonatomic,copy) NSString *inheritBString;


+ (int)getStatic;

@end


/*  静态变量、静态常量、全局变量

 
  一：静态变量 static    
 
    什么是静态变量：从面向对象的角度出发，当需要一个数据对象为整类而非某个对象服务，同时又力求不破坏类的封装性；既要求此成员隐藏在类的内部，
    又要求对外不可见的时候，就可以使用static。
 
    static修饰的变量，是一个私有的全局变量
 
    在OC中static修饰的变量是不能通过类名直接访问的，它只作用于它声明所在的.m文件中。
    static修饰的变量必须放在@implementation外面或方法中，它只在程序启动初始化一次。
 
   二： 静态常量 const
    const修饰的变量是不可变的，如果需要定义一个时间间隔的静态常量，就可以使用const修饰
 
    1：
     static const NSTimeInterval LMJTimeDuration = 0.5;  // LMJTimeDuration不可变
 
    2：
         static NSString const * LMJName = @"iOS开发者公会";
         static const NSString * LMJName = @"iOS开发者公会";
        两种写法cons修饰的是* LMJName,*是指针指向符，也就是说此时指向内存地址是不可变的，而内存保存的内容时可变的
 
    3：
        static NSString * const LMJName = @"iOS开发者公会";
        我们定义一个对象类型常量的时候，要将const修饰符放到*指针指向符后面。
 
    三：全局变量 extern
 
      1： extern修饰的变量，是一个全局变量。
         extern NSString * LMJName = @"iOS开发者公会;
 
      2：extern修饰的变量也可以添加const进行修饰：
        extern NSString * const LMJName = @"iOS开发者公会;
        
         此时全局变量只能被初始化一次
         extern定义的全局常量的用法和宏定义类似，但是还是有本质上的不同的。 extern定义的全局常量更不容易在程序中被无意窜改。
 
*/

/*
 
 一、const与宏的区别(面试题):
 
 　　const简介:之前常用的字符串常量，一般是抽成宏，但是苹果不推荐我们抽成宏，推荐我们使用const常量。
 
 　　编译时刻:宏是预编译(编译之前处理)，const是编译阶段。
 
 　　编译检查:宏不做检查，不会报编译错误，只是替换，const会编译检查，会报编译错误。
 
 　　宏的好处:宏能定义一些函数，方法。 const不能。
 
 　　宏的坏处:使用大量宏，容易造成编译时间久，每次都需要重新替换。
 
 
 */


    /*
     static和extern简单使用(要使用一个东西，先了解其作用)
     
     　　static作用:
     
     　　修饰局部变量：
     
     　　1.延长局部变量的生命周期,程序结束才会销毁。
     
     　　2.局部变量只会生成一份内存,只会初始化一次。
     
     　　3.改变局部变量的作用域。
     
     　　修饰全局变量
     
     　　1.只能在本文件中访问,修改全局变量的作用域,生命周期不会改
     
     　　2.避免重复定义全局变量
     
     　　extern作用:
     
     　　只是用来获取全局变量(包括全局静态变量)的值，不能用于定义变量
     
     　　extern工作原理:
     
     　　先在当前文件查找有没有全局变量，没有找到，才会去其他文件查找。
     
     　　// 全局变量：只有一份内存，所有文件共享，与extern联合使用。
     
     
     */


    /*
     static与const联合使用
     
     　　static与const作用:声明一个只读的静态变量
     
     　　开发使用场景:在一个文件中经常使用的字符串常量，可以使用static与const组合
     
     　　// 开发中常用static修饰全局变量,只改变作用域
     
     　　// 为什么要改变全局变量作用域，防止重复声明全局变量。
     
     　　// 开发中声明的全局变量，有些不希望外界改动，只允许读取。
     
     　　// 比如一个基本数据类型不希望别人改动
     
     　　// 声明一个静态的全局只读常量
     
     　　static const int a = 20;
     
     　　// staic和const联合的作用:声明一个静态的全局只读常量
     
     　　// iOS中staic和const常用使用场景，是用来代替宏，把一个经常使用的字符串常量，定义成静态全局只读变量.
     
     　　// 开发中经常拿到key修改值，因此用const修饰key,表示key只读，不允许修改。
     
     　　static NSString * const key = @"name";
     
     　　// 如果 const修饰 *key1,表示*key1只读，key1还是能改变。
     
     　　static NSString const *key1 = @"name";
    
     */


    /*
     
     extern与const联合使用
     
     　　开发中使用场景:在多个文件中经常使用的同一个字符串常量，可以使用extern与const组合。
     */



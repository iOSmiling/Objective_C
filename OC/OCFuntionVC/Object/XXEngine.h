//
//  XXEngine.h
//  OC
//
//  Created by 薛坤龙 on 2017/1/9.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XXEngine : NSObject

- (void )testGlobalBlock:(NSString*) url
                 success:(void (^)(BOOL isSuccess))success
                 failure:(void (^)(BOOL isSuccess))failure;


- (void )testMallocBlock:(NSString*) url
                 success:(void (^)(BOOL isSuccess))success
                 failure:(void (^)(BOOL isSuccess))failure;
/*
    如果方法过多，一般大于3个的时候，用delegate，因为此时用block，代码将很难维护。比如UITableViewDelegate等等UI组建，都是用的delegate。其他方式用block。
 
    Notification能不用的时候尽量不用，缺点太多明显，增加调试难度。在工程大的情况下，极其难以维护。当然有些情况下也是必不可少的，比如观察者模式.

*/

/*
    要点：堆，队列优先,先进先出（FIFO—first in first out。
         栈，先进后出(FILO—First-In/Last-Out)。
 
    栈区（stack）           由编译器自动分配释放，存放函数的参数值，局部变量的值等
    堆区（heap）            一般由程序员分配释放， 若程序员不释放，程序结束时可能由OS回收
    全局区（静态区）（static） 全局变量和静态变量的存储是放在一块的，初始化的全局变量和静态变量在一块区域，未初始化的全局变量和未初始化的静态变量在相邻的另一块区域。程序结束后由系统释放
    文字常量区   常量字符串就是放在这里的。程序结束后由系统释放
    程序代码区   存放函数体的二进制代码
 
 */

@end

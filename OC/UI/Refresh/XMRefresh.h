//
//  XMRefresh.h
//  OC
//
//  Created by 薛坤龙 on 2017/3/27.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import <UIKit/UIKit.h>

//刷新类型
typedef NS_ENUM(NSUInteger,XMRefreshType)
{
    XMRefreshTypeFooter = 0,
    XMRefreshTypeHeader,
};

//刷新状态
typedef NS_ENUM(NSUInteger,XMRefreshState)
{
    XMRefreshStateNormal = 0,
    XMRefreshStateWillRefreshing,
    XMRefreshStateRefresing,
    XMRefreshStateNoticeNoMoreData,
};

/** 进入刷新状态的回调 */
typedef void (^XMRefreshRefreshingBlock)();

@interface XMRefresh : UIView

@property (nonatomic, copy  ) XMRefreshRefreshingBlock footerRefreshingBlock;
@property (nonatomic, copy  ) XMRefreshRefreshingBlock headerRefreshingBlock;
@property (nonatomic, assign) XMRefreshType            refreshType;
@property (nonatomic, assign) XMRefreshState           headerRefreshState;
@property (nonatomic, assign) XMRefreshState           footerRefreshState;
@property (nonatomic, copy  ) NSString                 *endWithNoMoreDataDescription;

/**
 *  上拉控件初始化方法
 */
- (instancetype)initFooterWithScrollView:(UIScrollView *)scrollView footerRefreshingBlock:(XMRefreshRefreshingBlock)block;
+ (instancetype)footerRefreshWithScrollView:(UIScrollView *)scrollView footerRefreshingBlock:(XMRefreshRefreshingBlock)block;
/**
 *  下拉控件初始化方法
 */
- (instancetype)initHeaderWithScrollView:(UIScrollView *)scrollView headerRefreshingBlock:(XMRefreshRefreshingBlock)block;
+ (instancetype)headerRefreshWithScrollView:(UIScrollView *)scrollView headerRefreshingBlock:(XMRefreshRefreshingBlock)block;

- (void)beginHeaderRefreshing;
- (void)beginFooterRefreshing;

- (void)endHeaderRefreshing;
- (void)endFooterRefreshing;
- (void)endFooterRefreshingWithNoMoreData;
- (void)endFooterRefreshingWithNoMoreData:(NSString *)customTitle;

/** 当scrollView的contentOffset发生改变的时候调用 */
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change;
/** 当scrollView的contentSize发生改变的时候调用 */
- (void)scrollViewContentSizeDidChange:(NSDictionary *)change;
/** 当scrollView的拖拽状态发生改变的时候调用 */
- (void)scrollViewPanStateDidChange:(NSDictionary *)change;

@end

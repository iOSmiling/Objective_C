//
//  XMRefresh.m
//  OC
//
//  Created by 薛坤龙 on 2017/3/27.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import "XMRefresh.h"
#import "UIView+XMFrameExtension.h"

#define kXMRefreshFooterHeight 44
#define XMRefreshKeyPathContentOffset  @"contentOffset"
#define XMRefreshKeyPathContentInset   @"contentInset"
#define XMRefreshKeyPathContentSize    @"contentSize"
#define XMRefreshKeyPathPanState       @"state"
#define XMRefreshAnimationDuration     0.25

// 定制文字
#define XMHeaderRefreshNormalStateDescription          @"下拉刷新"
#define XMHeaderRefreshWillRefreshingStateDescription  @"松手即将刷新"
#define XMFooterRefreshNormalStateDescription          @"上拉刷新"
#define XMFooterRefreshWillRefreshingStateDescription  @"松手即将刷新"
#define XMRefreshNoticeNoMoreDataStateDescription      @"没有更多了"

@interface XMRefresh ()

@property (nonatomic, strong) UIScrollView            *scrollView;
@property (nonatomic, assign) UIEdgeInsets            originalContentInset;
@property (nonatomic, assign) CGFloat                 insetTopDelta;
@property (nonatomic, assign) CGFloat                 lastBottomDelta;
@property (nonatomic, weak  ) UIView                  *footerView;
@property (nonatomic, weak  ) UIView                  *headerView;
@property (nonatomic, weak  ) UIActivityIndicatorView *activityHeader;
@property (nonatomic, weak  ) UIActivityIndicatorView *activityFooter;
@property (nonatomic, weak  ) UILabel                 *headerLabel;
@property (nonatomic, weak  ) UILabel                 *footerLabel;
@property (strong, nonatomic) UIPanGestureRecognizer  *pan;

@end

@implementation XMRefresh

+ (instancetype)footerRefreshWithScrollView:(UIScrollView *)scrollView footerRefreshingBlock:(XMRefreshRefreshingBlock)block
{
    return [[self alloc] initFooterWithScrollView:scrollView footerRefreshingBlock:block];
}

- (instancetype)initFooterWithScrollView:(UIScrollView *)scrollView footerRefreshingBlock:(XMRefreshRefreshingBlock)block
{
    if (self = [super init])
    {
        [self setUp:scrollView];
        [self setUpFooter:block];

    }
    return self;
}

+ (instancetype)headerRefreshWithScrollView:(UIScrollView *)scrollView headerRefreshingBlock:(XMRefreshRefreshingBlock)block
{
    return [[self alloc] initHeaderWithScrollView:scrollView headerRefreshingBlock:block];
}

- (instancetype)initHeaderWithScrollView:(UIScrollView *)scrollView headerRefreshingBlock:(XMRefreshRefreshingBlock)block
{
    if (self = [super init])
    {
        [self setUp:scrollView];
        [self setUpHeader:block];
        
    }
    return self;
}

- (void)setUp:(UIScrollView *)scrollView
{
    if (scrollView == nil)
    {
        return;
    }else
    {
        self.scrollView = scrollView;
        [self removeObservers];// 旧的父控件移除监听
        
        self.xm_w = scrollView.xm_w;
        self.xm_x = 0;
        
        _scrollView.alwaysBounceVertical = YES;//设置支持垂直弹簧效果
        _originalContentInset = self.scrollView.contentInset;//记录UIScrollView最开始的contentInset
        
        [self addObservers]; //添加监听
    }
}

- (void)setUpFooter:(XMRefreshRefreshingBlock)block
{
    if (self.scrollView == nil)
    {
        return;
    }else
    {
        UIView *footerView = [[UIView alloc] initWithFrame:self.bounds];
        footerView.backgroundColor = [UIColor clearColor];
        self.footerView = footerView;
        UIActivityIndicatorView *activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        activity.hidesWhenStopped = NO;
        activity.hidden = YES;
        self.activityFooter = activity;
        [footerView addSubview:activity];
        
        UILabel *footerLabel = [[UILabel alloc] init];
        footerLabel.font = [UIFont systemFontOfSize:14.0f];
        footerLabel.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
        footerLabel.textAlignment = NSTextAlignmentCenter;
        footerLabel.text = XMHeaderRefreshNormalStateDescription;
        self.footerLabel = footerLabel;
        [footerView addSubview:footerLabel];
        [self addSubview:footerView];
        [self.scrollView addSubview:self];
        
        self.footerRefreshingBlock = block;
        self.refreshType = XMRefreshTypeFooter;
        self.footerRefreshState = XMRefreshStateNormal;
    }
}

- (void)setUpHeader:(XMRefreshRefreshingBlock)block
{
    if (self.scrollView == nil) return;
    UIView *headerView = [[UIView alloc] initWithFrame:self.bounds];
    headerView.backgroundColor = [UIColor clearColor];
    self.headerView = headerView;
    UIActivityIndicatorView *activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    activity.hidesWhenStopped = NO;
    activity.hidden = YES;
    //    [activity startAnimating];
    self.activityHeader = activity;
    [headerView addSubview:activity];
    
    UILabel *headerLabel = [[UILabel alloc] init];
    headerLabel.font = [UIFont systemFontOfSize:14.0f];
    headerLabel.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
    headerLabel.textAlignment = NSTextAlignmentCenter;
    headerLabel.text = XMHeaderRefreshNormalStateDescription;
    self.headerLabel = headerLabel;
    [headerView addSubview:headerLabel];
    
    [self addSubview:headerView];
    [self.scrollView addSubview:self];
    
    self.headerRefreshingBlock = block;
    self.refreshType = XMRefreshTypeHeader;
    self.headerRefreshState = XMRefreshStateNormal;

}

- (void)setHeaderRefreshState:(XMRefreshState)headerRefreshState
{
    XMRefreshState oldState = self.headerRefreshState;
    if (headerRefreshState == oldState) return;
    _headerRefreshState = headerRefreshState;
    
    switch (headerRefreshState)
    {
        case XMRefreshStateNormal:
        case XMRefreshStateWillRefreshing:
        {
            self.headerLabel.hidden = NO;
            self.activityHeader.hidden = YES;
            if (headerRefreshState == XMRefreshStateNormal)
            {
                self.headerLabel.text = XMHeaderRefreshNormalStateDescription;
                
            }else if(headerRefreshState == XMRefreshStateWillRefreshing)
            {
                self.headerLabel.text = XMHeaderRefreshWillRefreshingStateDescription;
            }
            
            if (oldState != XMRefreshStateRefresing) return;
            // 恢复inset和offset
            [UIView animateWithDuration:XMRefreshAnimationDuration animations:^{
                self.scrollView.xm_insetTop += self.insetTopDelta;
            }];
        }
            break;
        case XMRefreshStateRefresing:
        {
            self.headerLabel.hidden = YES;
            self.activityHeader.hidden = NO;
            [UIView animateWithDuration:XMRefreshAnimationDuration animations:^{
                // 增加滚动区域
                CGFloat top = self.originalContentInset.top + self.xm_h;
                self.scrollView.xm_insetTop = top;
                
                // 设置滚动位置
                self.scrollView.xm_offsetY = - top;
            } completion:^(BOOL finished) {
                if (self.headerRefreshingBlock) {
                    self.headerRefreshingBlock();
                }
            }];
        }
            break;
        case XMRefreshStateNoticeNoMoreData:
            break;
        default:
            break;
    }
}

- (void)setFooterRefreshState:(XMRefreshState)footerRefreshState
{
    XMRefreshState oldState = self.footerRefreshState;
    if (footerRefreshState == oldState) return;
    _footerRefreshState = footerRefreshState;
    
    switch (footerRefreshState)
    {
        case XMRefreshStateNormal:
        case XMRefreshStateWillRefreshing:
        case XMRefreshStateNoticeNoMoreData:
        {
            self.footerLabel.hidden = NO;
            self.activityFooter.hidden = YES;
            if (footerRefreshState == XMRefreshStateNormal)
            {
                self.footerLabel.text = XMFooterRefreshNormalStateDescription;
            }else if(footerRefreshState == XMRefreshStateWillRefreshing)
            {
                self.footerLabel.text = XMFooterRefreshWillRefreshingStateDescription;
            }else
            {
                if (self.endWithNoMoreDataDescription.length > 0) {
                    self.footerLabel.text = self.endWithNoMoreDataDescription;
                }else
                {
                    self.footerLabel.text = XMRefreshNoticeNoMoreDataStateDescription;
                }
            }
            if (oldState != XMRefreshStateRefresing) return;
            // 刷新完毕
            if (XMRefreshStateRefresing == oldState)
            {
                [UIView animateWithDuration:XMRefreshAnimationDuration animations:^{
                    self.scrollView.xm_insetBottom -= self.lastBottomDelta;
                }];
            }
        }
            break;
        case XMRefreshStateRefresing:
        {
            self.footerLabel.hidden = YES;
            self.activityFooter.hidden = NO;
            [UIView animateWithDuration:XMRefreshAnimationDuration animations:^{
                CGFloat bottom = self.xm_h + self.originalContentInset.bottom;
                CGFloat deltaH = [self heightForContentBreakView];
                if (deltaH < 0) { // 如果内容高度小于view的高度
                    bottom -= deltaH;
                }
                self.lastBottomDelta = bottom - self.scrollView.xm_insetBottom;
                self.scrollView.xm_insetBottom = bottom;
                self.scrollView.xm_offsetY = [self happenOffsetY] + self.xm_h;
            } completion:^(BOOL finished) {
                if (self.footerRefreshingBlock) {
                    self.footerRefreshingBlock();
                }
            }];
        }
            break;
        default:
            break;
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.footerView)
    {
        // 上拉刷新控件
        self.xm_y = self.scrollView.xm_contentHeight > self.scrollView.xm_h ? self.scrollView.xm_contentHeight + self.scrollView.xm_insetBottom: self.scrollView.xm_h + self.scrollView.xm_insetBottom;
        self.xm_h = kXMRefreshFooterHeight;
        self.footerView.frame = self.bounds;
        self.activityFooter.center = self.footerView.center;
        self.footerLabel.frame = self.footerView.bounds;
    }
    
    if (self.headerView)
    {
        // 下拉刷新控件
        self.xm_y = -kXMRefreshFooterHeight;
        self.xm_h = kXMRefreshFooterHeight;
        self.headerView.frame = self.bounds;
        self.activityHeader.center = self.headerView.center;
        self.headerLabel.frame = self.headerView.bounds;
    }
}

#pragma mark - KVO监听
- (void)addObservers
{
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    [self.scrollView addObserver:self forKeyPath:XMRefreshKeyPathContentOffset options:options context:nil];
    [self.scrollView addObserver:self forKeyPath:XMRefreshKeyPathContentSize options:options context:nil];
    self.pan = self.scrollView.panGestureRecognizer;
    [self.pan addObserver:self forKeyPath:XMRefreshKeyPathPanState options:options context:nil];
}

- (void)removeObservers
{
    [self.superview removeObserver:self forKeyPath:XMRefreshKeyPathContentOffset];
    [self.superview removeObserver:self forKeyPath:XMRefreshKeyPathContentSize];;
    [self.pan removeObserver:self forKeyPath:XMRefreshKeyPathPanState];
     self.pan = nil;
}

#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:XMRefreshKeyPathContentOffset])
    {
        // 偏移位置变化
        [self scrollViewContentOffsetDidChange:change];
        
    }else if([keyPath isEqualToString:XMRefreshKeyPathContentSize])
    {
        // contentSize变化
        [self scrollViewContentSizeDidChange:change];
        
    }else if([keyPath isEqualToString:XMRefreshKeyPathPanState])
    {
        // 手势变化
        [self scrollViewPanStateDidChange:change];
    }
}

- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change
{
    if (self.refreshType == XMRefreshTypeFooter)
    {
        if(self.footerRefreshState == XMRefreshStateRefresing)return;
        if(self.footerRefreshState == XMRefreshStateNoticeNoMoreData)return;
        
    }else if(self.refreshType == XMRefreshTypeHeader)
    {
        // 在刷新的refreshing状态
        if (self.headerRefreshState == XMRefreshStateRefresing)
        {
            if (self.window == nil) return;
            
            // sectionheader停留解决
            CGFloat insetT = - self.scrollView.xm_offsetY > _originalContentInset.top ? - self.scrollView.xm_offsetY : _originalContentInset.top;
            insetT = insetT > self.xm_h + _originalContentInset.top ? self.xm_h + _originalContentInset.top : insetT;
            self.scrollView.xm_insetTop = insetT;
            
            self.insetTopDelta = _originalContentInset.top - insetT;
            return;
        }
    }
    
    // 当前的contentOffset
    CGFloat offsetY = self.scrollView.xm_offsetY;
    CGFloat happenOffsetY = 0;
    CGFloat normal2pullingOffsetY = 0;
    
    if(self.refreshType == XMRefreshTypeHeader)
    {
        // 头部控件刚好出现的offsetY
        happenOffsetY = - self.originalContentInset.top;
        // 如果是向上滚动到看不见头部控件，直接返回
        if (offsetY > happenOffsetY) return;
        normal2pullingOffsetY = happenOffsetY - self.xm_h;
        
    }else if(self.refreshType == XMRefreshTypeFooter)
    {
        // 尾部控件刚好出现的offsetY
        happenOffsetY = [self happenOffsetY];
        // 如果是向下滚动到看不见尾部控件，直接返回
        if (offsetY <= happenOffsetY) return;
        normal2pullingOffsetY = happenOffsetY + self.xm_h;
    }
    
    
    if (self.scrollView.isDragging)
    {
        // 如果正在拖拽
        if (self.refreshType == XMRefreshTypeHeader)
        {
            if (self.headerRefreshState == XMRefreshStateNormal)
            {
                if (offsetY < normal2pullingOffsetY)
                {
                    // 转为即将刷新状态
                    self.headerRefreshState = XMRefreshStateWillRefreshing;
                }
            }else if (self.headerRefreshState == XMRefreshStateWillRefreshing)
            {
                if (offsetY >= normal2pullingOffsetY)
                {
                    // 转为普通状态
                    self.headerRefreshState = XMRefreshStateNormal;
                }
            }
        }
        
        if (self.refreshType == XMRefreshTypeFooter)
        {
            if (self.footerRefreshState == XMRefreshStateNormal)
            {
                if (offsetY > normal2pullingOffsetY)
                {
                    // 转为即将刷新状态
                    self.footerRefreshState = XMRefreshStateWillRefreshing;
                }
                
            }else if (self.footerRefreshState == XMRefreshStateWillRefreshing )
            {
                if (offsetY <= normal2pullingOffsetY)
                {
                    // 转为普通状态
                    self.footerRefreshState = XMRefreshStateNormal;
                }
            }
        }
    }else if (self.footerRefreshState == XMRefreshStateWillRefreshing|| self.headerRefreshState == XMRefreshStateWillRefreshing)
    {
        // 即将刷新 && 手松开
        
        if (self.refreshType == XMRefreshTypeHeader)
        {
            // 开始刷新
            [self beginHeaderRefreshing];
            
        }else if (self.refreshType == XMRefreshTypeFooter)
        {
            [self beginFooterRefreshing];
        }
    }
}

#pragma mark - 刷新状态变换
- (void)beginHeaderRefreshing
{
    self.headerRefreshState = XMRefreshStateRefresing;
    [self.activityHeader startAnimating];
}

- (void)beginFooterRefreshing
{
    self.footerRefreshState = XMRefreshStateRefresing;
    [self.activityFooter startAnimating];
}

- (void)endHeaderRefreshing
{
    self.headerRefreshState = XMRefreshStateNormal;
    if ([self.activityHeader isAnimating])
    {
        [self.activityHeader stopAnimating];
    }
}
- (void)endFooterRefreshing
{
    self.footerRefreshState = XMRefreshStateNormal;
    if ([self.activityFooter isAnimating])
    {
        [self.activityFooter stopAnimating];
    }
}

- (void)endFooterRefreshingWithNoMoreData{
    [self endFooterRefreshingWithNoMoreData:nil];
}

- (void)endFooterRefreshingWithNoMoreData:(NSString *)customTitle{
    self.endWithNoMoreDataDescription = customTitle;
    self.footerRefreshState = XMRefreshStateNoticeNoMoreData;
    if ([self.activityFooter isAnimating])
    {
        [self.activityFooter stopAnimating];
    }
}

- (void)scrollViewContentSizeDidChange:(NSDictionary *)change
{
    // 内容的高度
    CGFloat contentHeight = self.scrollView.xm_contentHeight;
    // 表格的高度
    CGFloat scrollHeight = self.scrollView.xm_h - self.originalContentInset.top - self.originalContentInset.bottom;
    // 设置位置和尺寸
    if (self.refreshType == XMRefreshTypeFooter)
    {
        self.xm_y = MAX(contentHeight, scrollHeight);
    }
}
- (void)scrollViewPanStateDidChange:(NSDictionary *)change
{
    
 
}

#pragma mark 获得scrollView的内容 超出 view 的高度
- (CGFloat)heightForContentBreakView
{
    CGFloat h = self.scrollView.frame.size.height - self.originalContentInset.bottom - self.originalContentInset.top;
    return self.scrollView.contentSize.height - h;
}

#pragma mark 刚好看到上拉刷新控件时的contentOffset.y
- (CGFloat)happenOffsetY
{
    CGFloat deltaH = [self heightForContentBreakView];
    if (deltaH > 0) { // contentSize 超出scrollView的高度
        return deltaH - self.originalContentInset.top;
    } else { // contentSize 没有超出scrollView的高度
        return - self.originalContentInset.top;
    }
}


@end

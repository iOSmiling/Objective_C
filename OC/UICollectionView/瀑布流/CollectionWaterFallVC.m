//
//  CollectionWaterFallVC.m
//  OC
//
//  Created by 薛坤龙 on 2016/12/27.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import "CollectionWaterFallVC.h"
#import <MJRefresh/MJRefresh.h>
#import <MJExtension/MJExtension.h>
#import "WaterFlowCollectionViewCell.h"
#import "WaterFlowLayout.h"
#import "ShopModel.h"

static NSString *Cell = @"UICollectionViewCell";

@interface CollectionWaterFallVC ()<UICollectionViewDelegate,UICollectionViewDataSource,WaterflowLayoutDelegate>

@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) WaterFlowLayout *layout;
@property (nonatomic,strong) NSMutableArray *array;

@end

@implementation CollectionWaterFallVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"瀑布流";
    
    [self.view addSubview:self.collectionView];

    [self setupRefresh];

}

- (void)setupRefresh
{
    
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewShops)];
    [self.collectionView.mj_header beginRefreshing];
    
    self.collectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreShops)];
    self.collectionView.mj_footer.hidden = YES;
}

- (void)loadNewShops
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        NSArray *shops = [ShopModel mj_objectArrayWithFilename:@"1.plist"];
        [self.array removeAllObjects];
        [self.array addObjectsFromArray:shops];
        
        //刷新数据
        [self.collectionView reloadData];
        [self.collectionView.mj_header endRefreshing];
        
    });
    
}

- (void)loadMoreShops
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        NSArray *shops = [ShopModel mj_objectArrayWithFilename:@"1.plist"];
        [self.array addObjectsFromArray:shops];
        
        //刷新数据
        [self.collectionView reloadData];
        [self.collectionView.mj_footer endRefreshing];
        
    });
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    self.collectionView.mj_footer.hidden = self.array.count == 0;
    return self.array.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    WaterFlowCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:Cell forIndexPath:indexPath];
    cell.shopModel = self.array[indexPath.item];
    return cell;
}

#pragma mark JGWaterflowLayoutDelegate
- (CGFloat)waterflowlayout:(WaterFlowLayout *)waterlayout heightForItemAtIndex:(NSUInteger)index itemWidth:(CGFloat)itemWidth
{
    ShopModel *shop = self.array[index];
    
    //30 是 价格显示的高度
    
    return (itemWidth * shop.h / shop.w) +30;
}

- (CGFloat)rowMarginInWaterflowLayout:(WaterFlowLayout *)waterflowLayout
{
    return 20;
}

- (CGFloat)columnCountInWaterflowLayout:(WaterFlowLayout *)waterflowLayout
{
    return 2;
}

- (UIEdgeInsets)edgeInsetsInWaterflowLayout:(WaterFlowLayout *)waterflowLayout
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

- (UICollectionView *)collectionView
{
    if (!_collectionView)
    {
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:self.layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [self.collectionView registerClass:[WaterFlowCollectionViewCell class] forCellWithReuseIdentifier:Cell];
        
    }
    return _collectionView;
}

- (WaterFlowLayout *)layout
{
    if (!_layout)
    {
        _layout = [[WaterFlowLayout alloc] init];
        _layout.delegate = self;
    }
    return _layout;
}

- (NSMutableArray *)array
{
    if (!_array)
    {
        _array = [NSMutableArray new];
    }
    return _array;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

@end

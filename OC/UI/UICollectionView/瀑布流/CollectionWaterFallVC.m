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

#import "CollectionHeaderReusableView.h"

static NSString *Cell = @"UICollectionViewCell";

@interface CollectionWaterFallVC ()<UICollectionViewDelegate,UICollectionViewDataSource,WaterflowLayoutDelegate>

@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) WaterFlowLayout *layout;
@property (nonatomic,strong) NSMutableArray *array;



@property (nonatomic,assign) CGFloat  columnCount ; //列数

@end

@implementation CollectionWaterFallVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"瀑布流";

    self.columnCount = 2;
    
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

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
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

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    if (kind == UICollectionElementKindSectionHeader)
    {
           CollectionHeaderReusableView  *myTipsCollectionFootView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
    
        reusableview = myTipsCollectionFootView;
    
    }else
    {
        
    
    }
    return reusableview;
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
    return 10;
}

- (CGFloat)columnCountInWaterflowLayout:(WaterFlowLayout *)waterflowLayout
{
    return self.columnCount;
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
        [_collectionView registerClass:[WaterFlowCollectionViewCell class] forCellWithReuseIdentifier:Cell];
        
        [_collectionView registerClass:[CollectionHeaderReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
        
    }
    return _collectionView;
}

- (WaterFlowLayout *)layout
{
    if (!_layout)
    {
        _layout = [[WaterFlowLayout alloc] init];

        _layout.headerReferenceSize = CGSizeMake(ScreenWidth, 100);
        
        _layout.sectionInset = UIEdgeInsetsMake(0, 15, 0, 15);
        
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

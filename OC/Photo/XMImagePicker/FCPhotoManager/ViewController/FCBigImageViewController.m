//
//  FCBigImageViewController.m
//  PhotoCatchTest
//
//  Created by pg on 2016/11/19.
//  Copyright © 2016年 DZHFCompany. All rights reserved.
//

#import "FCBigImageViewController.h"
#import "BigPhotoImageCell.h"
#import "FCPhotoManager.h"

#define KScreenW [UIScreen mainScreen].bounds.size.width
#define KScreenH [UIScreen mainScreen].bounds.size.height
#define KMargin 30
@interface FCBigImageViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate>
@property (strong,nonatomic)UICollectionView *myCollectionView;

/**
 *  导航栏右侧的按钮
 */
@property(nonatomic,strong)UIButton *selectBtn;
/**
 *  中间的标题
 */
@property(nonatomic,strong)UILabel *titleLable;

@end

@implementation FCBigImageViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.myCollectionView setContentOffset:CGPointMake(self.currentIndex*(KScreenW+KMargin), 0)];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initMyBigImageListUI];
}

-(void)initMyBigImageListUI{
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationController.navigationBar.translucent = YES;
    self.edgesForExtendedLayout = UIRectEdgeNone;

    // 设置流水布局
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumLineSpacing = KMargin;
    flowLayout.sectionInset = UIEdgeInsetsMake(0, KMargin/2, 0, KMargin/2);
    flowLayout.itemSize = self.view.frame.size;
    _myCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(-KMargin/2, 0, KScreenW+KMargin, KScreenH) collectionViewLayout:flowLayout];
    _myCollectionView.delegate = self;
    _myCollectionView.dataSource = self;
    _myCollectionView.pagingEnabled = YES;
    [self.view addSubview:_myCollectionView];
    [self.myCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([BigPhotoImageCell class]) bundle:nil] forCellWithReuseIdentifier:@"bigImageViewCell"];
    
    _selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_selectBtn setImage:[UIImage imageNamed:@"PhotoManagerResource.bundle/ImageSelectedOff"] forState:UIControlStateNormal];
    [_selectBtn setImage:[UIImage imageNamed:@"PhotoManagerResource.bundle/ImageSelectedOn"] forState:UIControlStateSelected];
    _selectBtn.frame = CGRectMake(0, 0, 30, 30);
    [_selectBtn addTarget:self action:@selector(selectStatus:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:_selectBtn];
    
    //设置返回按钮
    [self setLeftButtonItem];
    
    UILabel * titleLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 44)];
    titleLable.text = [NSString stringWithFormat:@"%d/%d",(int)self.currentIndex+1,(int)self.allImageListArr.count];
    _titleLable = titleLable;
    titleLable.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = titleLable;
}


#pragma mark -直接返回上一层
-(void)setLeftButtonItem{
    UIButton *back = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    [back setImage:[UIImage imageNamed:@"PhotoManagerResource.bundle/back_press"] forState:UIControlStateNormal];
    back.contentEdgeInsets = UIEdgeInsetsMake(0, -16, 0, 0);
    back.imageView.contentMode = UIViewContentModeLeft;
    [back addTarget:self action:@selector(backToRoot) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *left = [[UIBarButtonItem alloc]initWithCustomView:back];
    
    /**
     *  width为负数时，相当于btn向右移动width数值个像素，由于按钮本身和边界间距为5pix，所以width设为-15时，间距正好调整
     *  为10；width为正数时，正好相反，相当于往左移动width数值个像素
     */
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSpacer.width = -7;
    self.navigationItem.leftBarButtonItems = @[negativeSpacer, left];
}

#pragma mark -返回按钮
-(void)backToRoot{

    if (_imageReturnlock) {
        _imageReturnlock(_selectImageArr);
        [self.navigationController popViewControllerAnimated:YES];
    }
}

#pragma mark -对图片选中和取消的操作
-(void)selectStatus:(UIButton*)sender{
    sender.selected = !sender.selected;
    if (sender.selected) {//添加进数组
        if (self.maxCount == _selectImageArr.count) {
            //已达到最大选择值
            NSLog(@"已达到最大值");
            sender.selected = NO;
        }else{
            //添加到数组中
            FCPhotoModel *model = [[FCPhotoModel alloc]init];
            model.asset =  _allImageListArr[sender.tag];
            model.imageName = [_allImageListArr[sender.tag] valueForKey:@"filename"];
            [_selectImageArr addObject:model];
        }
    }else{//从数组中删除
        [_selectImageArr enumerateObjectsUsingBlock:^(FCPhotoModel  *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj.imageName isEqualToString:[_allImageListArr[sender.tag] valueForKey:@"filename"]]) {
                *stop = YES;
                if (*stop == YES) {
                    [_selectImageArr removeObject:obj];
                }
            }
        }];
    }
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _allImageListArr.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //初始化按钮的状态
    self.selectBtn.selected = NO;
    self.selectBtn.tag = indexPath.row;
    BigPhotoImageCell *cell = [BigPhotoImageCell cellWithCollectionView:collectionView WithIndexPath:indexPath];
    cell.myScrollView.delegate = self;
    cell.sourceAsset = _allImageListArr[indexPath.row];
    [self addGestureTapToScrollView:cell.myScrollView];
    [_selectImageArr enumerateObjectsUsingBlock:^(FCPhotoModel  *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj.imageName isEqualToString:[_allImageListArr[indexPath.row] valueForKey:@"filename"]]) {
            self.selectBtn.selected = YES;
        }
    }];
    return cell;
}

/**
 *  即将出现的不被方法或者缩小的视图
 */
-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    BigPhotoImageCell * WillCell = (BigPhotoImageCell *)cell;
    WillCell.myScrollView.zoomScale = 1;
}
/**
 *  返回的是图片的视图
 */
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return scrollView.subviews[0];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView == (UIScrollView *)_myCollectionView) {
        CGFloat current = scrollView.contentOffset.x / (KScreenW + KMargin) + 1;
        _titleLable.text = [NSString stringWithFormat:@"%.f/%d",current,(int)self.allImageListArr.count];
    }
}

#pragma mark ---  scrollView 添加手势
-(void)addGestureTapToScrollView:(UIScrollView *)scrollView{
    UITapGestureRecognizer * singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(singleTapOnScrollView:)];
    singleTap.numberOfTapsRequired = 1;
    [scrollView addGestureRecognizer:singleTap];
    
    UITapGestureRecognizer * doubleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doubleTapOnScrollView:)];
    doubleTap.numberOfTapsRequired = 2;
    [scrollView addGestureRecognizer:doubleTap];
    
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinchOnScrollView:)];
    [scrollView addGestureRecognizer:pinch];
}

-(void)pinchOnScrollView:(UIPinchGestureRecognizer*)pinchGesture{
    CGFloat scale = pinchGesture.scale;
    UIScrollView * scrollView = (UIScrollView *)pinchGesture.view;
    if (scale > 3) {
        scale = 3;
    }else if (scale < 1){
        scale = 1;
    }
    [self CGRectForScale:scale WithCenter:[pinchGesture locationInView:pinchGesture.view] ScrollView:scrollView Completion:^(CGRect Rect) {
        [scrollView zoomToRect:Rect animated:YES];
    }];

}
/**
 *  隐藏导航栏和NavgationBar
 */
-(void)singleTapOnScrollView:(UITapGestureRecognizer *)singleTap{
    if (self.navigationController.navigationBar.isHidden) {
        [self.navigationController setNavigationBarHidden:NO animated:YES];
//        [UIApplication sharedApplication].statusBarHidden = NO;
    }else{
        [self.navigationController setNavigationBarHidden:YES animated:YES];
//        [UIApplication sharedApplication].statusBarHidden = YES;
    }
}
/**
 *  放大缩小
 */
-(void)doubleTapOnScrollView:(UITapGestureRecognizer *)doubleTap{
    
    UIScrollView * scrollView = (UIScrollView *)doubleTap.view;
    CGFloat scale = 1;
    if (scrollView.zoomScale != 3) {
        scale = 3;
    }else{
        scale = 1;
    }
    [self CGRectForScale:scale WithCenter:[doubleTap locationInView:doubleTap.view] ScrollView:scrollView Completion:^(CGRect Rect) {
        [scrollView zoomToRect:Rect animated:YES];
    }];
}
-(void)CGRectForScale:(CGFloat)scale WithCenter:(CGPoint)center ScrollView:(UIScrollView *)scrollView Completion:(void(^)(CGRect Rect))completion{
    CGRect Rect;
    Rect.size.height = scrollView.frame.size.height / scale;
    Rect.size.width  = scrollView.frame.size.width  / scale;
    Rect.origin.x    = center.x - (Rect.size.width  /2.0);
    Rect.origin.y    = center.y - (Rect.size.height /2.0);
    completion(Rect);
}
@end

//
//  SelectMorePhotoVC.m
//  OC
//
//  Created by 薛坤龙 on 2016/12/20.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import "SelectMorePhotoVC.h"
#import "JKImagePickerController.h"
#import "PhotoCell.h"


@interface SelectMorePhotoVC ()<JKImagePickerControllerDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,PhotoCellDelegate>


@property (nonatomic,strong) UICollectionView *collectionView;//

@property (nonatomic,strong) NSMutableArray *assetsArray; //选择的图片



@end

@implementation SelectMorePhotoVC

#pragma mark - Life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"图片多选";
    
    self.assetsArray = [NSMutableArray new];
    
    [self loadNavigationItem];
    
    [self.view addSubview:self.collectionView];
    self.collectionView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
}

#pragma mark - UI Build
-(void)loadNavigationItem
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"多选" style:UIBarButtonItemStylePlain target:self action:@selector(selectMorePhoto)];
}

#pragma mark - Response Event
- (void)selectMorePhoto
{
    JKImagePickerController *imagePickerController = [[JKImagePickerController alloc] init];
    imagePickerController.delegate = self;
    imagePickerController.showsCancelButton = YES;
    imagePickerController.allowsMultipleSelection = YES;
    imagePickerController.minimumNumberOfSelection = 1;//最小选取照片数
    imagePickerController.maximumNumberOfSelection = 9;//最大选取照片数
    imagePickerController.selectedAssetArray =self.assetsArray;//已经选择了的照片
    UINavigationController*navigationController = [[UINavigationController alloc] initWithRootViewController:imagePickerController];
    [self presentViewController:navigationController animated:YES completion:NULL];

}

#pragma mark - JKImagePickerControllerDelegate

- (void)imagePickerController:(JKImagePickerController *)imagePicker didSelectAssets:(NSArray *)assets isSource:(BOOL)source
{
    self.assetsArray=[assets mutableCopy];
    
    [imagePicker dismissViewControllerAnimated:YES completion:^{
        
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.collectionView reloadData];
            });
       
    }];
  
//    for (JKAssets *asset in assets)
//    {
//        ALAssetsLibrary   *lib = [[ALAssetsLibrary alloc] init];
//        [lib assetForURL:asset.assetPropertyURL resultBlock:^(ALAsset *asset) {
//            if (asset)
//            {
//                UIImage *image = [UIImage imageWithCGImage:[[asset defaultRepresentation] fullScreenImage]];
//                
//                
////                NSData *imageData = UIImageJPEGRepresentation(image,0.5);
//                
//                dispatch_async(dispatch_get_main_queue(), ^{
//                    [self.assetsArray addObject:image];
//                    [_collectionView reloadData];
//                });
//
//            }
//            
//        } failureBlock:^(NSError *error) {
//            
//        }];
//    }
    
  
    
}

- (void)imagePickerControllerDidCancel:(JKImagePickerController *)imagePicker
{
    [imagePicker dismissViewControllerAnimated:YES completion:^{
        
    }];
}

#pragma mark - PhotoCellDelegate
- (void)deletePhoto:(UICollectionViewCell *)cell
{
    NSIndexPath *indexPath = [_collectionView indexPathForCell:cell];

    [_assetsArray removeObjectAtIndex:indexPath.row];
    [_collectionView reloadData];

}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.assetsArray.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoCell *item = [collectionView dequeueReusableCellWithReuseIdentifier:@"PhotoCell" forIndexPath:indexPath];
    item.delegate = self;
    [item loadData:[_assetsArray objectAtIndex:indexPath.row]];
    return  item;
}

#pragma mark UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((self.view.frame.size.width - 23 ) / 2, (self.view.frame.size.width - 23 ) / 2 + 95 );
    
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10 , 9 , 0, 9 );
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 4.9 ;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10 ;
}


#pragma mark - Getters and Setters

-(UICollectionView *)collectionView
{
    if (!_collectionView)
    {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        [_collectionView registerClass:[PhotoCell class] forCellWithReuseIdentifier:@"PhotoCell"];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    
    return _collectionView;
}

#pragma mark - dealloc

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   
}


@end

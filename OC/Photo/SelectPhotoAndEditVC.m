//
//  SelectPhotoAndEditVC.m
//  OC
//
//  Created by 薛坤龙 on 2016/12/21.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import "SelectPhotoAndEditVC.h"
#import "JFImagePickerController.h"

@interface SelectPhotoAndEditVC ()<JFImagePickerDelegate>
{
    NSMutableArray<UIImage *> *_photosArray;
}
@end

@implementation SelectPhotoAndEditVC


- (void)viewDidLoad
{
    [super viewDidLoad];
    
     _photosArray = [NSMutableArray new];
    
    [self loadNavigationItem];
    
}

#pragma mark - UI Build
-(void)loadNavigationItem
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"多选" style:UIBarButtonItemStylePlain target:self action:@selector(selectMorePhoto)];
}

#pragma mark - Response Event
- (void)selectMorePhoto
{
    [JFImagePickerController setMaxCount:20];
    JFImagePickerController *picker = [[JFImagePickerController alloc] initWithRootViewController:[UIViewController new]];
    picker.pickerDelegate = self;
    [self.navigationController presentViewController:picker animated:YES completion:nil];

}

#pragma mark - JFImagePicker Delegate -

- (void)imagePickerDidFinished:(JFImagePickerController *)picker{
    
    __weak typeof(self) weakself = self;
    for (ALAsset *asset in picker.assets) {
        [[JFImageManager sharedManager] imageWithAsset:asset resultHandler:^(CGImageRef imageRef, BOOL longImage) {
            UIImage *image = [UIImage imageWithCGImage:imageRef];
            dispatch_async(dispatch_get_main_queue(), ^{
                
                
                [_photosArray addObject:image];
                
                
                
                
            });
        }];
    }
    [self imagePickerDidCancel:picker];
}

- (void)imagePickerDidCancel:(JFImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    [JFImagePickerController clear];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

@end

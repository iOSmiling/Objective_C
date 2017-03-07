//
//  SrollShowTestOneVC.m
//  OC
//  搬运代码用以学习
//  Created by 薛坤龙 on 2016/12/21.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import "ScrollShowTestOneVC.h"
#import "LYScrollView.h"
#import "UIImageEffects.h"

@interface ScrollShowTestOneVC ()<LYScrollViewDelegate>

@property (nonatomic, strong) LYScrollView * scrollView;
@property (nonatomic, strong) NSMutableArray * itmeArray;
@property (nonatomic, strong) UIImageView * imageView;

@end

@implementation ScrollShowTestOneVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"展示One";
    
    self.imageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.imageView];
    self.imageView.backgroundColor = [UIColor lightGrayColor];
    
    self.itmeArray = [NSMutableArray array];
    for (NSInteger i = 1; i < 5; i++)
    {
        
        [self.itmeArray addObject:[UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpg",(long)i]]];
    }
    
    self.imageView.image = [self blurViewByLightEffectWithImage:self.itmeArray[0]];
    
    self.scrollView = [[LYScrollView alloc] initWithFrame:self.view.frame];
    self.scrollView.delegate = self;
    self.scrollView.isOpenDelete = YES;
    self.scrollView.itmeArray = self.itmeArray;
    [self.view addSubview:self.scrollView];
 
}

-(void)scrolIndex:(NSInteger)index
{
    if (self.itmeArray.count > index)
    {
        self.imageView.image = [self blurViewByLightEffectWithImage:self.itmeArray[index]];
    }
}

- (UIImage *)blurViewByLightEffectWithImage:(UIImage *)screenImage
{
    UIImage * blurImage = [UIImageEffects imageByApplyingLightEffectToImage:screenImage];
    return blurImage;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}



@end

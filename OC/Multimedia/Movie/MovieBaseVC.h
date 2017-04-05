//
//  MovieBaseVC.h
//  OC
//
//  Created by 薛坤龙 on 2017/4/5.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import "BaseViewController.h"

@interface MovieBaseVC : BaseViewController

@property (nonatomic, strong) NSString *videoPath;
- (void)playerButtonClick:(UIButton *)playButton;

@end

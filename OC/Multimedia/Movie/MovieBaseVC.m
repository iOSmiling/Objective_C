//
//  MovieBaseVC.m
//  OC
//
//  Created by 薛坤龙 on 2017/4/5.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import "MovieBaseVC.h"

@interface MovieBaseVC ()
@property (nonatomic, strong)  UIButton *playerButton;
@end

@implementation MovieBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.playerButton.center = self.view.center;
    self.playerButton.bounds = CGRectMake(0, 0, 100, 44);
}

- (void)playerButtonClick:(UIButton *)playButton
{
    
}

-(UIButton *)playerButton
{
    if(_playerButton == nil)
    {
        _playerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_playerButton setTitle:@"播放" forState:UIControlStateNormal];
        [_playerButton setTitle:@"停止" forState:UIControlStateSelected];
        [_playerButton addTarget:self action:@selector(playerButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_playerButton];
        _playerButton.backgroundColor = [UIColor blackColor];
        [_playerButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }
    return _playerButton;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

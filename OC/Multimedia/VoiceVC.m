//
//  VoiceVC.m
//  OC
//
//  Created by 薛坤龙 on 2017/3/22.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import "VoiceVC.h"
#import <AVFoundation/AVFoundation.h>


@interface VoiceVC ()<AVAudioPlayerDelegate>

@property (nonatomic,strong) UIButton *localButton;

@property (nonatomic,strong) AVAudioPlayer *musicPlayer;// 声明音乐播放控件，必须声明为全局属性变量，否则可能不会播放，AVAudioPlayer 只能播放本地音乐

@end

@implementation VoiceVC

#pragma mark - life
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"音频";
    self.edgesForExtendedLayout = UIRectEdgeNone;

    [self initSubViewUI];
    
    NSString *musicFilePath = [[NSBundle mainBundle] pathForResource:@"伤不起" ofType:@"mp3"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:musicFilePath])
    {
        NSURL *musicUrl = [NSURL fileURLWithPath:musicFilePath];
        self.musicPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:musicUrl error:nil];
        self.musicPlayer.delegate = self;
        _musicPlayer.volume = 1;
        // 准备（缓冲）播放
        [self.musicPlayer prepareToPlay];
    
    }

    //后台播放设置 info.plist 增加 Required background modes  - item -> App plays audio or streams audio/video using AirPlay
    [[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategoryPlayback error:nil];
    [[AVAudioSession sharedInstance] setActive: YES error:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    NSArray *localButton_h = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[_localButton(==200)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_localButton)];
    NSArray *localButton_v = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[_localButton(==46)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_localButton)];
    [self.view addConstraints:localButton_h];
    [self.view addConstraints:localButton_v];

}

- (void)initSubViewUI
{
    [self.view addSubview:self.localButton];
    
}

- (void)localButtonEvent:(UIButton *)sender
{
    if([_musicPlayer isPlaying])
    {
        
        [_musicPlayer pause];
        [_localButton setTitle:@"暂停播放中本地音频" forState:UIControlStateNormal];
    
    }else
    {
         [_localButton setTitle:@"播放中本地音频" forState:UIControlStateNormal];
         [_musicPlayer play];
    
    }
    // 获取音乐通道数
    NSUInteger numberOfChannels = _musicPlayer.numberOfChannels;
    NSLog(@"音频通道数:%lu",(unsigned long)numberOfChannels);
    
    //获取音乐的长度，单位秒
    NSTimeInterval duration = _musicPlayer.duration;
    NSLog(@"音频时长 %f",duration);
    
}

#pragma mark - AVAudioPlayerDelegate
// 播放完成
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    NSLog(@"播放完成");
}

// 播放失败
- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error
{
    NSLog(@"播放完成");
}

#pragma mark - setter/getter
- (UIButton *)localButton
{
    if (!_localButton)
    {
        _localButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_localButton setTitle:@"播放本地音频" forState:UIControlStateNormal];
        _localButton.layer.borderColor = [UIColor blackColor].CGColor;
        _localButton.layer.borderWidth = 1.0;
        [_localButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_localButton addTarget:self action:@selector(localButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
        _localButton.translatesAutoresizingMaskIntoConstraints = NO;
        
    }

    return _localButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end

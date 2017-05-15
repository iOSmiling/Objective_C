//
//  MovieVC.m
//  OC
//
//  Created by 薛坤龙 on 2017/4/5.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import "MovieVC.h"
#import "LZBAVPlayerVC.h"
#import "LZBMPMoviePlayerControllerVC.h"
#import "LZBMPMoviePlayerViewControllerVC.h"
#import "LZBPlayerMoreVideoVC.h"

#import "CL_PlayerViewController.h"

@interface MovieVC ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray <NSString *> *playStyleArray;
@property (nonatomic, strong) NSArray <UIViewController *> *playVCarray;

@end

@implementation MovieVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"选择播放器播放视频";
    [self.view addSubview:self.tableView];
    
    
    //测试视频
    /*
     @"http://120.25.226.186:32812/resources/videos/minion_01.mp4",
     @"http://120.25.226.186:32812/resources/videos/minion_02.mp4",
     @"http://120.25.226.186:32812/resources/videos/minion_03.mp4",
     @"http://120.25.226.186:32812/resources/videos/minion_04.mp4",
     @"http://120.25.226.186:32812/resources/videos/minion_05.mp4",
     @"http://120.25.226.186:32812/resources/videos/minion_06.mp4",
     @"http://120.25.226.186:32812/resources/videos/minion_07.mp4",
     */
    

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.playStyleArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(cell == nil)
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    cell.textLabel.text = self.playStyleArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 3)
    {
        LZBPlayerMoreVideoVC *vc = [[LZBPlayerMoreVideoVC alloc]init];
        [self presentViewController:vc animated:YES completion:nil];
    }
    else if(indexPath.row == 2)
    {
        LZBAVPlayerVC *vc = [[LZBAVPlayerVC alloc]init];
        vc.videoPath = @"http://120.25.226.186:32812/resources/videos/minion_01.mp4";
        [self presentViewController:vc animated:YES completion:nil];
    }
    else if(indexPath.row ==0 || indexPath.row == 1)
    {
        MovieBaseVC *baseVC = (MovieBaseVC *)self.playVCarray[indexPath.row];
        baseVC.videoPath = @"http://120.25.226.186:32812/resources/videos/minion_01.mp4";
        [self.navigationController pushViewController:baseVC animated:YES];
    }else if(indexPath.row == 4)
    {
        CL_PlayerViewController *vc = [[CL_PlayerViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}


#pragma mark - lazy
- (UITableView *)tableView
{
    if(_tableView == nil)
    {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (NSArray<NSString *> *)playStyleArray
{
    return @[@"MPMoviePlayerController播放视频",@"MPMoviePlayerViewController播放视频",@"AVPlayer播放视频当个视频",@"AVPlayer播放视频多个视频",@"自定义AVPlayer"];
}

- (NSArray<UIViewController *> *)playVCarray
{
    return @[[[LZBMPMoviePlayerControllerVC alloc]init],[[LZBMPMoviePlayerViewControllerVC alloc]init],[[LZBAVPlayerVC alloc]init],[[LZBPlayerMoreVideoVC alloc]init]];
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

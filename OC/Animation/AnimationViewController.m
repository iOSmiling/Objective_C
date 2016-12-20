//
//  AnimationViewController.m
//  OC
//
//  Created by 薛坤龙 on 2016/12/19.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import "AnimationViewController.h"
#import "AnimationFrameVC.h"
#import "AnimationBoundsVC.h"
#import "AnimationCenterVC.h"
#import "AnimationTransformVC.h"
#import "AnimationAlphaVC.h"
#import "AnimationKeyFramesVC.h"
#import "AnimationSpringVC.h"
#import "AnimationTransitionVC.h"
#import "CAAnimationDescriptionVC.h"
#import "CAPropertyAnimationVC.h"
#import "CATransitionVC.h"

@interface AnimationViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong,nonnull) UITableView *animationTableView;
@property (nonatomic,strong) NSMutableArray *animationArray;

@end

@implementation AnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"Animation";
    
    self.animationArray = [[NSMutableArray alloc] init];
    [_animationArray addObject:@"animation_frame"];
    [_animationArray addObject:@"animation_bounds"];
    [_animationArray addObject:@"animaiion_center"];
    [_animationArray addObject:@"animation_transform"];
    [_animationArray addObject:@"animation_alpha"];
    [_animationArray addObject:@"animation_keyFrames"];
    [_animationArray addObject:@"animation_spring"];
    [_animationArray addObject:@"animation_transition"];
    [_animationArray addObject:@"CAAnimation"];
    [_animationArray addObject:@"CAPropertyAnimation"];
    [_animationArray addObject:@"CATransition"];
    
    [self.view addSubview:self.animationTableView];
    _animationTableView.frame = self.view.frame;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.animationArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *identifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = _animationArray[indexPath.row];
    
    return cell;
    
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row;
    
    switch (row)
    {
        case 0:
        {
            AnimationFrameVC *vc1 = [[AnimationFrameVC alloc] init];
            [self.navigationController pushViewController:vc1 animated:YES];
              break;
        }
        case 1:
        {
            AnimationBoundsVC *vc2 = [[AnimationBoundsVC alloc] init];
            [self.navigationController pushViewController:vc2 animated:YES];
             break;
        }
        case 2:
        {
            AnimationCenterVC *vc3 = [[AnimationCenterVC alloc] init];
            [self.navigationController pushViewController:vc3 animated:YES];
             break;
        }
        case 3:
        {
            AnimationTransformVC *vc4 = [[AnimationTransformVC alloc] init];
            [self.navigationController pushViewController:vc4 animated:YES];
            break;
        }
        case 4:
        {
            AnimationAlphaVC *vc5 = [[AnimationAlphaVC alloc] init];
            [self.navigationController pushViewController:vc5 animated:YES];
            break;
        }
        case 5:
        {
            AnimationKeyFramesVC *vc6 = [[AnimationKeyFramesVC alloc] init];
            [self.navigationController pushViewController:vc6 animated:YES];
              break;
        }
          
        case 6:
        {
            AnimationSpringVC *vc6 = [[AnimationSpringVC alloc] init];
            [self.navigationController pushViewController:vc6 animated:YES];
             break;
        }
           
        case 7:
        {
            AnimationTransitionVC *vc6 = [[AnimationTransitionVC alloc] init];
            [self.navigationController pushViewController:vc6 animated:YES];
              break;
        }
          
        case 8:
        {
            CAAnimationDescriptionVC *vc7 = [[CAAnimationDescriptionVC alloc] init];
            [self.navigationController pushViewController:vc7 animated:YES];
            break;
        }
        case 9:
        {
            CAPropertyAnimationVC *vc8 = [[CAPropertyAnimationVC alloc] init];
            [self.navigationController pushViewController:vc8 animated:YES];
             break;
        }
           
        case 10:
        {
            CATransitionVC *vc9 = [[CATransitionVC alloc] init];
            [self.navigationController pushViewController:vc9 animated:YES];
            break;
        }
        default:
            break;
    }
    
}

-(UITableView *)animationTableView
{
    if (!_animationTableView)
    {
        _animationTableView = [[UITableView alloc] init];
        _animationTableView.delegate = self;
        _animationTableView.dataSource = self;
    }
    return _animationTableView;
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

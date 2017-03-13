//
//  ActivityViewVC.m
//  OC
//
//  Created by 薛坤龙 on 2017/3/10.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import "ActivityViewVC.h"

@interface ActivityViewVC ()

@end

@implementation ActivityViewVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.translatesAutoresizingMaskIntoConstraints = NO;
    [button setTitle:@"点击" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    NSArray *button_h = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[button(==100)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(button)];
    NSArray *button_v = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[button(==46)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(button)];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    [self.view addConstraints:button_h];
    [self.view addConstraints:button_v];
    
}


- (void)buttonEvent:(UIButton *)sender
{
    NSArray *array = @[@"test1", @"test2"];
    
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:array applicationActivities:nil];
    
    [self presentViewController:activityVC animated:YES
                     completion:^{
                         NSLog(@"Air");
                     }];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

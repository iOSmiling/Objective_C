//
//  InitializeTestVC.m
//  OC
//
//  Created by 薛坤龙 on 2017/2/13.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import "InitializeTestVC.h"

@interface InitializeTestVC ()

@property (nonatomic,strong) NSString *testID;

@end

@implementation InitializeTestVC

- (instancetype)initWithTestID:(NSString *)testID
{
    self = [super init];
    if (self)
    {
        _testID = testID;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"VC自定义初始化方法";
    
    NSLog(@"_testID :%@",_testID);
}

- (void)didReceiveMemoryWarning
{
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

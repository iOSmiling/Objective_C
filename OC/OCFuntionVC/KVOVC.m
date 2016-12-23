//
//  KVOVC.m
//  OC
//
//  Created by 薛坤龙 on 2016/12/23.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import "KVOVC.h"
#import "UserModel.h"

@interface KVOVC ()

@property (nonatomic,strong) UserModel *testModel;

@end

@implementation KVOVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"KVO";
    
    _testModel = [[UserModel alloc] init];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Model改值"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(rightItemEvent)];
    
    [_testModel addObserver:self forKeyPath:@"userID" options:NSKeyValueObservingOptionNew context:nil];
    
}

- (void)rightItemEvent
{
    _testModel.userID = @"one";

}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"userID"])
    {
        self.navigationItem.title = _testModel.userID;
    }
}

- (void)dealloc
{
    [_testModel removeObserver:self forKeyPath:@"userID"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end

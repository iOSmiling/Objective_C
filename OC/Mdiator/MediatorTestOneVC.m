//
//  MediatorTestOneVC.m
//  OC
//
//  Created by 薛坤龙 on 2017/2/13.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import "MediatorTestOneVC.h"

@interface MediatorTestOneVC ()

@property (nonatomic,copy) NSString *oneID;

@end

@implementation MediatorTestOneVC

- (instancetype)initWithOneID:(NSString *)oneID
{
    self = [super init];
    if (self)
    {
        _oneID = oneID;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"test 1";
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end

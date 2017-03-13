//
//  SelectPhotoDemoMVC.m
//  OC
//
//  Created by 薛坤龙 on 2017/3/10.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import "SelectPhotoDemoMVC.h"
#import "Demo1ViewController.h"
#import "Demo2ViewController.h"
#import "Demo3ViewController.h"

@interface SelectPhotoDemoMVC ()<UITableViewDataSource,UITableViewDelegate>

@property (copy, nonatomic) NSArray *list;

@end

@implementation SelectPhotoDemoMVC

- (NSArray *)list
{
    if (!_list) {
        _list = @[@"Demo1-只使用照片选择功能,不带选好后自动布局(可扩展)",@"Demo2-使用照片选择功能并且选好后自动布局",@"Demo3-视频图片布局分开"];
    }
    return _list;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"仿微博照片选择器";
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.rowHeight = 80;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellId"];
    [self.view addSubview:tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.text = self.list[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        Demo1ViewController *vc = [[Demo1ViewController alloc] init];
        vc.title = @"Demo1";
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 1) {
        Demo2ViewController *vc = [[Demo2ViewController alloc] init];
        vc.title = @"Demo2";
        [self.navigationController pushViewController:vc animated:YES];
    }else {
        Demo3ViewController *vc = [[Demo3ViewController alloc] init];
        vc.title = @"Demo1";
        [self.navigationController pushViewController:vc animated:YES];
    }
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

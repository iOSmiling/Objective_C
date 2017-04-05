//
//  XLRefreshVC.m
//  OC
//
//  Created by 薛坤龙 on 2017/3/31.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import "XLRefreshVC.h"
#import "XLWebVC.h"
#import "XLTableVC.h"
#import "XLCollectionVC.h"
#import "XLGifTableVC.h"

@interface XLRefreshVC ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
}
@end

@implementation XLRefreshVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self buildTable];
}

-(void)buildTable
{
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:[UIView new]];
    self.title = @"XLRefresh";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    //创建TableView
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height ) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

#pragma mark -
#pragma mark TableViewDelegate&DataSource

-(NSArray*)titles{
    return @[@"XLTableVC",@"XLCollectionVC",@"XLWebVC",@"XLGifTableVC"];
}

-(NSArray*)classes{
    return @[[XLTableVC class],[XLCollectionVC class],[XLWebVC class],[XLGifTableVC class]];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self titles].count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString* cellIdentifier = @"cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [self titles][indexPath.row];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Class class = [self classes][indexPath.row];
    UIViewController *vc = [[class alloc] init];
    [self.navigationController pushViewController:vc animated:true];
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

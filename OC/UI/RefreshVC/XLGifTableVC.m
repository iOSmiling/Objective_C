//
//  XLGifTableVC.m
//  OC
//
//  Created by 薛坤龙 on 2017/4/1.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import "XLGifTableVC.h"
#import "XLRefresh.h"

//#import "XLRefreshGifAnimationView.h" //测试

@interface XLGifTableVC ()<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic,strong) UITableView *tableView;

/** <#desc#>  */
@property (nonatomic, strong) NSMutableArray *titles;
/** <#desc#>  */
@property (nonatomic, strong) NSArray *classNames;

//@property (nonatomic, strong) XLRefreshGifAnimationView *gifView; //测试

@end

@implementation XLGifTableVC

- (NSMutableArray *)titles
{
    if (!_titles)
    {
        _titles = [NSMutableArray array];
    }
    return _titles;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
     self.navigationItem.title = @"下拉刷新";
    
    [self.view addSubview:self.tableView];
    _tableView.frame = self.view.frame;
    
    _tableView.xl_gifHeader = [XLRefreshGifHeader gifHeaderWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    
    
    
    [self.titles addObject:@"测试数据1"];
    [self.titles addObject:@"测试数据2"];
    [self.titles addObject:@"测试数据3"];
    [self.tableView reloadData];
    
//    _gifView = [[XLRefreshGifAnimationView alloc] init];
//    [self.view addSubview:_gifView];
//    _gifView.frame = CGRectMake(0, 200, 49, 73);
//    [_gifView startAnimation];
    
}


- (void)loadNewData
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        for (int i = 0; i < arc4random_uniform(20) + 1; i++) {
            [self.titles insertObject:[NSString stringWithFormat:@"下拉测试数据---%zd",arc4random_uniform(999)] atIndex:0];
        }

        //ending
        [_tableView.xl_gifHeader endRefreshing];
        
        [self.tableView reloadData];
    });
    
}


#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titles.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.titles[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark - Getters and Setters
-(UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
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

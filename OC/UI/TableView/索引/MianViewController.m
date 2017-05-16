//
//  MianViewController.m
//  WeiXinSearching
//
//  Created by shen on 2017/5/15.
//  Copyright © 2017年 shen. All rights reserved.
//

#import "MianViewController.h"
#import "MainTableViewCell.h"
@interface MianViewController ()
{
    NSMutableArray *_searchBtnArr;
}

@end

@implementation MianViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:0.004 green:0.651 blue:0.996 alpha:1.000]];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];

    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _searchBtnArr = [NSMutableArray array];
    
    [_searchBtnArr addObject:[NSString stringWithFormat:@"♡"]];
    for(char i = 'A';i <='Z';i ++){
        
        [_searchBtnArr addObject:[NSString stringWithFormat:@"%c",i]];
    }
    
    NSLog(@"%@",_searchBtnArr);
    
    
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.showsVerticalScrollIndicator = NO;
    [self.tableView setSectionIndexBackgroundColor:[UIColor clearColor]];
    [self.tableView setSectionIndexColor:[UIColor grayColor]];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];//去除多余空白行
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arc4random()%10;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _searchBtnArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *string = @"cell";
    
    MainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
    if (cell == nil) {
        cell = [[MainTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:string];
    }
    cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    return cell;
    
}

//右侧索引
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return _searchBtnArr;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    NSInteger count = 0;
    for(NSString *header in _searchBtnArr)
    {
        if([header isEqualToString:title]){
            return count;
        }
        count ++;
    }
    return 0;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
    return _searchBtnArr[section];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"----%ld,\n%ld",indexPath.section,indexPath.row);
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

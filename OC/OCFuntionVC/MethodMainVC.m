//
//  MethodMainVC.m
//  OC
//
//  Created by 薛坤龙 on 2016/12/22.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import "MethodMainVC.h"
#import "OCMethodVC.h"
#import "DictionaryVC.h"
#import "KVOVC.h"

@interface MethodMainVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong,nonnull) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *array;

@end

@implementation MethodMainVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.navigationItem.title = @"OC方法";
    
    self.array = [[NSMutableArray alloc] init];
    
    [_array addObject:@"Method"];
    [_array addObject:@"字典"];
    [_array addObject:@"KVO"];
    
    [self.view addSubview:self.tableView];
    _tableView.frame = self.view.frame;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *identifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = _array[indexPath.row];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row;
    switch (row)
    {
        case 0:
        {
            OCMethodVC *vc1 = [[OCMethodVC alloc] init];
            [self.navigationController pushViewController:vc1 animated:YES];
         
            break;
        }
        case 1:
        {
            DictionaryVC *vc2 = [[DictionaryVC alloc] init];
            [self.navigationController pushViewController:vc2 animated:YES];
            break;
        }
        case 2:
        {
            KVOVC *vc3 = [[KVOVC alloc] init];
            [self.navigationController pushViewController:vc3 animated:YES];
            break;
        }
        case 3:
        {
         
            break;
        }
        case 4:
        {
          
            break;
        }
        case 5:
        {
        
            break;
        }
        case 6:
        {
        
            break;
        }
        default:
            break;
            
    }
    
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



@end
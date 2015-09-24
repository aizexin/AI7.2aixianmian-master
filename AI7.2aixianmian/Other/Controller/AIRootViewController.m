//
//  XLRootViewController.m
//  iOS7.2爱限免
//
//  Created by MS on 15-9-23.
//  Copyright (c) 2015年 xuli. All rights reserved.
//

#import "AIRootViewController.h"
#import "AIBaseTableViewCell.h"
@interface AIRootViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation AIRootViewController

-(NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    
}
#pragma mark -UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    AIBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[AIBaseTableViewCell alloc]init];
    }
    cell.data = self.dataSource[indexPath.row];
    return cell;
}
#pragma mark -UITableViewDelegate



@end

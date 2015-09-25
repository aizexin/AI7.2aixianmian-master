//
//  AIAppListView.m
//  AI7.2aixianmian
//
//  Created by qianfeng on 15/9/24.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import "AIAppListView.h"
#import "AITopicCellView.h"
#import "AITopicSmallView.h"
@implementation AIAppListView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _tableView = [[UITableView alloc]init];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        [self addSubview:_tableView];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        //添加tabelView
        _tableView = [[UITableView alloc]init];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        [self addSubview:_tableView];
        
    }
    return self;
}
-(void)layoutSubviews{
    _tableView.frame = self.bounds;
}

#pragma mark -UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"smallCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]init];
    }
    AITopicSmallView *smallView = [[AITopicSmallView alloc]init];
    smallView.data = self.dataSource[indexPath.row];
    [cell.contentView addSubview:smallView];
    return cell;
}

#pragma mark -UITableViewDelegate

@end

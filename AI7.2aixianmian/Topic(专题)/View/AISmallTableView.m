//
//  AISmallTableView.m
//  AI7.2aixianmian
//
//  Created by qianfeng on 15/9/24.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import "AISmallTableView.h"
#import "AISmallCellView.h"
#import "AITopicSmallAppModel.h"
#import "AIRequestModel.h"
#import "Header.h"
@interface AISmallTableView ()<AIRequestModelDelegate,UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSMutableArray *dataM;
//@property(nonatomic,assign)
@end

@implementation AISmallTableView

-(NSMutableArray *)dataM{
    if (!_dataM) {
        _dataM = [NSMutableArray array];
    }
    return _dataM;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        AIRequestModel *model = [[AIRequestModel alloc]init];
        model.delegate = self;
        model.path = [NSString stringWithFormat:SUBJECT_URL,1];
        //开始请求数据
        [model startRequestInfo];
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        AIRequestModel *model = [[AIRequestModel alloc]init];
        model.delegate = self;
        model.path = [NSString stringWithFormat:SUBJECT_URL,1];
        //开始请求数据
        [model startRequestInfo];
        
    }
    return self;
}

#pragma mark -AIRequestModelDelegate
-(void)requestSendMessage:(NSData *)data andPath:(NSString *)path{
    NSArray *rootArray = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:nil];
    NSDictionary *itemDict = rootArray[self.indexPath.row];
    NSArray *appArray = itemDict[@"applications"];
    for (NSDictionary *dict in appArray) {
        AITopicSmallAppModel *smallModel = [AITopicSmallAppModel createTopicAppModelWithDict:dict];
        [self.dataM addObject:smallModel];
    }
    self.dataSource = self;
    [self reloadData];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataM.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AISmallCellView *cell = [[[NSBundle mainBundle]loadNibNamed:@"AISmallCellView" owner:nil options:nil]lastObject];
    cell.data = self.dataM[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 10;
}

/*-(NSInteger)numberOfRowsInSection:(NSInteger)section{
    return self.dataM.count;
}
-(UITableViewCell*)cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    static NSString *identifier = @"smallCell";
    AISmallCellView *cell = [[[NSBundle mainBundle]loadNibNamed:@"AISmallCellView" owner:nil options:nil]lastObject];
    cell.data = self.dataM[indexPath.row];
    return cell;
}*/



@end

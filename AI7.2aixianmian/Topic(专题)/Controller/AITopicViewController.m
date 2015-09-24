//
//  AITopicViewController.m
//  AI7.2aixianmian
//
//  Created by qianfeng on 15/9/23.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import "AITopicViewController.h"
#import "AIRequestModel.h"
#import "Header.h"
#import "UIImageView+AFNetworking.h"
#import "AIDetailViewController.h"
#import "MJRefresh.h"
#import "AIDefine.h"
#import "AITopicCellView.h"
@interface AITopicViewController ()<AIRequestModelDelegate,UITableViewDataSource,UITableViewDelegate>
/**
 *  当前页面
 */
@property(nonatomic,assign)NSInteger *currentPage;
@property(nonatomic,assign,getter=isLoading)BOOL loading;
@property(nonatomic,assign,getter=isRefrshing)BOOL refreshing;
@property(nonatomic,strong)AIRequestModel *requestModel;


@property(nonatomic,strong)UITableView *tableV;
@property(nonatomic,strong)NSMutableArray *dataSource;
@end

@implementation AITopicViewController

-(AIRequestModel *)requestModel{
    if (!_requestModel) {
        _requestModel = [[AIRequestModel alloc]init];
        _currentPage = 1;
        _requestModel.path = [NSString stringWithFormat:SUBJECT_URL,_currentPage];
        _requestModel.delegate = self;
    }
    return _requestModel;
}

-(NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化表格
    _tableV = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Mainsize.width, Mainsize.height) style:(UITableViewStylePlain)];
    _tableV.delegate = self;
    _tableV.dataSource = self;
    [self.view addSubview:_tableV];
    [self.requestModel startRequestInfo];
    [self refreshAndLoad];
}

#pragma mark-刷新加载
-(void)refreshAndLoad{
     [self.tableV addHeaderWithCallback:^{
         if (!self.isRefrshing) {
             self.refreshing = YES;
             if (self.dataSource.count > 0) {
                 [self.dataSource removeAllObjects];
             }
             [self.requestModel startRequestInfo];
             [self.tableV headerEndRefreshing];
             self.refreshing = NO;
             
             return ;
         }
     }];
    [self.tableV addFooterWithCallback:^{
        if (!self.isLoading) {
            self.loading = YES;
            /*if (self.dataSource.count > 0) {
                [self.dataSource removeAllObjects];
            }*/
            self.currentPage ++;
            self.requestModel.path = [NSString stringWithFormat:SUBJECT_URL,_currentPage];
            [self.requestModel startRequestInfo];
            [self.tableV footerEndRefreshing];
            self.loading = NO;
        }
        return ;
    }];
    
}

#pragma mark -AIRequestModelDelegate
-(void)requestSendMessage:(NSData *)data andPath:(NSString *)path{
    NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
    [self.dataSource addObjectsFromArray:array];
    [self.tableV reloadData];
}

#pragma mark -UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"topicCell";
    AITopicCellView *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"AITopicCellView" owner:nil options:nil]lastObject];
    }
    //为单元格添加内容
    cell.titleLabel.text = self.dataSource[indexPath.row][@"title"];
    [cell.bigImageV setImageWithURL:[NSURL URLWithString:self.dataSource[indexPath.row][@"img"]] placeholderImage:[UIImage imageNamed:@"topic_TopicImage_Default"]];
    [cell.smallImageV setImageWithURL:[NSURL URLWithString:self.dataSource[indexPath.row][@"desc_img"]] placeholderImage:[UIImage imageNamed:@"topic_TopicImage_Default"]];
    cell.detailText.text = self.dataSource[indexPath.row][@"desc"];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 308;
}

#pragma mark -UITableViewDelegate



@end

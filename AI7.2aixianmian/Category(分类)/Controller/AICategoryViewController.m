//
//  AICategoryViewController.m
//  AI7.2aixianmian
//
//  Created by qianfeng on 15/9/25.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import "AICategoryViewController.h"
#import "AIRequestModel.h"
#import "Header.h"
#import "AIDefine.h"
#import "AICategoryCellView.h"

@interface AICategoryViewController ()<UITableViewDelegate,UITableViewDataSource,AIRequestModelDelegate>
@property(nonatomic,strong)NSMutableArray *dataSource;
@property(nonatomic,strong)UITableView *tableV;
@end

@implementation AICategoryViewController


-(NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc]init];
    }
    return _dataSource;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //1初始化表格
    self.tableV = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Mainsize.width, Mainsize.height) style:(UITableViewStylePlain)];
    self.tableV.delegate = self;
    self.tableV.dataSource = self;
    [self.view addSubview:_tableV];
    
    self.navigationItem.title = @"分类界面";
    

    
    //2.初始化数据源
    NSString *dataPath = nil;
    
    switch (self.cateoryType) {
        case CategotyType_FREE:
            dataPath = SORTLIST_FREE_URL;
            break;
        case CategotyType_LIMIT:
            dataPath = SORTLIST_LIMITED_URL;
            break;
        case CategotyType_REDUCE:
            dataPath = SORTLIST_SALES_URL;
            break;
        default:
            break;
    }
    AIRequestModel *requstModel = [[AIRequestModel alloc]init
                                   ];
    requstModel.path = dataPath;
    requstModel.delegate = self;
    [requstModel startRequestInfo];
}

#pragma mark -AIRequestModelDelegate
-(void)requestSendMessage:(NSData *)data andPath:(NSString *)path{
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
    NSArray *array = dict[@"category"];
    [self.dataSource addObjectsFromArray:array];
    [self.tableV reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    AICategoryCellView *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[AICategoryCellView alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
    }
    //为单元格添加内容
    
    NSString *imageName = self.dataSource[indexPath.row][@"categoryName"];
    cell.titleLabel.text = imageName;
    if ([imageName isEqualToString:@"全部"]) {
        imageName = @"All";
    }
    NSString *fullImageName = [NSString stringWithFormat:@"category_%@.jpg",imageName];
    cell.iconImageV.image = [UIImage imageNamed:fullImageName];
    NSString *count = self.dataSource[indexPath.row][@"count"];
    NSString *lessenPrice = self.dataSource[indexPath.row][@"lessenPrice"];
    cell.detailLabel.text = [NSString stringWithFormat:@"共有%@款应用，其中降价的应用有%@款",count,lessenPrice];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //1获取categoryId 的值
    NSString *cateId = self.dataSource[indexPath.row][@"categoryId"];
    //2.
    if ([self.delegate respondsToSelector:@selector(categoryAppendCategoryIdMessage:)]) {
        [self.delegate categoryAppendCategoryIdMessage:cateId];
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        AILog(@"没有实现协议");
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
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

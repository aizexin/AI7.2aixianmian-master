//
//  XLRootViewController.m
//  iOS7.2爱限免
//
//  Created by MS on 15-9-23.
//  Copyright (c) 2015年 xuli. All rights reserved.
//

#import "AIRootViewController.h"
#import "AIBaseTableViewCell.h"
#import "MJRefresh.h"
#import "AIDetailViewController.h"
@interface AIRootViewController ()

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
    //1.为导航条添加按钮
    NSArray *array = @[@"分类",@"设置"];
    for (int i = 0; i < 2; i++) {
        
        UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        btn.frame = CGRectMake(0, 0, 44, 30);
        [btn setTitle:array[i] forState:(UIControlStateNormal)];
        if (i == 0) {
            [btn setBackgroundImage:[UIImage imageNamed:@"buttonbar_back"] forState:(UIControlStateNormal)];
        }else{
            [btn setBackgroundImage:[UIImage imageNamed:@"buttonbar_edit"] forState:(UIControlStateNormal)];
        }
        [btn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        [btn addTarget:self action:@selector(onClickBtn:) forControlEvents:(UIControlEventTouchUpInside)];
        btn.tag = i +1;
        if (1 == btn.tag) {
            self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
        }else{
            self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
        }
    }
    //2.创建表格
    _tableV = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Mainsize.width, Mainsize.height )];
    [self.view addSubview:_tableV];
    _tableV.delegate = self;
    _tableV.dataSource = self;
    _tableV.autoresizesSubviews = NO;
    //3.搜索框
    UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, Mainsize.width, 30)];
    searchBar.placeholder = @"60万应用供你选择";
    _tableV.tableHeaderView =searchBar;
    
 
}

#pragma mark -刷新加载
-(void)refreshAndLoad:(NSString*)path{
    //1.刷新
    [self.tableV addHeaderWithCallback:^{
        if (self.isRfeshing) {
            return ;
        }
        self.refeshing = YES;
        self.currentPage = 1;
        //重新拼接接口
        NSString *allPath = [NSString stringWithFormat:path,_currentPage];
        AIRequestModel *requestModel = [[AIRequestModel alloc]init];
        requestModel.path = allPath;
        requestModel.delegate = self;
        [requestModel startRequestInfo];
        _refeshing = NO;
        //隐藏刷新驶入
        [self.tableV headerEndRefreshing];
    }];
    //2.加载
    [self.tableV addFooterWithCallback:^{
        if (self.isLoading) {
            return ;
        }
        self.loading = YES;
        _currentPage ++;
        NSString *allPath = [NSString stringWithFormat:path,_currentPage];
        AIRequestModel *requestModel = [[AIRequestModel alloc]init];
        requestModel.path = allPath;
        requestModel.delegate = self;
        [requestModel startRequestInfo];
        _loading = NO;
        [self.tableV footerEndRefreshing];
    }];
}

#pragma mark -AIRequestModelDelegate
//只有设置代理的时候才调用协议中的方法
//由于三个子类请求的数据 对应的格式以及key值完全相同 所以才在这里请求数据
-(void)requestSendMessage:(NSData *)data andPath:(NSString *)path{
    
    
    if (_currentPage == 1) {
        [self.dataSource removeAllObjects];
    }
    //1.解析数据
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
    NSArray *array = dict[@"applications"];
    //3.将数组写入数据源
    [self.dataSource addObjectsFromArray:array];
    //4.刷新表格
    [self.tableV reloadData];
}

#pragma mark -点击事件
-(void)onClickBtn:(UIButton *)btn{
    
}

#pragma mark -UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    AIBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[AIBaseTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
    }
    //为单元格添加背景图片
    UIImageView *backImageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height)];
    UIImage *bgimage = nil;
    if (indexPath.row % 2== 0) {
        bgimage = [UIImage imageNamed:@"cate_list_bg1"];
    }else{
        bgimage = [UIImage imageNamed:@"cate_list_bg2"];
    }
    backImageV.image = bgimage;
    [cell setBackgroundView:backImageV];
    //为单元格添加内容
    NSDictionary *dict = nil;
    //判断数据源中是否有数据
    if (self.dataSource.count > 0) {
        dict = self.dataSource[indexPath.row];
        [cell showInfoFromRequest:dict andControllerName:self];
    }
    
//    cell.data = self.dataSource[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

#pragma mark -UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //选中的appid值
    NSString *appID = self.dataSource[indexPath.row][@"applicationId"];
    //appid传递给详细界面
    AIDetailViewController *detailVC = [[AIDetailViewController alloc]init];
    detailVC.applicationId = appID;
    [self.navigationController pushViewController:detailVC animated:YES];
}



@end

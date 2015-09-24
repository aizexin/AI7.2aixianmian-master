//
//  AILimitViewController.m
//  AI7.2aixianmian
//
//  Created by qianfeng on 15/9/23.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import "AILimitViewController.h"
#import "AIRequestModel.h"
#import "Header.h"
#import "AIFreeAppCellModel.h"
@interface AILimitViewController ()<AIRequestModelDelegate>
@property(nonatomic,strong)AIRequestModel *requestModel;;
@end

@implementation AILimitViewController

-(AIRequestModel *)requestModel{
    if (!_requestModel) {
        _requestModel = [[AIRequestModel alloc]init];
        _requestModel.path = LIMIT_URL;
    }
    return _requestModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.requestModel startRequestInfo];
}

#pragma mark -AIRequestModelDelegate
-(void)requestSendMessage:(NSData *)data andPath:(NSString *)path{
    if (self.dataSource.count > 0) {
        [self.dataSource removeAllObjects];
    }
#warning mark -准备解析数据
//    NSDictionary *responseObject =
//    NSArray *applications = responseObject[@"applications"];
//    for (NSDictionary *itemDict in applications) {
//        AIFreeAppCellModel *model = [AIFreeAppCellModel freeAppCellModelWithDict:itemDict];
//        [self.dataSource addObject:model];
//    }
//    [self.tableV reloadData];
}



@end

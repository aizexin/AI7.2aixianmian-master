//
//  AIFreeViewController.m
//  AI7.2aixianmian
//
//  Created by qianfeng on 15/9/23.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import "AIFreeViewController.h"

@interface AIFreeViewController ()
@property(nonatomic,strong)AIRequestModel *requestModel;
@end

@implementation AIFreeViewController

-(AIRequestModel *)requestModel{
    if (!_requestModel) {
        _requestModel = [[AIRequestModel alloc]init];
        _requestModel.path = [NSString stringWithFormat:FREE_URL,1];
        
        _requestModel.delegate = self;
    }
    return _requestModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.requestModel startRequestInfo];
    [self refreshAndLoad:FREE_URL];
    self.categoryType = CategotyType_FREE;
    //为了和匪类界面传递的category 进行拼接 对当前接口下的数据进行分类
    self.rootPath = FREE_URL;
}



@end

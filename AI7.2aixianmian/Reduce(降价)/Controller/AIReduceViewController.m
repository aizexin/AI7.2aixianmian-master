//
//  AIReduceViewController.m
//  AI7.2aixianmian
//
//  Created by qianfeng on 15/9/23.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import "AIReduceViewController.h"

@interface AIReduceViewController ()
@property(nonatomic,strong)AIRequestModel *requestModel;;
@end

@implementation AIReduceViewController

-(AIRequestModel *)requestModel{
    if (!_requestModel) {
        _requestModel = [[AIRequestModel alloc]init];
        _requestModel.path = [NSString stringWithFormat:SALES_URL,1];
        _requestModel.delegate = self;
    }
    return _requestModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
      [self.requestModel startRequestInfo];
    [self refreshAndLoad:SALES_URL];
}



@end

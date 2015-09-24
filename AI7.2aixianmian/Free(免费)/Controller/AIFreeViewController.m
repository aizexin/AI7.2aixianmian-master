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
}



@end

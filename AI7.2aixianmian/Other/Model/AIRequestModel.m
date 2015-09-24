//
//  XLRequestModel.m
//  iOS7.2爱限免
//
//  Created by MS on 15-9-23.
//  Copyright (c) 2015年 xuli. All rights reserved.
//

#import "AIRequestModel.h"
#import "MMProgressHUD.h"
#import "AFHTTPRequestOperationManager.h"

@implementation AIRequestModel

-(void)startRequestInfo
{
    //<1>创建请求操作管理者对象
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    //<2>关闭自动解析方法
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    //添加一个动态加载控件
    //1、设置样式
    [MMProgressHUD setPresentationStyle:MMProgressHUDPresentationStyleDrop];
    //2、设置标题
    [MMProgressHUD showDeterminateProgressWithTitle:nil status:@"正在加载😄"];
    
    //<3>开始请求数据（请求的数据是NSData类型）由于不确定解析以后的数据是使用数组存放还是字典存放 所以将解析功能关闭
    [manager GET:self.path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        //<4>将请求的数据反馈给视图控制器
        if([self.delegate respondsToSelector:@selector(requestSendMessage:andPath:)])
        {
            [self.delegate requestSendMessage:responseObject andPath:self.path];
        }
        else
        {
            NSLog(@"被动方没有实现协议中的方法");
        }
        
        //将动态加载控件移除
        [MMProgressHUD dismissWithSuccess:@"加载完成✨"];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error.description);
    }];
}
@end







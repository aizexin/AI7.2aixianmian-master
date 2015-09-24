//
//  XLRequestModel.h
//  iOS7.2爱限免
//
//  Created by MS on 15-9-23.
//  Copyright (c) 2015年 xuli. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AIRequestModelDelegate <NSObject>

//一个视图控制器上请求数据的接口可以不止一个 为了区分请求的是哪个接口的数据 需要反馈一个接口信息
-(void)requestSendMessage:(NSData *)data andPath:(NSString *)path;

@end


@interface AIRequestModel : NSObject

//工程的所有接口的数据请求都使用该类完成
@property (nonatomic,retain) NSString * path;

@property (nonatomic,assign) id<AIRequestModelDelegate> delegate;

//触发数据请求的方法
-(void)startRequestInfo;

@end

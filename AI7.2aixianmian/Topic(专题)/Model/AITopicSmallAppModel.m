//
//  AITopicSmallAppModel.m
//  AI7.2aixianmian
//
//  Created by qianfeng on 15/9/24.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import "AITopicSmallAppModel.h"

@implementation AITopicSmallAppModel
-(instancetype)initWithDict:(NSDictionary*)dict{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(instancetype)createTopicAppModelWithDict:(NSDictionary*)dict{
    return [[self alloc]initWithDict:dict];
}
@end

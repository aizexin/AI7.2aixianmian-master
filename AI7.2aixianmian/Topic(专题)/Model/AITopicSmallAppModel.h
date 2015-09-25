//
//  AITopicSmallAppModel.h
//  AI7.2aixianmian
//
//  Created by qianfeng on 15/9/24.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AITopicSmallAppModel : NSObject
/**
 *  appid
 */
@property(nonatomic ,copy)NSString *applicationId;
/**
 *  下载次数
 */
@property(nonatomic ,copy)NSString *downloads;
/**
 *  图标路径
 */
@property(nonatomic ,copy)NSString *iconUrl;
/**
 *  名字
 */
@property(nonatomic ,copy)NSString *name;
/**
 *  所有评级
 */
@property(nonatomic ,copy)NSString *ratingOverall;
/**
 *  星级
 */
@property(nonatomic ,copy)NSString *starOverall;
-(instancetype)initWithDict:(NSDictionary*)dict;
+(instancetype)createTopicAppModelWithDict:(NSDictionary*)dict;
@end












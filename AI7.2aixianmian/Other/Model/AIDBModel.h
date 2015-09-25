//
//  XLDBModel.h
//  iOS7.2爱限免
//
//  Created by MS on 15-9-23.
//  Copyright (c) 2015年 xuli. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AIAppModel;
@interface AIDBModel : NSObject

//创建数据库和表格
+(instancetype)shareDBModel;
//向表格中插入数据
-(void)insertAppModel:(AIAppModel*)appModel andType:(NSString*)type;

//判断当前应用在表格中是否存在该样式
-(BOOL)isExistsAppModelWithID:(NSString*)appID andType:(NSString*)type;

//获取相同type的所有应用
-(NSArray *)allAppWithType:(NSString *)type;
@end

//
//  XLDBModel.m
//  iOS7.2爱限免
//
//  Created by MS on 15-9-23.
//  Copyright (c) 2015年 xuli. All rights reserved.
//

#import "AIDBModel.h"
#import "FMDatabase.h"
#import "AIAppModel.h"
#import "AIDefine.h"
@interface AIDBModel ()
@property(nonatomic,strong)FMDatabase *fmdb;
@end
@implementation AIDBModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        //1.创建数据库
        NSString *path = [NSHomeDirectory() stringByAppendingString:@"/Documents/APPDB.db"];
        _fmdb = [[FMDatabase alloc]initWithPath:path];
        
        BOOL isOpen = [_fmdb open];
        if (isOpen) {
            //3创建表格
            NSString *sql = @"create table if not exists appTable(appID varchar(256),appName varchar(256),appImage varchar(256),appType varchar(256))";
            BOOL isSuccess = [_fmdb executeUpdate:sql];
            if (isSuccess) {
                AILog(@"创建表格成功");
            }else{
                AILog(@"创建失败%@",_fmdb.lastErrorMessage);
            }
        }else{
            AILog(@"%@",_fmdb.lastErrorMessage);
        }
        
    }
    return self;
}

//创建数据库和表格
+(instancetype)shareDBModel{
    static AIDBModel *model = nil;
    if (model == nil) {
        model = [[AIDBModel alloc]init];
    }
    return model;
}
//向表格中插入数据
-(void)insertAppModel:(AIAppModel*)appModel andType:(NSString*)type{
    NSString *sql = @"insert into appTable(appID,appName,appImage,appType) values(?,?,?,?)";
    BOOL isSuccess = [_fmdb executeUpdate:sql,appModel.appId,appModel.appName,appModel.appImage,type];
    if (isSuccess) {
        AILog(@"插入成功");
    }else{
        AILog(@"插入失败%@",_fmdb.lastErrorMessage);
    }
}

//判断当前应用在表格中是否存在该样式
-(BOOL)isExistsAppModelWithID:(NSString*)appID andType:(NSString*)type{
    NSString *sql = @"select * from appTable where appID = ? and appType = ?";
    FMResultSet *result = [_fmdb executeQuery:sql,appID,type];
    return [result next] ? YES:NO;
}

//获取相同type的所有应用
-(NSArray *)allAppWithType:(NSString *)type{
    NSString *sql = @"select * from appTable where appType = ?";
    NSMutableArray *arrayM = [NSMutableArray array];
    FMResultSet *reult = [_fmdb executeQuery:sql,type];
    while ([reult next]) {
        AIAppModel *model = [[AIAppModel alloc]init];
        model.appId = [reult stringForColumn:@"appID"];
        model.appName = [reult stringForColumn:@"appName"];
        model.appImage = [reult stringForColumn:@"appImage"];
        [arrayM addObject:model];
    }
    
    return arrayM;
}

@end

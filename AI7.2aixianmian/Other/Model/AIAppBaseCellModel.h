//
//  AIFreeAppCellModel.h
//  AIxianmain
//
//  Created by 艾泽鑫 on 15/9/22.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AIAppBaseCellModel : UIView{
    NSString *_description;
}

/**
 *  appid
 */
@property(nonatomic,copy)NSString *applicationId;
/**
 *  种类id
 */
@property(nonatomic,assign)NSNumber *categoryId;
/**
 *  种类名字
 */
@property(nonatomic,copy)NSString *categoryName;
/**
 *  现在的价格
 */
@property(nonatomic,copy)NSString *currentPrice;
/**
 *  描述
 */
//@property(nonatomic,copy)NSString *_description;
/**
 *  下载次数
 */
@property(nonatomic,copy)NSString *downloads;
/**
 *  最后时间
 */
@property(nonatomic,copy)NSString *expireDatetime;
/**
 *  喜欢数量
 */
@property(nonatomic,copy)NSString *favorites;
/**
 *  文件大小
 */
@property(nonatomic,copy)NSString *fileSize;
/**
 *  头像地址
 */
@property(nonatomic,copy)NSString *iconUrl;
/**
 *  ipa
 */
@property(nonatomic,copy)NSString *ipa;
/**
 *  itunes下载路径
 */
@property(nonatomic,copy)NSString *itunesUrl;
/**
 *  最后价格
 */
@property(nonatomic,copy)NSString *lastPrice;
/**
 *  应用名字
 */
@property(nonatomic,copy)NSString *name;
/**
 *  价格趋势
 */
@property(nonatomic,copy)NSString *priceTrend;
/**
 *  全部等级
 */
@property(nonatomic,copy)NSString *ratingOverall;
/**
 *  发布时间
 */
@property(nonatomic,copy)NSString *releaseDate;
/**
 *  发布说明
 */
@property(nonatomic,copy)NSString *releaseNotes;
/**
 *  分享次数
 */
@property(nonatomic,copy)NSString *shares;
/**
 *  slug
 */
@property(nonatomic,copy)NSString *slug;
/**
 *  当前评分
 */
@property(nonatomic,copy)NSString *starCurrent;
/**
 *  整体评分
 */
@property(nonatomic,copy)NSString *starOverall;
/**
 *  跟新时间
 */
@property(nonatomic,copy)NSString *updateDate;
/**
 *  版本
 */
@property(nonatomic,copy)NSString *version;

//---下面是服务器没有的数据
@property(nonatomic,copy)NSString *bgImageName;

-(instancetype)initWithDict:(NSDictionary*)dict;
+(instancetype)freeAppCellModelWithDict:(NSDictionary*)dict;
@end










//
//  AIFreeAppCellModel.m
//  AIxianmain
//
//  Created by 艾泽鑫 on 15/9/22.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import "AIAppBaseCellModel.h"

@implementation AIAppBaseCellModel


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithDict:(NSDictionary*)dict{
    self = [super init];
    if (self) {
//        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(instancetype)freeAppCellModelWithDict:(NSDictionary*)dict{
    return [[self alloc]initWithDict:dict];
}
@end

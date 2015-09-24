//
//  XLStarView.m
//  iOS7.2爱限免
//
//  Created by MS on 15-9-23.
//  Copyright (c) 2015年 xuli. All rights reserved.
//

#import "AIStarView.h"

@implementation AIStarView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //在初始化方法中创建UI
        [self createUI];
    }
    return self;
}
//【注意】图片视图被分割 添加在cell上 要想显示分割结果 创建UI的方法需要在initWithCoder:方法中再次调用
-(id)initWithCoder:(NSCoder *)aDecoder
{
    if(self = [super init])
    {
        [self createUI];
    }
    return self;
}
-(void)createUI
{
    backImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 65, 23)];
    backImageView.image = [UIImage imageNamed:@"StarsBackground.png"];
    [self addSubview:backImageView];
    
    foreImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 65, 23)];
    foreImageView.image = [UIImage imageNamed:@"StarsForeground.png"];
    
    //开启图片视图的分割模式
    foreImageView.clipsToBounds = YES;
    //设置图片视图的停靠方向
    foreImageView.contentMode = UIViewContentModeLeft;
    
    [self addSubview:foreImageView];
}
-(void)setStarLevel:(NSString *)level
{
    foreImageView.frame = CGRectMake(0, 0, backImageView.frame.size.width * ([level doubleValue] / 5), backImageView.frame.size.height);
}

@end

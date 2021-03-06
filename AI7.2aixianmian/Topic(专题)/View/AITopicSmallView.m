//
//  AITopicView.m
//  AI7.2aixianmian
//
//  Created by qianfeng on 15/9/24.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import "AITopicSmallView.h"
#import "AIStarView.h"
#import "AITopicSmallAppModel.h"
#import "UIImageView+AFNetworking.h"
@implementation AITopicSmallView



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _smallIconImagV = [[UIImageView alloc]initWithFrame:CGRectMake(2, 2, 45, 45)];
        [self addSubview:self.smallIconImagV];
        
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 2, 125, 15)];
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:_titleLabel];
        
        UIImageView *commentImageView = [[UIImageView alloc]initWithFrame:CGRectMake(55, 18, 14, 14)];
        commentImageView.image = [UIImage imageNamed:@"topic_Comment"];
        [self addSubview:commentImageView];
        
        UIImageView *downloadImageV = [[UIImageView alloc]initWithFrame:CGRectMake(113, 18, 14, 14)];
        downloadImageV.image = [UIImage imageNamed:@"topic_Download"];
        [self addSubview:downloadImageV];
        
        self.commentLabel = [[UILabel alloc]initWithFrame:CGRectMake(74, 14, 43, 21)];
        _commentLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:_commentLabel];
        
        self.downLoadLabel = [[UILabel alloc]initWithFrame:CGRectMake(132, 14, 43, 21)];
        _downLoadLabel.font = [UIFont systemFontOfSize:12 ];
        [self addSubview:_downLoadLabel];
        
        _startV = [[AIStarView alloc]initWithFrame:CGRectMake(55, 35, 90, 12)];
        [self addSubview:_startV];
    }
    return self;
}

-(void)setData:(AITopicSmallAppModel *)data{
    NSURL *iconUrl = [NSURL URLWithString:data.iconUrl];
    [_smallIconImagV setImageWithURL:iconUrl placeholderImage:[UIImage imageNamed:@"topic_TopicImage_Default"]];
    _titleLabel.text = data.name;
    _commentLabel.text = data.ratingOverall;
    _downLoadLabel.text = data.downloads;
    [_startV setStarLevel:data.starOverall];
}
@end

//
//  AISmallCellView.m
//  AI7.2aixianmian
//
//  Created by qianfeng on 15/9/24.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import "AISmallCellView.h"
#import "AIStarView.h"
#import "AITopicSmallAppModel.h"
#import "UIImageView+AFNetworking.h"
@implementation AISmallCellView

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setData:(AITopicSmallAppModel *)data{
    NSURL *iconUrl = [NSURL URLWithString:data.iconUrl];
    [_iconImageV setImageWithURL:iconUrl placeholderImage:[UIImage imageNamed:@"topic_TopicImage_Default"]];
    _nameLabel.text = data.name;
    [_reatBtn setImage:[UIImage imageNamed:@"topic_Comment"] forState:(UIControlStateNormal)];
    [_reatBtn setTitle:data.ratingOverall forState:(UIControlStateNormal)];
    [_downLoadBtn setImage:[UIImage imageNamed:@"topic_Download"] forState:(UIControlStateNormal)];
    [_downLoadBtn setTitle:data.downloads forState:(UIControlStateNormal)];
}

@end

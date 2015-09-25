//
//  AICategoryCellView.m
//  AI7.2aixianmian
//
//  Created by qianfeng on 15/9/25.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import "AICategoryCellView.h"

@implementation AICategoryCellView

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.iconImageV = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 60, 60)];
        [self.contentView addSubview:_iconImageV];
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(65, 0, self.frame.size.width - 65, 20)];
        [self.contentView addSubview:_titleLabel];
        self.detailLabel = [[UILabel alloc]initWithFrame:CGRectMake(65, 20, self.frame.size.width - 65, self.frame.size.height -20)];
        self.detailLabel.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_detailLabel];
        
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

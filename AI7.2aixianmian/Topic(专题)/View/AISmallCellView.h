//
//  AISmallCellView.h
//  AI7.2aixianmian
//
//  Created by qianfeng on 15/9/24.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AIStarView,AITopicSmallAppModel;

@interface AISmallCellView : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImageV;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIButton *reatBtn;
@property (weak, nonatomic) IBOutlet UIButton *downLoadBtn;
@property (weak, nonatomic) IBOutlet AIStarView *starV;

@property(nonatomic,strong)AITopicSmallAppModel *data;
@end

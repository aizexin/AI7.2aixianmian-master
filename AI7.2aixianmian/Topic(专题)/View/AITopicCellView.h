//
//  AITopicCellView.h
//  AI7.2aixianmian
//
//  Created by qianfeng on 15/9/24.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AIAppListView.h"
//@class AISmallTableView;

@interface AITopicCellView : UITableViewCell
/**
 *  标题
 */
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
/**
 *  大图
 */
@property (weak, nonatomic) IBOutlet UIImageView *bigImageV;
/**
 *  小图
 */
@property (weak, nonatomic) IBOutlet UIImageView *smallImageV;
/**
 *  详情
 */
@property (weak, nonatomic) IBOutlet UITextView *detailText;
//@property (weak, nonatomic) IBOutlet AISmallTableView *appListTable;
//@property (weak, nonatomic) IBOutlet AIAppListView *appList;


@end

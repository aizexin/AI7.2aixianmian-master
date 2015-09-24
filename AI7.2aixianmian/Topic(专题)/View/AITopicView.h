//
//  AITopicView.h
//  AI7.2aixianmian
//
//  Created by qianfeng on 15/9/24.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AIStarView;
@interface AITopicView : UIView

@property(nonatomic,strong)UIImageView *smallIconImagV;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *commentLabel;
@property(nonatomic,strong)UILabel *downLoadLabel;
@property(nonatomic,strong)AIStarView *startV;
@end

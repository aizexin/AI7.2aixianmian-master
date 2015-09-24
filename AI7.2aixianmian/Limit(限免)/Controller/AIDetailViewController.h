//
//  AIDetailViewController.h
//  AI7.2aixianmian
//
//  Created by qianfeng on 15/9/24.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AIDetailViewController : UIViewController
@property(nonatomic ,copy)NSString *applicationId;

@property(nonatomic,strong)UIImageView *iconImageV;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *lastPriceLabel;

@property(nonatomic,strong)UILabel *stateLabel;
@property(nonatomic,strong)UILabel *appKindLabel;
@property(nonatomic,strong)UILabel *appScoreLabel;
@property(nonatomic,strong)UIScrollView *scroll;
@property(nonatomic,strong)UITextView *detailText;
@end

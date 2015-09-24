//
//  XLCustomTableViewCell.h
//  iOS7.2爱限免
//
//  Created by MS on 15-9-23.
//  Copyright (c) 2015年 xuli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AIStarView.h"
#import "AIAppBaseCellModel.h"
@interface AIBaseTableViewCell : UITableViewCell

@property (nonatomic,strong) UIImageView * iconImageView;
@property (nonatomic,retain) UILabel * titleLbl;
@property (nonatomic,retain) UILabel * timeLbl;
@property (nonatomic,retain) UILabel * priceLbl;
@property (nonatomic,retain) UILabel * kindLbl;
@property (nonatomic,retain) AIStarView * starView;
@property (nonatomic,retain) UILabel * infoLbl;


@property(nonatomic,strong)AIAppBaseCellModel *data;
//将model层上的数据显示出来
-(void)showInfoFromRequest:(NSDictionary *)dic andControllerName:(id)controller;


@end

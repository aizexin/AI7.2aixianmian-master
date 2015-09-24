//
//  XLCustomTableViewCell.m
//  iOS7.2爱限免
//
//  Created by MS on 15-9-23.
//  Copyright (c) 2015年 xuli. All rights reserved.
//

#import "AIBaseTableViewCell.h"
#import "AILimitViewController.h"
#import "AIFreeAppCellModel.h"
#import "AIReduceViewController.h"
#import "UIImageView+AFNetworking.h"
@implementation AIBaseTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(14, 10, 60, 60)];
        [self.contentView addSubview:self.iconImageView];
        
        self.titleLbl = [[UILabel alloc]initWithFrame:CGRectMake(81, 5, 229, 21)];
        [self.contentView addSubview:self.titleLbl];
        
        self.timeLbl = [[UILabel alloc]initWithFrame:CGRectMake(82, 29, 170, 21)];
        self.timeLbl.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:self.timeLbl];
        
        self.priceLbl = [[UILabel alloc]initWithFrame:CGRectMake(246, 21, 54, 21)];
        self.priceLbl.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:self.priceLbl];
        
        UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, self.priceLbl.frame.size.height / 2, self.priceLbl.frame.size.width, 1)];
        view.backgroundColor = [UIColor blackColor];
        [self.priceLbl addSubview:view];
        
        self.kindLbl = [[UILabel alloc]initWithFrame:CGRectMake(246, 49, 54, 21)];
        self.kindLbl.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:self.kindLbl];
        
        self.starView = [[AIStarView alloc]initWithFrame:CGRectMake(82, 49, 117, 21)];
        [self.contentView addSubview:self.starView];
        
        self.infoLbl = [[UILabel alloc]initWithFrame:CGRectMake(20, 72, 245, 21)];
        self.infoLbl.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:self.infoLbl];
        
    }
    return self;
}

#pragma mark -显示数据
-(void)showInfoFromRequest:(NSDictionary *)dic andControllerName:(id)controller{
    //如果是降价接口显示的是价钱  否者显示的是时间
    if ([controller isKindOfClass:[AIReduceViewController class]]) {
        NSString *price = dic[@"currentPrice"];
        self.timeLbl.text = [NSString stringWithFormat:@"现价:￥%@",price];
    }else{
        NSString *time = dic[@"expireDatetime"];
        //判断时间是否为空null
        if ([time isKindOfClass:[NSNull class]]) {
            self.timeLbl.text = @"剩余00:00:00";
        }else{
            //判断时间的样式
            NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
            if ([controller isKindOfClass:[AILimitViewController class]]) {
                formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss.0";
            }else{
                formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
            }
            //将结束时间转换为NSdate
            NSDate *endTime = [formatter dateFromString:time ];
            //获取结束时间距离现在还有多少时间  时间以秒为单位
            NSTimeInterval timeInterval = [endTime timeIntervalSinceNow];
           //转化为时分秒
            NSInteger HH = (NSInteger)timeInterval / 3600;
            NSInteger MM = (NSInteger)timeInterval / 60 %60;
            NSInteger SS = (NSInteger)timeInterval % 60;
            if (HH < 0 || MM < 0 || SS < 0) {
                self.timeLbl.text = @"剩余00:00:00";
            }else{
                self.timeLbl.text = [NSString stringWithFormat:@"剩余:%.2ld:%.2ld:%.2ld",HH,MM,SS];
            }
        }
    }
    //头像
    NSURL *iconImageUrl = [NSURL URLWithString:dic[@"iconUrl"]];
    [_iconImageView setImageWithURL:iconImageUrl placeholderImage:[UIImage imageNamed:@"appproduct_appdefault"]];
    //名字
    _titleLbl.text = dic[@"name"];
    //剩余时间
//    _timeLbl.text = dic[@"expireDatetime"];
    //价格
    _priceLbl.text = [NSString stringWithFormat:@"￥%@",dic[@"lastPrice"]];
    self.priceLbl.textAlignment = NSTextAlignmentCenter;
    //种类
    _kindLbl.text = dic[@"categoryName"];
    //分享
    NSString *share = [NSString stringWithFormat:@"分享：%@次",dic[@"shares"]];
    //收藏
    NSString *collenction = [NSString stringWithFormat:@"收藏%@次",dic[@"favorites"]];
    //下载
    NSString *downloads = [NSString stringWithFormat:@"下载%@次",dic[@"downloads"]];
    _infoLbl.text = [NSString stringWithFormat:@"%@%@%@",share,collenction,downloads];
    NSString *starLevel = dic[@"starCurrent"];
    [_starView setStarLevel:starLevel];
}
-(void)setData:(AIAppBaseCellModel *)data{
    _data = data;
   /* //星级图片
    float startNum = [data.starCurrent floatValue];
    UIImage *startImage = [UIImage imageNamed:@"StarsForeground"];
    CGRect rect = CGRectMake(0, 0, 65 * 0.2 *startNum, 23);
    // 剪切默认状态的图片
    CGImageRef norCGImageRef= CGImageCreateWithImageInRect(startImage.CGImage, rect);
     将切割好的图片转换为uiimage设置为按钮的背景
        [btn setImage:[UIImage imageWithCGImage:norCGImageRef]  forState:UIControlStateNormal];
    _appStartImageV.image = [[UIImage imageWithCGImage:norCGImageRef]imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    //分享
    _appShareNumLabel.text = [NSString stringWithFormat:@"分享：%@次",data.shares];
    //收藏
    _appCollectNumLabel.text = [NSString stringWithFormat:@"收藏%@次",data.favorites];
    //下载
    _appDownNumLabel.text = [NSString stringWithFormat:@"下载%@次",data.downloads];*/
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

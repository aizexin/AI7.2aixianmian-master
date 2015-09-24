//
//  XLCustomTableViewCell.m
//  iOS7.2爱限免
//
//  Created by MS on 15-9-23.
//  Copyright (c) 2015年 xuli. All rights reserved.
//

#import "AIBaseTableViewCell.h"
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
-(void)setData:(AIAppBaseCellModel *)data{
#warning fuzhi
    _data = data;
    //头像
    NSURL *iconImageUrl = [NSURL URLWithString:data.iconUrl];
    [_iconImageView setImageWithURL:iconImageUrl placeholderImage:[UIImage imageNamed:@"appproduct_appdefault"]];
    //名字
    _titleLbl.text = data.name;
    //剩余时间
    _timeLbl.text = data.expireDatetime;
    //价格
    _priceLbl.text = data.lastPrice;
    //种类
    _kindLbl.text = data.categoryName;
    //星级图片
    float startNum = [data.starCurrent floatValue];
    UIImage *startImage = [UIImage imageNamed:@"StarsForeground"];
    CGRect rect = CGRectMake(0, 0, 65 * 0.2 *startNum, 23);
    // 剪切默认状态的图片
    CGImageRef norCGImageRef= CGImageCreateWithImageInRect(startImage.CGImage, rect);
    // 将切割好的图片转换为uiimage设置为按钮的背景
    //    [btn setImage:[UIImage imageWithCGImage:norCGImageRef]  forState:UIControlStateNormal];
//    _appStartImageV.image = [[UIImage imageWithCGImage:norCGImageRef]imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
//    //分享
//    _appShareNumLabel.text = [NSString stringWithFormat:@"分享：%@次",data.shares];
//    //收藏
//    _appCollectNumLabel.text = [NSString stringWithFormat:@"收藏%@次",data.favorites];
//    //下载
//    _appDownNumLabel.text = [NSString stringWithFormat:@"下载%@次",data.downloads];
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

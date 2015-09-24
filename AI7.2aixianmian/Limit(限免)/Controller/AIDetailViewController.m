//
//  AIDetailViewController.m
//  AI7.2aixianmian
//
//  Created by qianfeng on 15/9/24.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import "AIDetailViewController.h"
#import "AIRequestModel.h"
#import "Header.h"
#import "UIImageView+AFNetworking.h"
@interface AIDetailViewController ()<AIRequestModelDelegate>

@end

@implementation AIDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    [self requestDeailInfo];
    [self.view setBackgroundColor:[UIColor whiteColor]];
}
#pragma mark -请求数据
-(void)requestDeailInfo{
    //当前界面存在两个数据的接口，所以要创建两个请求对象
    //1.请求详细信息的数据
    AIRequestModel *requsetModel1 = [[AIRequestModel alloc]init];
    requsetModel1.path = [NSString stringWithFormat:DETAIL_URL,self.applicationId];
    requsetModel1.delegate = self;
    [requsetModel1 startRequestInfo];
    //2.请求周边人使用的应用信息
    AIRequestModel *requestModel2 = [[AIRequestModel alloc]init];
    requestModel2.delegate = self;
    requestModel2.path = RECOMMEND_URL;
    [requestModel2 startRequestInfo];
    
}

#pragma mark -AIRequestModelDelegate
-(void)requestSendMessage:(NSData *)data andPath:(NSString *)path{
    //1.解析数据s
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
    //2.判断接口信息
    if (![path isEqualToString:RECOMMEND_URL]) {
        //3.获取app的title值
        NSString *appTitle = dict[@"name"];
        _titleLabel.text = appTitle;
        //4.app的图片信息
        NSString *appImage = dict[@"iconUrl"];
        [self.iconImageV setImageWithURL:[NSURL URLWithString:appImage] placeholderImage:[UIImage imageNamed:@"icon"]];
        _lastPriceLabel.text = dict[@"lastPrice"];
        _appKindLabel.text = dict[@"categoryName"];
        _appScoreLabel.text = dict[@"starCurrent"];
        NSString *state = dict[@"priceTrend"];
        if ([state isEqualToString:@"limited"] || [state isEqualToString:@"free"]) {
            self.stateLabel.text = @"免费";
        }else{
            self.stateLabel.text = @"收费";
        }
        self.detailText.text = dict[@"description_long"];
        //为滚动视图添加图片视图
        //获取小图
        NSArray *photos = dict[@"photos"];
        for (int i = 0; i < photos.count; i++) {
            UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(65 * i, 0, 55, 80)];
            [imageV setImageWithURL:[NSURL URLWithString:photos[i][@"smallUrl"]] placeholderImage:[UIImage imageNamed:@"topic_TopicImage_Default"]];
            [self.scroll addSubview:imageV];
        }
        self.scroll.contentSize = CGSizeMake(65 * photos.count, 80);
        self.scroll.contentOffset = CGPointMake(0, 0);
    }else{
        NSArray *smallArray = dict[@"applications"];
        UIScrollView *smallScroll = (UIScrollView *)[self.view viewWithTag:998];
        for (int i = 0; i < smallArray.count; i++) {
            UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(55 * i, 0, 47, 47)];
            NSString *roundImageName = smallArray[i][@"iconUrl"];
            [imageV setImageWithURL:[NSURL URLWithString:roundImageName] placeholderImage:[UIImage imageNamed:@"topic_TopicImage_Default"]];
            //获取applicationID的值
            NSString *appID = smallArray[i][@"applicationId"];
            imageV.tag = [appID integerValue];
            
            //为图片视图添加点击事件
            imageV.userInteractionEnabled = YES;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onClickImage:)];
            [imageV addGestureRecognizer:tap];
            [smallScroll addSubview:imageV];
        }
        smallScroll.contentSize = CGSizeMake(smallArray.count *  55, 47);
    }
}


#pragma mark -创建UI
-(void)createUI{
    UIImageView *backImageV =[[ UIImageView alloc]initWithFrame:CGRectMake(10, 0, 301, 284)];
    backImageV.image = [UIImage imageNamed:@"appdetail_background"];
    [self.view addSubview:backImageV];
    
    UIImageView *smallImageV = [[UIImageView alloc]initWithFrame:CGRectMake(10, 284, 301, 103)];
    smallImageV.image = [UIImage imageNamed:@"appdetail_recommend"];
    [self.view addSubview:smallImageV];
    
    _iconImageV = [[UIImageView alloc]initWithFrame:CGRectMake(26, 10, 57, 57)];
    [self.view addSubview:_iconImageV];
    
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(91, 10, 250, 21)];
    _titleLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:self.titleLabel];
    
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(91, 28, 40, 21)];
    label1.text = @"原价";
    label1.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:label1];
    
    _lastPriceLabel = [[UILabel alloc]initWithFrame:CGRectMake(131, 28, 43, 21)];
    _lastPriceLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:_lastPriceLabel];
    
    self.stateLabel = [[UILabel alloc]initWithFrame:CGRectMake(184, 25, 42, 30)];
    _stateLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:_stateLabel];
    
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(91, 46, 42, 21)];
    label2.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:label2];
    label2.text = @"类型:";
    
    _appKindLabel = [[UILabel alloc]initWithFrame:CGRectMake(133, 46, 50, 21)];
    _appKindLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:_appKindLabel ];
    
    UILabel *label3 = [[UILabel alloc]initWithFrame:CGRectMake(190, 46, 50, 21)];
    label3.text = @"评分:";
    label3.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:label3];
    
    self.appScoreLabel = [[UILabel alloc]initWithFrame:CGRectMake(230, 46, 34, 21)];
    self.appScoreLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:_appScoreLabel];
    
    self.detailText = [[UITextView alloc]initWithFrame:CGRectMake(14, 210, 293, 63)];
    _detailText.editable = NO;
    self.detailText.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:_detailText];
    
    //滚动视图
    _scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(14, 122, 290, 80)];
    _scroll.bounces = NO;
    _scroll.showsVerticalScrollIndicator = NO;
    _scroll.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_scroll];
    
    UIScrollView *smallScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(10, 315, 300, 103)];
    smallScroll.bounces = NO;
    smallScroll.showsHorizontalScrollIndicator = NO;
    smallScroll.showsVerticalScrollIndicator = NO;
    //添加tag=998
    smallScroll.tag = 998;
    [self.view addSubview:smallScroll];
    
    NSArray *array = @[@"分享",@"收藏",@"下载"];
    NSArray *imageArray = @[@"Detail_btn_left",@"Detail_btn_middle",@"Detail_btn_right"];
    for (int i = 0; i < 3; i++) {
        UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        btn.frame = CGRectMake(10 + 100 * i, 80, 100, 42);
        [btn setTitle:array[i] forState:(UIControlStateNormal)];
        [btn setBackgroundImage:[UIImage imageNamed:imageArray[i]] forState:(UIControlStateNormal)];
        [btn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        btn.tag = i + 1;
        [btn addTarget:self action:@selector(onClickBtn:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.view addSubview:btn];
    }
    
}

#pragma mark -按钮点击事件
-(void)onClickBtn:(UIButton*)btn{
    
}
-(void)onClickImage:(UITapGestureRecognizer*)tap{
    //获取点击的图片视图s
    UIImageView *imageV = (UIImageView*)tap.view;
    //tag值就是applicationId的值
    NSInteger indexTag = imageV.tag;
    AIDetailViewController *detailVC = [[AIDetailViewController alloc]init];
    detailVC.applicationId = [NSString stringWithFormat:@"%ld",indexTag];
    [self.navigationController pushViewController:detailVC animated:YES];
}


@end













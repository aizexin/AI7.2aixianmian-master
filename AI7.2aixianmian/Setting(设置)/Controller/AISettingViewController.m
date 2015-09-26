//
//  AISettingViewController.m
//  AI7.2aixianmian
//
//  Created by qianfeng on 15/9/25.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import "AISettingViewController.h"
#import "AIDefine.h"
#import "AIDownLoadViewController.h"
@interface AISettingViewController ()

@end

@implementation AISettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray * imageArr = @[@"account_candou.png",@"account_collect.png",@"account_comment.png",@"account_download.png",@"account_favorite.png",@"account_help.png",@"account_setting.png",@"account_user.png"];
    NSArray * titleArr = @[@"我的蚕豆",@"我的收藏",@"我的评论",@"我的下载",@"我的关注",@"帮助",@"我的设置",@"我的账户"];
    float wSpace = (Mainsize.width - 3 * 57) * 0.25;
    float hSpace = (Mainsize.height - 3* 57 - 49 -64) * 0.25;
    for (int i = 0; i < titleArr.count; i++) {
        UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        btn.tag = i+1;
        btn.frame = CGRectMake(wSpace + (wSpace + 57)*(i % 3), hSpace + (hSpace + 57) * (i / 3), 57,57);
        [btn setImage:[UIImage imageNamed:imageArr[i]] forState:(UIControlStateNormal)];
        [btn addTarget:self action:@selector(onClickBtn:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.view addSubview:btn];
        
        UILabel *labe = [[UILabel alloc]initWithFrame:CGRectMake(wSpace + (wSpace + 57)*(i%3), hSpace + (hSpace+57)*(i/3)+57, 65, 30)];
        labe.text = titleArr[i];
        [labe setTextAlignment:(NSTextAlignmentCenter)];
        labe.font = [UIFont systemFontOfSize:12];
        [self.view addSubview:labe];
    }
    self.view.backgroundColor = [UIColor colorWithRed:266/255.0 green:266/255.0 blue:266/255.0 alpha:1];
    self.navigationItem.title = @"设置界面";
}
#pragma mark -按钮点击事件
-(void)onClickBtn:(UIButton*)btn{
    if (btn.tag == 4) {
        AIDownLoadViewController *downLoadVC = [[AIDownLoadViewController alloc]init];
        [self.navigationController pushViewController:downLoadVC animated:YES];
    }
}


@end

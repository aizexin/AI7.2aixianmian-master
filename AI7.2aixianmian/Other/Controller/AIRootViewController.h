//
//  XLRootViewController.h
//  iOS7.2爱限免
//
//  Created by MS on 15-9-23.
//  Copyright (c) 2015年 xuli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AIRequestModel.h"
#import "AIDefine.h"
#import "Header.h"
@interface AIRootViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,AIRequestModelDelegate>
@property(nonatomic,strong)UITableView *tableV;
@property(nonatomic,strong)NSMutableArray *dataSource;
@property(nonatomic,assign,getter= isRfeshing)BOOL refeshing;//下拉刷新
@property(nonatomic,assign,getter=isLoading)BOOL loading;//加载
@property(nonatomic,assign)NSInteger *currentPage;
/**
 *  刷新加载
 */
-(void)refreshAndLoad:(NSString*)path;

@end

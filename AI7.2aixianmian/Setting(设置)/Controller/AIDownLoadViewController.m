//
//  AIDownLoadViewController.m
//  AI7.2aixianmian
//
//  Created by qianfeng on 15/9/26.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import "AIDownLoadViewController.h"
#import "AIDBModel.h"
#import "AIAppModel.h"
#import "UIImageView+AFNetworking.h"
#import "AIDetailViewController.h"
#import "AIUICollectionViewCell.h"
#import "AIDefine.h"
@interface AIDownLoadViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)NSMutableArray *dataSource;
@property(nonatomic,strong)UICollectionView *collectionV;
@end
static NSString *identifier = @"cell";
@implementation AIDownLoadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1
    UICollectionViewFlowLayout *layoutFolw = [[UICollectionViewFlowLayout alloc]init];
    [layoutFolw setScrollDirection:(UICollectionViewScrollDirectionVertical)];
    layoutFolw.minimumLineSpacing = 3;
    layoutFolw.minimumInteritemSpacing = 0;
    //2.
    _collectionV = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, Mainsize.width, Mainsize.height - 49) collectionViewLayout:layoutFolw];
    _collectionV.delegate = self;
    _collectionV.dataSource = self;
    [self.view addSubview:_collectionV];
    [_collectionV setBackgroundColor:[UIColor whiteColor]];
    //3.
    [_collectionV registerNib:[UINib nibWithNibName:@"AIUICollectionViewCell" bundle:nil] forCellWithReuseIdentifier:identifier];
    //4.初始化数据源
    _dataSource = [[NSMutableArray alloc]init];
    AIDBModel *dbModel = [AIDBModel shareDBModel];
    NSArray *array = [dbModel allAppWithType:@"downLoad"];
    [_dataSource addObjectsFromArray:array];
}


#pragma mark -UICollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataSource.count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    AIUICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    AIAppModel *appModel = self.dataSource[indexPath.row];
    [cell.appImageV setImageWithURL:[NSURL URLWithString:appModel.appImage]];
    cell.appTitleLabel.text = appModel.appName;
    return cell;
}
#pragma mark -UICollectionViewDelegateFlowLayout
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(100, 100);
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}


#pragma mark -UICollectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSString *appId = [self.dataSource[indexPath.item]appId];
    //跳转到详细界面
    AIDetailViewController *detailVC = [[AIDetailViewController alloc]init];
    detailVC.applicationId = appId;
    [self.navigationController pushViewController:detailVC animated:YES];
}



@end

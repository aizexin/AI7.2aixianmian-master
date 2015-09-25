//
//  AICategoryViewController.h
//  AI7.2aixianmian
//
//  Created by qianfeng on 15/9/25.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import <UIKit/UIKit.h>

//定义分类信息的状态(降价分类、免费、限免)
typedef enum {
    CategotyType_LIMIT,CategotyType_FREE,CategotyType_REDUCE
}CategortyType;


//设置协议 向（限免、免费、降价）界面传递categoryId的值
@protocol AICategoryViewControllerDelegate <NSObject>

-(void)categoryAppendCategoryIdMessage:(NSString*)message;

@end

@interface AICategoryViewController : UIViewController


@property(nonatomic,assign)CategortyType cateoryType;
@property(nonatomic,weak)id<AICategoryViewControllerDelegate>        delegate;
@end

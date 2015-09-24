//
//  XLStarView.h
//  iOS7.2爱限免
//
//  Created by MS on 15-9-23.
//  Copyright (c) 2015年 xuli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AIStarView : UIView
{
    UIImageView * foreImageView;//前面黄色✨
    UIImageView * backImageView;//后面白色星星
}

//设置星级数
-(void)setStarLevel:(NSString *)level;

@end

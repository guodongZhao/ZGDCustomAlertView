//
//  ShopCustomAlertView.h
//  ShopCustomAlertView
//
//  Created by 赵国栋 on 17/2/16.
//  Copyright © 2017年 . All rights reserved.
//  https://github.com/guodongZhao/ZGDCustomAlertView.git
//

#import <UIKit/UIKit.h>

@protocol ZGDCustomAlertViewDelegate <NSObject>

@required
// 左侧按钮回调
- (void)ShopCustomAlertViewAction_LeftButton:(UIButton *)leftButton;
// 右侧按钮回调
- (void)ShopCustomAlertViewAction_RightButton:(UIButton *)rightButton;

@end

@interface ZGDCustomAlertView : UIView

@property (nonatomic, weak) id<ZGDCustomAlertViewDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame AndLeftButtonTitle:(NSString *)leftButtonTitle AndRightButtonTitle:(NSString *)rightButtonTitle AndCenterText:(NSString *)centerText;



@end

//
//  ShopCustomAlertView.m
//  ZGDCustomAlertView
//
//  Created by 赵国栋 on 17/2/16.
//  Copyright © 2017年 . All rights reserved.
//  https://github.com/guodongZhao/ZGDCustomAlertView.git
//

#import "ZGDCustomAlertView.h"

@interface ZGDCustomAlertView ()
{
    // 设置属性  (按钮及中部标题)
    NSString *ZGD_leftButtonTitle;
    NSString *ZGD_rightButtonTitle;
    NSString *ZGD_centerText;
    
}

// 底部蒙版
@property (nonatomic, strong) UIView *ZGD_MainBackGroundView;
// 提示框蒙版
@property (nonatomic, strong) UIView *ZGD_AlertBackGroundView;
// 确认按钮
@property (nonatomic, strong) UIButton *LeftButton;
// 取消按钮
@property (nonatomic, strong) UIButton *RightButton;
// 文本显示框
@property (nonatomic, strong) UITextView *TitleView;


@end

@implementation ZGDCustomAlertView

#pragma mark -
#pragma mark init methods
- (UIView *)ZGD_MainBackGroundView{
    if (!_ZGD_MainBackGroundView) {
        _ZGD_MainBackGroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _ZGD_MainBackGroundView.backgroundColor = [UIColor lightGrayColor];
        _ZGD_MainBackGroundView.alpha = 0.5f;
    }
    return _ZGD_MainBackGroundView;
}
- (UIView *)ZGD_AlertBackGroundView{
    if (!_ZGD_AlertBackGroundView) {
        _ZGD_AlertBackGroundView = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2 - 125, SCREEN_HEIGHT/2 - 50, 250, 100)];
        _ZGD_AlertBackGroundView.backgroundColor = [UIColor whiteColor];
        _ZGD_AlertBackGroundView.layer.cornerRadius = 10.f;
        _ZGD_AlertBackGroundView.layer.masksToBounds = YES;
        _ZGD_AlertBackGroundView.userInteractionEnabled = YES;
    }
    return _ZGD_AlertBackGroundView;
}
- (UITextView *)TitleView{
    if (!_TitleView) {
        _TitleView = [UITextView new];
        _TitleView.frame = CGRectMake(10, 10, 230, 40);
        _TitleView.font = [UIFont systemFontOfSize:15];
        _TitleView.textAlignment = NSTextAlignmentCenter;
        _TitleView.editable = NO;
        _TitleView.text = ZGD_centerText;
        _TitleView.tintColor = [UIColor blackColor];
    }
    return _TitleView;
}

- (UIButton *)LeftButton{
    if (!_LeftButton) {
        _LeftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _LeftButton.frame = CGRectMake(0, 60, 125, 40);
        _LeftButton.backgroundColor = [UIColor greenColor];
        [_LeftButton setTitle:ZGD_leftButtonTitle forState:UIControlStateNormal];
        _LeftButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        _LeftButton.tintColor = [UIColor whiteColor];
        
        [_LeftButton addTarget:self action:@selector(ActionLeftButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _LeftButton;
}
- (UIButton *)RightButton{
    if (!_RightButton) {
        _RightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _RightButton.frame = CGRectMake(125, 60, 125, 40);
        _RightButton.backgroundColor = [UIColor lightGrayColor];
        [_RightButton setTitle:ZGD_rightButtonTitle forState:UIControlStateNormal];
        _RightButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        _RightButton.tintColor = [UIColor whiteColor];
        
        [_RightButton addTarget:self action:@selector(ActionRightButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _RightButton;
}


#pragma mark -
#pragma mark lifecycle
- (instancetype)initWithFrame:(CGRect)frame AndLeftButtonTitle:(NSString *)leftButtonTitle AndRightButtonTitle:(NSString *)rightButtonTitle AndCenterText:(NSString *)centerText
{
    
    if (self = [super initWithFrame:frame]) {
        
        ZGD_leftButtonTitle = leftButtonTitle;
        ZGD_rightButtonTitle = rightButtonTitle;
        ZGD_centerText = centerText;
        
        // 添加中部标题行
        [self.ZGD_AlertBackGroundView addSubview:self.TitleView];
        // 添加左侧按钮
        [self.ZGD_AlertBackGroundView addSubview:self.LeftButton];
        // 添加右侧按钮
        [self.ZGD_AlertBackGroundView addSubview:self.RightButton];
        
        
        UIWindow *backWindow = [[UIApplication sharedApplication].windows lastObject];
        [backWindow addSubview:self];
        // 添加底部蒙版
        [backWindow addSubview:self.ZGD_MainBackGroundView];
        // 添加提示框
        [backWindow addSubview:self.ZGD_AlertBackGroundView];

    }
    return self;
    

}

#pragma mark -
#pragma mark ActionLeftButton  
- (void)ActionLeftButton:(UIButton *)leftButton{
    if ([self.delegate respondsToSelector:@selector(ShopCustomAlertViewAction_LeftButton:)]) {
        [self.delegate ShopCustomAlertViewAction_LeftButton:leftButton];
    }
    
    // 注销所有页面
    [self.ZGD_AlertBackGroundView removeFromSuperview];
    [self.ZGD_MainBackGroundView removeFromSuperview];
    [self removeFromSuperview];
}
#pragma mark -
#pragma mark ActionRightButton
- (void)ActionRightButton:(UIButton *)RightButton{
    if ([self.delegate respondsToSelector:@selector(ShopCustomAlertViewAction_RightButton:)]) {
        [self.delegate ShopCustomAlertViewAction_RightButton:RightButton];
    }
    // 注销所有页面
    [self.ZGD_AlertBackGroundView removeFromSuperview];
    [self.ZGD_MainBackGroundView removeFromSuperview];
    [self removeFromSuperview];
}



@end

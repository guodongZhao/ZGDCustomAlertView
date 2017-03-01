//
//  ViewController.m
//  ZGDCustomAlertView-Text
//
//  Created by 赵国栋 on 17/2/27.
//  Copyright © 2017年 赵国栋. All rights reserved.
//  https://github.com/guodongZhao/ZGDCustomAlertView.git
//

#import "ViewController.h"
#import "ZGDCustomAlertView.h"
@interface ViewController ()<ZGDCustomAlertViewDelegate>

@end

@implementation ViewController
#pragma mark -
#pragma mark lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];

    
    UIButton *CustomButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2 - 50, SCREEN_HEIGHT/2 -20, 100, 40)];
    [CustomButton setTitle:@"提示框弹起" forState:UIControlStateNormal];
    [CustomButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    [CustomButton addTarget:self action:@selector(Action_ShowAlertView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:CustomButton];
    
}
#pragma mark -
#pragma mark 按钮点击事件
- (void)Action_ShowAlertView:(UIButton *)button{
    ZGDCustomAlertView *NewAlertView = [[ZGDCustomAlertView alloc] initWithLeftButtonTitle:@"是" AndRightButtonTitle:@"否" AndCenterText:@"提示框显示完成 是否关闭?"];
    NewAlertView.delegate = self;
}

// 左侧按钮回调
- (void)ShopCustomAlertViewAction_LeftButton:(UIButton *)leftButton
{
    NSLog(@"左");
}
// 右侧按钮回调
- (void)ShopCustomAlertViewAction_RightButton:(UIButton *)rightButton
{
    NSLog(@"右");
}


@end

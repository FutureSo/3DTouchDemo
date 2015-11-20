//
//  YYBaseViewController.m
//  3D Touch
//
//  Created by 殷悦 on 15/11/19.
//  Copyright © 2015年 Zealinfo. All rights reserved.
//

#import "YYBaseViewController.h"

@interface YYBaseViewController ()

@end

@implementation YYBaseViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    self.tabBarController.tabBar.hidden = NO;
    self.isSupport3DTouch = [self check3DTouch];
}

/** 判断是否支持3DTouch*/
- (BOOL)check3DTouch {
    
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
        return YES;
    }
    return NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark ---> 检测3D Touch
// 当用户有意修改了设备的3D Touch功能时，会调用此方法，进行重新检测
- (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection NS_AVAILABLE_IOS(8_0) {
    
    self.isSupport3DTouch = [self check3DTouch];
    if (self.isSupport3DTouch) {
        NSLog(@"打开系统3D Touch功能");
    } else {
        NSLog(@"关闭系统3D Touch功能");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

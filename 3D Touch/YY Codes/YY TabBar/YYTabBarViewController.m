//
//  YYTabBarViewController.m
//  3D Touch
//
//  Created by 殷悦 on 15/11/19.
//  Copyright © 2015年 Zealinfo. All rights reserved.
//

#import "YYTabBarViewController.h"
#import "YYFirstViewController.h"
#import "YYSecondViewController.h"
#import "YYThirdViewController.h"
#import "YYFourthViewController.h"

@interface YYTabBarViewController ()

@end

@implementation YYTabBarViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    YYFirstViewController * firstController = [[YYFirstViewController alloc] init];
    firstController.title = @"First";
    UINavigationController * firstNavController = [[UINavigationController alloc] initWithRootViewController:firstController];
    
    YYSecondViewController * secondController = [[YYSecondViewController alloc] init];
    secondController.title = @"Second";
    UINavigationController * secondNavController = [[UINavigationController alloc] initWithRootViewController:secondController];
    
    YYThirdViewController * thirdController = [[YYThirdViewController alloc] init];
    thirdController.title = @"Third";
    UINavigationController * thirdNavController = [[UINavigationController alloc] initWithRootViewController:thirdController];
    
    YYFourthViewController * fourthController = [[YYFourthViewController alloc] init];
    fourthController.title = @"Fourth";
    UINavigationController * fourthNavController = [[UINavigationController alloc] initWithRootViewController:fourthController];
    
    NSArray * tabControllers = [NSArray arrayWithObjects:firstNavController, secondNavController, thirdNavController, fourthNavController, nil];
    
    [self setViewControllers:tabControllers];
    
    // 通过3D Touch点击Item跳转到对应的视图控制器
    [NOTIFICATION_CENTER addObserver:self selector:@selector(goToController:) name:JUMP_TO_CONTROLLER object:nil];
}

- (void)goToController:(NSNotification *)notify {
    NSString * selIndex = [[notify object] objectForKey:@"index"];
    self.selectedIndex = [selIndex integerValue];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

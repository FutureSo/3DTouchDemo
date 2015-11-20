//
//  YYFirstPopViewController.m
//  3D Touch
//
//  Created by 殷悦 on 15/11/19.
//  Copyright © 2015年 Zealinfo. All rights reserved.
//

#import "YYFirstPopViewController.h"

@interface YYFirstPopViewController ()

@end

@implementation YYFirstPopViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    [self setUpLomoImageView];
    [self setUpTitleLabel];
}

- (void)setUpLomoImageView {
    
    UIImageView * lomoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[_pop_dictionary objectForKey:@"imageName"]]];
    lomoImageView.frame = CGRectMake(10, (DEVICE_SCREEN_HEIGHT-(DEVICE_SCREEN_WIDTH-20)/8*5)/2, DEVICE_SCREEN_WIDTH-20, (DEVICE_SCREEN_WIDTH-20)/8*5);
    lomoImageView.userInteractionEnabled = YES;
    [self.view addSubview:lomoImageView];
}

- (void)setUpTitleLabel {
    
    UILabel * peek_titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, NAVIGATIONBAR_HEIGHT + 50, DEVICE_SCREEN_WIDTH-20, 20)];
    peek_titleLabel.text = [_pop_dictionary objectForKey:@"title"];
    peek_titleLabel.textAlignment = NSTextAlignmentCenter;
    peek_titleLabel.textColor = [UIColor whiteColor];
    peek_titleLabel.font = [UIFont fontWithName:@"Marker Felt" size:16];
    [self.view addSubview:peek_titleLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

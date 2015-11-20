//
//  YYThirdPeekViewController.m
//  3D Touch
//
//  Created by 殷悦 on 15/11/20.
//  Copyright © 2015年 Zealinfo. All rights reserved.
//

#import "YYThirdPeekViewController.h"

@interface YYThirdPeekViewController ()

@end

@implementation YYThirdPeekViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.91f green:0.96f blue:1.00f alpha:1.00f];
    [self setUpLomoImageView];
    [self setUpTitleLabel];
}

- (void)setUpLomoImageView {
    
    UIImageView * peek_lomoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[_peek_dictionary objectForKey:@"imageName"]]];
    peek_lomoImageView.frame = CGRectMake(10, (DEVICE_SCREEN_HEIGHT-TABBAR_HEIGHT-NAVIGATIONBAR_HEIGHT-(DEVICE_SCREEN_WIDTH-20)/8*5)/2, DEVICE_SCREEN_WIDTH-20, (DEVICE_SCREEN_WIDTH-20)/8*5);
    peek_lomoImageView.userInteractionEnabled = YES;
    [self.view addSubview:peek_lomoImageView];
}

- (void)setUpTitleLabel {
    
    UILabel * peek_titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 60, DEVICE_SCREEN_WIDTH-20, 20)];
    peek_titleLabel.text = [_peek_dictionary objectForKey:@"title"];
    peek_titleLabel.textAlignment = NSTextAlignmentCenter;
    peek_titleLabel.textColor = [UIColor grayColor];
    peek_titleLabel.font = [UIFont fontWithName:@"Marker Felt" size:16];
    [self.view addSubview:peek_titleLabel];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSArray <id <UIPreviewActionItem>> *)previewActionItems {
    
    // 生成UIPreviewAction
    UIPreviewAction * like = [UIPreviewAction actionWithTitle:@"赞" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"点赞");
        [NOTIFICATION_CENTER postNotificationName:CHANGE_THIRD_LABEL_TEXT object:@"点击 赞"];
    }];
    
    UIPreviewAction * comment = [UIPreviewAction actionWithTitle:@"储存" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"储存");
        [NOTIFICATION_CENTER postNotificationName:CHANGE_THIRD_LABEL_TEXT object:@"点击 存储"];
    }];
    
    NSArray *group = @[like,comment];
    
    return group;
}

@end

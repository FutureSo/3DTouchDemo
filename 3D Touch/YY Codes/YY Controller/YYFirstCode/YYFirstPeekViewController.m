//
//  YYFirstPeekViewController.m
//  3D Touch
//
//  Created by 殷悦 on 15/11/19.
//  Copyright © 2015年 Zealinfo. All rights reserved.
//

#import "YYFirstPeekViewController.h"

@interface YYFirstPeekViewController ()

@end

@implementation YYFirstPeekViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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

- (NSArray <id <UIPreviewActionItem>> *)previewActionItems {
    
    // 生成UIPreviewAction
    UIPreviewAction * comment = [UIPreviewAction actionWithTitle:@"评论" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"评论");
        [NOTIFICATION_CENTER postNotificationName:CHANGE_FIRST_LABEL_TEXT object:@"RecordStateLabel:评论"];
    }];
    
    UIPreviewAction * collect = [UIPreviewAction actionWithTitle:@"收藏" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"收藏");
        [NOTIFICATION_CENTER postNotificationName:CHANGE_FIRST_LABEL_TEXT object:@"RecordStateLabel:收藏"];
    }];
    
    UIPreviewAction * shareWeibo = [UIPreviewAction actionWithTitle:@"分享至微博" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"分享至微博");
        [NOTIFICATION_CENTER postNotificationName:CHANGE_FIRST_LABEL_TEXT object:@"RecordStateLabel:分享至微博"];
    }];
    
    UIPreviewAction * shareWeChat = [UIPreviewAction actionWithTitle:@"分享至微信好友" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"分享至微信好友");
        [NOTIFICATION_CENTER postNotificationName:CHANGE_FIRST_LABEL_TEXT object:@"RecordStateLabel:分享至微信好友"];
    }];
    
    UIPreviewAction * shareFriendsCircle = [UIPreviewAction actionWithTitle:@"分享至微信朋友圈" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"分享至微信朋友圈");
        [NOTIFICATION_CENTER postNotificationName:CHANGE_FIRST_LABEL_TEXT object:@"RecordStateLabel:分享至微信朋友圈"];
    }];
    
    UIPreviewAction * shareQQZone = [UIPreviewAction actionWithTitle:@"分享至QQ空间" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"分享至QQ空间");
        [NOTIFICATION_CENTER postNotificationName:CHANGE_FIRST_LABEL_TEXT object:@"RecordStateLabel:分享至QQ空间"];
    }];
    
    // 塞到UIPreviewActionGroup中
    NSArray * shareActionArray   = @[shareWeibo,shareWeChat,shareFriendsCircle,shareQQZone];
    UIPreviewActionGroup *group1 = [UIPreviewActionGroup actionGroupWithTitle:@"分享" style:UIPreviewActionStyleDefault actions:shareActionArray];
    NSArray *group = @[comment,collect,group1];
    
    return group;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

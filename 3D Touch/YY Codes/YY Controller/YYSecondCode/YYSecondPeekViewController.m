//
//  YYSecondPeekViewController.m
//  3D Touch
//
//  Created by 殷悦 on 15/11/20.
//  Copyright © 2015年 Zealinfo. All rights reserved.
//

#import "YYSecondPeekViewController.h"

@interface YYSecondPeekViewController ()

@end

@implementation YYSecondPeekViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpLomoImageView];
    [self setUpSubjectLabel];
}

- (void)setUpLomoImageView {
    
    UIImageView * lomoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[_peek_dictionary objectForKey:@"imageUrl"]]];
    lomoImageView.frame = CGRectMake(10, (DEVICE_SCREEN_HEIGHT-NAVIGATIONBAR_HEIGHT-TABBAR_HEIGHT-(DEVICE_SCREEN_WIDTH-20)/8*5)/2, DEVICE_SCREEN_WIDTH-20, (DEVICE_SCREEN_WIDTH-20)/8*5);
    lomoImageView.userInteractionEnabled = YES;
    [self.view addSubview:lomoImageView];
}

- (void)setUpSubjectLabel {
    
    UILabel * peek_subjectLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, NAVIGATIONBAR_HEIGHT + 50, DEVICE_SCREEN_WIDTH-20, 20)];
    peek_subjectLabel.text = [_peek_dictionary objectForKey:@"subject"];
    peek_subjectLabel.textAlignment = NSTextAlignmentCenter;
    peek_subjectLabel.font = [UIFont fontWithName:@"Marker Felt" size:16];
    [self.view addSubview:peek_subjectLabel];
    
    UILabel * peek_contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, (DEVICE_SCREEN_HEIGHT-NAVIGATIONBAR_HEIGHT-TABBAR_HEIGHT+(DEVICE_SCREEN_WIDTH-20)/8*5)/2+50, DEVICE_SCREEN_WIDTH-20, 20)];
    peek_contentLabel.text = [NSString stringWithFormat:@"This is peekView; ImageName : %@",[self.peek_dictionary objectForKey:@"imageUrl"]];
    peek_contentLabel.textColor = [UIColor grayColor];
    peek_contentLabel.textAlignment = NSTextAlignmentCenter;
    peek_contentLabel.font = [UIFont fontWithName:@"Marker Felt" size:15];
    [self.view addSubview:peek_contentLabel];
}

- (NSArray <id <UIPreviewActionItem>> *)previewActionItems {
    
    // 生成UIPreviewAction
    UIPreviewAction * like = [UIPreviewAction actionWithTitle:@"赞" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"点赞");
    }];
    
    UIPreviewAction * comment = [UIPreviewAction actionWithTitle:@"评论" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"评论");
    }];
    
    NSArray *group = @[like,comment];
    
    return group;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

//
//  YYFirstViewController.m
//  3D Touch
//
//  Created by 殷悦 on 15/11/19.
//  Copyright © 2015年 Zealinfo. All rights reserved.
//

#import "YYFirstViewController.h"
#import "YYFirstPeekViewController.h"
#import "YYFirstPopViewController.h"

@interface YYFirstViewController ()<UIViewControllerPreviewingDelegate>

@property (nonatomic, strong) UILabel * recordStateLabel;

@end

@implementation YYFirstViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (self.recordStateLabel) {
        self.recordStateLabel.text = @"";
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isSupport3DTouch = [self check3DTouch];
    [self setUpLomoImageView];
}

- (void)setUpLomoImageView {
    
    UIImageView * lomoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lomo1.jpg"]];
    lomoImageView.frame = CGRectMake(10, (DEVICE_SCREEN_HEIGHT-(DEVICE_SCREEN_WIDTH-20)/8*5)/2, DEVICE_SCREEN_WIDTH-20, (DEVICE_SCREEN_WIDTH-20)/8*5);
    lomoImageView.userInteractionEnabled = YES;
    [self.view addSubview:lomoImageView];
    
    self.recordStateLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(lomoImageView.frame)+30, DEVICE_SCREEN_WIDTH-20, 20)];
    self.recordStateLabel.textAlignment = NSTextAlignmentCenter;
    self.recordStateLabel.font = [UIFont fontWithName:@"Marker Felt" size:16];
    [self.view addSubview:self.recordStateLabel];
    
    [NOTIFICATION_CENTER addObserver:self selector:@selector(changeRecordStateLabelText:) name:CHANGE_FIRST_LABEL_TEXT object:nil];
    
    // 注册
    if (self.isSupport3DTouch) {
    
        [self registerForPreviewingWithDelegate:self sourceView:lomoImageView];
    } else {
        
        NSLog(@"此设备不支持3DTouch功能或用户未开启3DTouch功能");
    }
}

- (void)changeRecordStateLabelText:(NSNotification *)notify {
    
    self.recordStateLabel.text = [notify object];
}

#pragma mark ---> UIViewControllerPreviewingDelegate
- (UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location {

    // 防止重复加入
    if ([self.presentedViewController isKindOfClass:[YYFirstPeekViewController class]]) {
       
        return nil;
    } else {

        YYFirstPeekViewController * peekVC = [[YYFirstPeekViewController alloc] init];
        peekVC.peek_dictionary = @{@"imageName":@"lomo1.jpg",
                                   @"title":@"First ImageView 3D Touch"};
        return peekVC;
    }
}

- (void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit {

    YYFirstPopViewController * popVC = [[YYFirstPopViewController alloc] init];
    popVC.pop_dictionary = @{@"imageName":@"lomo1.jpg",
                             @"title":@"First ImageView 3D Touch"};
//    [self showViewController:popVC sender:self];
    [self.navigationController pushViewController:popVC animated:YES];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

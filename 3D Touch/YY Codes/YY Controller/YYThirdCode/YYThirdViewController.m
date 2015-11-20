//
//  YYThirdViewController.m
//  3D Touch
//
//  Created by 殷悦 on 15/11/19.
//  Copyright © 2015年 Zealinfo. All rights reserved.
//

#import "YYThirdViewController.h"
#import "YYThirdTouchView.h"
#import "YYThirdPeekViewController.h"
#import "YYThirdPopViewController.h"

@interface YYThirdViewController ()<UIViewControllerPreviewingDelegate>

@property (nonatomic, strong) YYThirdTouchView * touchView;
@property (nonatomic, strong) UILabel * recordStateLabel;

@end

@implementation YYThirdViewController

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
    [self setUpThirdTouchView];
}

- (void)setUpLomoImageView {
    
    UIImageView * lomoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lomo2.jpg"]];
    lomoImageView.frame = CGRectMake(10, (DEVICE_SCREEN_HEIGHT-(DEVICE_SCREEN_WIDTH-20)/8*5)/2, DEVICE_SCREEN_WIDTH-20, (DEVICE_SCREEN_WIDTH-20)/8*5);
    lomoImageView.userInteractionEnabled = YES;
    [self.view addSubview:lomoImageView];
    
    self.recordStateLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(lomoImageView.frame)+30, DEVICE_SCREEN_WIDTH-20, 20)];
    self.recordStateLabel.textAlignment = NSTextAlignmentCenter;
    self.recordStateLabel.font = [UIFont fontWithName:@"Marker Felt" size:16];
    [self.view addSubview:self.recordStateLabel];
    
    [NOTIFICATION_CENTER addObserver:self selector:@selector(changeStateLabelText:) name:CHANGE_THIRD_LABEL_TEXT object:nil];
    
    // 注册
    if (self.isSupport3DTouch) {
        
        [self registerForPreviewingWithDelegate:self sourceView:lomoImageView];
    } else {
        
        NSLog(@"此设备不支持3DTouch功能或用户未开启3DTouch功能");
    }
}

- (void)changeStateLabelText:(NSNotification *)notify {

    self.recordStateLabel.text = [notify object];
}

- (void)setUpThirdTouchView {
    
    _touchView = [[YYThirdTouchView alloc] initWithFrame:CGRectMake(10, TABBAR_HEIGHT+50, DEVICE_SCREEN_WIDTH-20, 80)];
    [self.view addSubview:_touchView];
}

#pragma mark ---> UIViewControllerPreviewingDelegate
- (UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location {
    
    // 防止重复加入
    if ([self.presentedViewController isKindOfClass:[YYThirdPeekViewController class]]) {
        
        return nil;
    } else {
        
        YYThirdPeekViewController * peekVC = [[YYThirdPeekViewController alloc] init];
        peekVC.peek_dictionary = @{@"imageName":@"lomo2.jpg",
                                   @"title":@"Second ImageView 3D Touch"};
        return peekVC;
    }
}

- (void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit {
    
    YYThirdPopViewController * popVC = [[YYThirdPopViewController alloc] init];
    popVC.pop_dictionary = @{@"imageName":@"lomo2.jpg",
                             @"title":@"Second ImageView 3D Touch",
                             @"subTitle":@"君为袖手旁观客，我亦逢场作戏人！"};
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

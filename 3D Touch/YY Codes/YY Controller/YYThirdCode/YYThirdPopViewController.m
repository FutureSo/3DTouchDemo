//
//  YYThirdPopViewController.m
//  3D Touch
//
//  Created by 殷悦 on 15/11/20.
//  Copyright © 2015年 Zealinfo. All rights reserved.
//

#import "YYThirdPopViewController.h"

@interface YYThirdPopViewController ()

@end

@implementation YYThirdPopViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.91f green:0.96f blue:1.00f alpha:1.00f];
    self.title = [_pop_dictionary objectForKey:@"imageName"];
    [self setUpLomoImageView];
    [self setUpSubjectLabel];
}

- (void)setUpLomoImageView {
    
    UIImageView * lomoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[_pop_dictionary objectForKey:@"imageName"]]];
    lomoImageView.frame = CGRectMake(10, (DEVICE_SCREEN_HEIGHT-(DEVICE_SCREEN_WIDTH-20)/8*5)/2, DEVICE_SCREEN_WIDTH-20, (DEVICE_SCREEN_WIDTH-20)/8*5);
    lomoImageView.userInteractionEnabled = YES;
    [self.view addSubview:lomoImageView];
}

- (void)setUpSubjectLabel {
    
    UILabel * pop_subjectLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, NAVIGATIONBAR_HEIGHT + 50, DEVICE_SCREEN_WIDTH-20, 20)];
    pop_subjectLabel.text = [NSString stringWithFormat:@"ImageName : %@",[self.pop_dictionary objectForKey:@"imageName"]];
    pop_subjectLabel.textAlignment = NSTextAlignmentCenter;
    pop_subjectLabel.textColor = [UIColor colorWithRed:0.38f green:0.38f blue:0.38f alpha:1.00f];
    pop_subjectLabel.font = [UIFont fontWithName:@"Marker Felt" size:16];
    [self.view addSubview:pop_subjectLabel];
    
    UILabel * pop_contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, (DEVICE_SCREEN_HEIGHT+(DEVICE_SCREEN_WIDTH-20)/8*5)/2+50, DEVICE_SCREEN_WIDTH-20, 20)];
    pop_contentLabel.numberOfLines = 0;
    pop_contentLabel.text = [NSString stringWithFormat:@" %@ \n\n %@ ",[self.pop_dictionary objectForKey:@"title"],[self.pop_dictionary objectForKey:@"subTitle"]];
    pop_contentLabel.textAlignment = NSTextAlignmentCenter;
    pop_contentLabel.textColor = [UIColor lightGrayColor];
    pop_contentLabel.font = [UIFont fontWithName:@"Marker Felt" size:15];
    [pop_contentLabel sizeToFit];
    pop_contentLabel.frame = CGRectMake(10, (DEVICE_SCREEN_HEIGHT+(DEVICE_SCREEN_WIDTH-20)/8*5)/2+50, DEVICE_SCREEN_WIDTH-20, pop_contentLabel.bounds.size.height);
    [self.view addSubview:pop_contentLabel];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

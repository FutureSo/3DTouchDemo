//
//  YYSecondViewController.m
//  3D Touch
//
//  Created by 殷悦 on 15/11/19.
//  Copyright © 2015年 Zealinfo. All rights reserved.
//

#import "YYSecondViewController.h"
#import "YYSecondTableViewCell.h"
#import "YYSecondModel.h"
#import "YYSecondLayout.h"
#import "YYSecondPeekViewController.h"
#import "YYSecondPopViewController.h"

#define YYSecondTBViewCellId        @"YYSecondTableViewCellIdentifier"

@interface YYSecondViewController ()<UITableViewDelegate, UITableViewDataSource, UIViewControllerPreviewingDelegate>

@property (nonatomic, strong) UITableView * tbView;
@property (nonatomic, strong) NSMutableArray * s_dataSource;

@end

@implementation YYSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpTableView];
}

- (void)setUpTableView {
    
    UITableView * tbView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_SCREEN_WIDTH, DEVICE_SCREEN_HEIGHT) style:UITableViewStylePlain];
    tbView.delegate = self;
    tbView.dataSource = self;
    [tbView registerClass:[YYSecondTableViewCell class] forCellReuseIdentifier:YYSecondTBViewCellId];
    [self.view addSubview:tbView];
    self.tbView = tbView;
    
    // 模拟网络请求回JSON后的解析过程
    self.s_dataSource = [[NSMutableArray alloc] init];
    NSDictionary * dic;
    for (NSInteger i = 0; i < 10; i++) {
        if (i % 2 == 0) {
            dic = @{@"imageUrl":@"lomo1.jpg",
                    @"subject":[NSString stringWithFormat:@"This is %ld Row",i]};
        } else {
            dic = @{@"imageUrl":@"lomo2.jpg",
                    @"subject":[NSString stringWithFormat:@"This is %ld Row",i]};
        }
        YYSecondModel * model = [[YYSecondModel alloc] init];
        model.dataDictionary = dic;
        YYSecondLayout * layout = [[YYSecondLayout alloc] init];
        layout.s_model = model;
        [self.s_dataSource addObject:layout];
    }
    [self.tbView reloadData];
}

#pragma mark ---> UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.s_dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    YYSecondTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:YYSecondTBViewCellId forIndexPath:indexPath];
    cell.s_layout = self.s_dataSource[indexPath.row];
    // 给cell注册代理，使其支持3DTouch手势
    if (self.isSupport3DTouch) {
        [self registerForPreviewingWithDelegate:self sourceView:cell];
    }
    return cell;
}

#pragma mark ---> UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    YYSecondLayout * layout = self.s_dataSource[indexPath.row];
    return [layout s_cellHeight];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    YYSecondLayout * layout = self.s_dataSource[indexPath.row];
    YYSecondPopViewController * popVC = [[YYSecondPopViewController alloc] init];
    popVC.pop_dictionary = layout.s_model.dataDictionary;
    [self.navigationController pushViewController:popVC animated:YES];
}

#pragma mark ---> UIViewControllerPreviewingDelegate
- (UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location {
    
    // 防止重复加入
    if ([self.presentedViewController isKindOfClass:[YYSecondPeekViewController class]]) {
        
        return nil;
    } else {
        
        YYSecondTableViewCell * cell = (YYSecondTableViewCell *)previewingContext.sourceView;
        YYSecondPeekViewController * peekVC = [[YYSecondPeekViewController alloc] init];
        peekVC.peek_dictionary = cell.s_layout.s_model.dataDictionary;
        return peekVC;
    }
}

- (void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit {
    
    YYSecondTableViewCell * cell = (YYSecondTableViewCell *)previewingContext.sourceView;
    YYSecondPopViewController * popVC = [[YYSecondPopViewController alloc] init];
    popVC.pop_dictionary = cell.s_layout.s_model.dataDictionary;
    [self showViewController:popVC sender:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

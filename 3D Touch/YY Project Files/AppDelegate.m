//
//  AppDelegate.m
//  3D Touch
//
//  Created by 殷悦 on 15/11/19.
//  Copyright © 2015年 Zealinfo. All rights reserved.
//

#import "AppDelegate.h"
#import "YYTabBarViewController.h"

@interface AppDelegate ()

@property (nonatomic, strong) YYTabBarViewController * tabVC;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // 代码创建快捷视图列表的方法:
    // 创建快捷视图列表有两种方法，一种是用代码写，另一种是编辑info.plist文件中的UIApplicationShortcutItems
    // 此Demo中直接使用编辑info.plist的方法创建
    //    [self create3DTouchShotItems];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    _tabVC = [[YYTabBarViewController alloc] init];
    self.window.rootViewController = _tabVC;
    
    [self.window makeKeyAndVisible];
    return YES;
}

// 代码方式创建
- (void)create3DTouchShotItems {
    //创建快捷item的icon UIApplicationShortcutItemIconFile
    UIApplicationShortcutIcon *icon1 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"touchIcon1@3x.png"];
    UIApplicationShortcutIcon *icon2 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"touchIcon2@3x.png"];
    UIApplicationShortcutIcon *icon3 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"touchIcon3@3x.png"];
    UIApplicationShortcutIcon *icon4 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"touchIcon4@3x.png"];
    
    //创建快捷item的userinfo UIApplicationShortcutItemUserInfo
    NSDictionary *info1 = @{@"index":@"0"};
    NSDictionary *info2 = @{@"index":@"1"};
    NSDictionary *info3 = @{@"index":@"2"};
    NSDictionary *info4 = @{@"index":@"3"};

    //创建ShortcutItem
    UIMutableApplicationShortcutItem *item1 = [[UIMutableApplicationShortcutItem alloc]initWithType:[NSString stringWithFormat:@"%@.first",[[NSBundle mainBundle] bundleIdentifier]] localizedTitle:@"First" localizedSubtitle:@"FirstController" icon:icon1 userInfo:info1];
    UIMutableApplicationShortcutItem *item2 = [[UIMutableApplicationShortcutItem alloc]initWithType:[NSString stringWithFormat:@"%@.second",[[NSBundle mainBundle] bundleIdentifier]] localizedTitle:@"Second" localizedSubtitle:@"SecondController" icon:icon2 userInfo:info2];
    UIMutableApplicationShortcutItem *item3 = [[UIMutableApplicationShortcutItem alloc]initWithType:[NSString stringWithFormat:@"%@.third",[[NSBundle mainBundle] bundleIdentifier]] localizedTitle:@"Third" localizedSubtitle:nil icon:icon3 userInfo:info3];
    UIMutableApplicationShortcutItem *item4 = [[UIMutableApplicationShortcutItem alloc]initWithType:[NSString stringWithFormat:@"%@.fourth",[[NSBundle mainBundle] bundleIdentifier]] localizedTitle:@"Fourth" localizedSubtitle:@"第四" icon:icon4 userInfo:info4];
    
    NSArray *items = @[item1, item2, item3, item4];
    [UIApplication sharedApplication].shortcutItems = items;
}

#pragma mark ---> 响应标签的行为
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void(^)(BOOL succeeded))completionHandler{
    
    [NOTIFICATION_CENTER postNotificationName:JUMP_TO_CONTROLLER object:shortcutItem.userInfo];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

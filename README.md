# 3DTouchDemo

## 效果图 
 ![效果1](https://github.com/FutureSo/3DTouchDemo/blob/master/Resource/%E6%95%88%E6%9E%9C1.gif)
 ![效果2](https://github.com/FutureSo/3DTouchDemo/blob/master/Resource/%E6%95%88%E6%9E%9C2.gif)
 ![效果3](https://github.com/FutureSo/3DTouchDemo/blob/master/Resource/%E6%95%88%E6%9E%9C3.gif)

# 让我们开始吧👇

## Step1 : 设备检测
 
 1.检测当前设备是否支持3DTouch功能
   在iOS9中，UITouch中新增加了一个枚举:
   
   >       typedef NS_ENUM(NSInteger, UIForceTouchCapability) {  
                UIForceTouchCapabilityUnknown        = 0,  
                UIForceTouchCapabilityUnavailable    = 1,  
                UIForceTouchCapabilityAvailable      = 2
   >       };    
   
   >		UIForceTouchCapabilityUnknown			// 3D Touch检测失败
   >		UIForceTouchCapabilityUnavailable		// 3D Touch不可用
   >		UIForceTouchCapabilityAvailable			// 3D Touch可用
   
### 定义一个BOOL属性
  在 **YYBaseViewController.h** 中定义属性：
  
  `
  @property (nonatomic, assign) BOOL  isSupport3DTouch;
  `
  
  通过 **- (BOOL)check3DTouch;** 方检测设备是否支持3D Touch：
  
  > 	- (BOOL)check3DTouch {
  >  		if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
  >      		return YES;
  >  		}
  >  		return NO;
  >		}
  
  当用户有意修改了设备的3D Touch功能时，会调用下面方法，进行重新检测
  >		- (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection NS_AVAILABLE_IOS(8_0) {   
    	self.isSupport3DTouch = [self check3DTouch];
    	if (self.isSupport3DTouch) {
       		NSLog(@"打开系统3D Touch功能");
   		} else {
    		 NSLog(@"关闭系统3D Touch功能");
    	}
  >		}
  	
## Step2 : 配置标签

	iOS9为我们提供了两种屏幕标签，分别是静态标签和动态标签。
	在此Demo中，是使用静态标签配置的。
  
### 1.静态标签

静态标签是我们在项目的配置plist文件中配置的标签，在用户安装程序后就可以使用，并且排序会在动态标签的前面。
		
![配置标签1](https://github.com/FutureSo/3DTouchDemo/blob/master/Resource/%E9%85%8D%E7%BD%AE%E6%A0%87%E7%AD%BE1.png)

打开工程找到Info.plist --> 右键 --> Open As --> Source Code

	    在Source Code里按照如下方式进行标签配置：	    
		<key>UIApplicationShortcutItems</key>
		<array>
			<dict>
				<key>UIApplicationShortcutItemIconFile</key>
				<string>touchIcon1@3x.png</string>
				<key>UIApplicationShortcutItemSubtitle</key>
				<string>FirstController</string>
				<key>UIApplicationShortcutItemTitle</key>
				<string>First</string>
				<key>UIApplicationShortcutItemType</key>
				<string>$(PRODUCT_BUNDLE_IDENTIFIER).first</string>
				<key>UIApplicationShortcutItemUserInfo</key>
				<dict>
					<key>index</key>
					<string>0</string>
				</dict>
			</dict>
			<dict>
				<key>UIApplicationShortcutItemIconFile</key>
				<string>touchIcon2@3x.png</string>
				<key>UIApplicationShortcutItemSubtitle</key>
				<string>SecondController</string>
				<key>UIApplicationShortcutItemTitle</key>
				<string>Second</string>
				<key>UIApplicationShortcutItemType</key>
				<string>$(PRODUCT_BUNDLE_IDENTIFIER).second</string>
				<key>UIApplicationShortcutItemUserInfo</key>
				<dict>
					<key>index</key>
					<string>1</string>
				</dict>
			</dict>
			<dict>
				<key>UIApplicationShortcutItemIconFile</key>
				<string>touchIcon3@3x.png</string>
				<key>UIApplicationShortcutItemTitle</key>
				<string>Third</string>
				<key>UIApplicationShortcutItemType</key>
				<string>$(PRODUCT_BUNDLE_IDENTIFIER).third</string>
				<key>UIApplicationShortcutItemUserInfo</key>
				<dict>
					<key>index</key>
					<string>2</string>
				</dict>
			</dict>
			<dict>
				<key>UIApplicationShortcutItemIconFile</key>
				<string>touchIcon4@3x.png</string>
				<key>UIApplicationShortcutItemSubtitle</key>
				<string>第四</string>
				<key>UIApplicationShortcutItemTitle</key>
				<string>Fourth</string>
				<key>UIApplicationShortcutItemType</key>
				<string>$(PRODUCT_BUNDLE_IDENTIFIER).fourth</string>
				<key>UIApplicationShortcutItemUserInfo</key>
				<dict>
					<key>index</key>
					<string>3</string>
				</dict>
			</dict>
		</array>

也可以通过可视化的界面添加键值对，如下图：

![配置标签2](https://github.com/FutureSo/3DTouchDemo/blob/master/Resource/%E9%85%8D%E7%BD%AE%E6%A0%87%E7%AD%BE2.png)

	必填项（下面两个键值是必须设置的）：
	UIApplicationShortcutItemType  这个键值设置一个快捷通道类型的字符串 
	UIApplicationShortcutItemTitle 这个键值设置标签的标题

	选填项（下面这些键值不是必须设置的）：
	UIApplicationShortcutItemSubtitle  设置标签的副标题
	UIApplicationShortcutItemIconType  设置标签Icon类型
	UIApplicationShortcutItemIconFile  设置标签的Icon文件
	UIApplicationShortcutItemUserInfo  设置信息字典(用于传值)
我们如上截图设置后，运行程序，用我们前面的方法进行测试，效果如下：

![标签效果](https://github.com/FutureSo/3DTouchDemo/blob/master/Resource/%E6%A0%87%E7%AD%BE%E6%95%88%E6%9E%9C.png)

### 2.动态标签  	

动态标签是我们在程序中，通过代码添加的。
在 **AppDelegate.m** 中调用 **[self create3DTouchShotItems];** 方法即可实现动态标签。

### 3.响应标签的行为

类似推送，当我们点击标签进入应用程序时，也可以进行一些操作，我们可以看到，在applocation中增加了这样一个方法：

>		- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void(^)(BOOL succeeded))completionHandler {
>		
    	[NOTIFICATION_CENTER postNotificationName:JUMP_TO_CONTROLLER object:shortcutItem.userInfo];
>		}
		
#### 注意：

1.快捷标签最多可以创建四个，包括静态的和动态的。

2.每个标签的题目和icon最多两行，多出的会用……省略。

## Step3 : 注册3D Touch事件

1. 首先，遵循__UIViewControllerPreviewingDelegate__协议。
2. 通过
>		- (id <UIViewControllerPreviewing>)registerForPreviewingWithDelegate:(id<UIViewControllerPreviewingDelegate>)delegate sourceView:(UIView *)sourceView NS_AVAILABLE_IOS(9_0); 

进行3D Touch注册。	

## Step 4 : 完成UIViewControllerPreviewingDelegate 协议回调，实现Peek Pop
在__YYFirstViewController.m__中

##### peek 代码

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

##### pop 代码

	 //此方法是重按peek时，跳入pop的代理方法
	- (void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit {
    	YYFirstPopViewController * popVC = [[YYFirstPopViewController alloc] init];
    	popVC.pop_dictionary = @{@"imageName":@"lomo1.jpg",
                             		@"title":@"First ImageView 3D Touch"};
	//    [self showViewController:popVC sender:self];
    	[self.navigationController pushViewController:popVC animated:YES];
	}
	
## Step5 : 在Peek状态下向上滑动出现的按钮配置方法

 在 **YYFirstPeekViewController.m**  
 完成  ** - (NSArray<id<UIPreviewActionItem>> *)previewActionItems **  回调方法  
>代码如下:

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
	
## Step 6 : 注意事项
>如果Pop界面有对导航栏，或者工具栏进行隐藏或者显示的操作，需要去peek中设置。

>我的微博：[@Future_sy](http://weibo.com/u/5667726430?topnav=1&wvr=6&topsug=1)
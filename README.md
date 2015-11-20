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
  	
## step2 : 配置标签

	iOS9为我们提供了两种屏幕标签，分别是静态标签和动态标签。
	在此Demo中，是使用静态标签配置的。
  
### 1.静态标签

		静态标签是我们在项目的配置plist文件中配置的标签，在用户安装程序后就可以使用，并且排序会在动态标签的前面。
		


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
		<array>


### 2.动态标签  	
//
//  YYBaseViewController.h
//  3D Touch
//
//  Created by 殷悦 on 15/11/19.
//  Copyright © 2015年 Zealinfo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YYBaseViewController : UIViewController

@property (nonatomic, assign) BOOL  isSupport3DTouch;   /**< 是否支持3DTouch*/

- (BOOL)check3DTouch;
@end

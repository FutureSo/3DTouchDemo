//
//  YYSecondLayout.h
//  3D Touch
//
//  Created by 殷悦 on 15/11/20.
//  Copyright © 2015年 Zealinfo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class YYSecondModel;

@interface YYSecondLayout : NSObject

@property (nonatomic, strong) YYSecondModel * s_model;

@property (nonatomic, assign) CGRect s_imageViewRect;   /**< imageView的frame*/

@property (nonatomic, assign) CGRect s_labelRect;   /**< label的frame*/

@property (nonatomic, assign) CGFloat s_cellHeight; /**< cell的高度*/
@end

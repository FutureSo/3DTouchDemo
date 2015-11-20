//
//  YYSecondTableViewCell.h
//  3D Touch
//
//  Created by 殷悦 on 15/11/20.
//  Copyright © 2015年 Zealinfo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YYSecondLayout;

@interface YYSecondTableViewCell : UITableViewCell

@property (nonatomic, strong) YYSecondLayout * s_layout;

@property (nonatomic, strong) UIImageView * s_imageView;

@property (nonatomic, strong) UILabel * s_subjectLabel;

@end

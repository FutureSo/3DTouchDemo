//
//  YYSecondLayout.m
//  3D Touch
//
//  Created by 殷悦 on 15/11/20.
//  Copyright © 2015年 Zealinfo. All rights reserved.
//

#import "YYSecondLayout.h"
#import "YYSecondModel.h"

@implementation YYSecondLayout

- (void)setS_model:(YYSecondModel *)s_model {
    
    _s_model = s_model;
    
    self.s_imageViewRect = CGRectMake(10, 10, 120, 75);
    
    UILabel * label = [[UILabel alloc] init];
    label.text = _s_model.subject;
    label.font = [UIFont fontWithName:@"Marker Felt" size:16];
    [label sizeToFit];
    self.s_labelRect = CGRectMake( CGRectGetMaxX(self.s_imageViewRect)+10, 10+(75-label.bounds.size.height)/2, label.bounds.size.width, label.bounds.size.height);
    
    self.s_cellHeight = 95.f;
}

@end

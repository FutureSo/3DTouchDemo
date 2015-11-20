//
//  YYThirdTouchView.m
//  3D Touch
//
//  Created by 殷悦 on 15/11/20.
//  Copyright © 2015年 Zealinfo. All rights reserved.
//

#import "YYThirdTouchView.h"

@implementation YYThirdTouchView
{
    UILabel * label;
}

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor colorWithRed:0 green:1 blue:0.5 alpha:1];
        label = [[UILabel alloc] initWithFrame:CGRectMake(0, (self.frame.size.height-20)/2, self.frame.size.width, 20)];
        label.text = @"按 压 变 色:";
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
    }
    return self;
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    
    UITouch * touch = [touches anyObject];
    label.text = [NSString stringWithFormat:@"按 压 变 色 : %f",touch.force];
    self.backgroundColor = [UIColor colorWithRed:(touch.force/touch.maximumPossibleForce) green:1 blue:0.5 alpha:1];
    if (touch.force == touch.maximumPossibleForce) {
        
        NSLog(@"---> %f",touch.force);
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    self.backgroundColor = [UIColor colorWithRed:0 green:1 blue:0.5 alpha:1];
}

@end

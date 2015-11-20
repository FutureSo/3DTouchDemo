//
//  YYSecondModel.m
//  3D Touch
//
//  Created by 殷悦 on 15/11/20.
//  Copyright © 2015年 Zealinfo. All rights reserved.
//

#import "YYSecondModel.h"

@implementation YYSecondModel

- (void)setDataDictionary:(NSDictionary *)dataDictionary {
    
    _dataDictionary = dataDictionary;
    self.imageUrl = [dataDictionary objectForKey:@"imageUrl"];
    self.subject = [dataDictionary objectForKey:@"subject"];
}

@end

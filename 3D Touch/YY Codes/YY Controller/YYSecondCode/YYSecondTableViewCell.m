//
//  YYSecondTableViewCell.m
//  3D Touch
//
//  Created by 殷悦 on 15/11/20.
//  Copyright © 2015年 Zealinfo. All rights reserved.
//

#import "YYSecondTableViewCell.h"
#import "YYSecondLayout.h"
#import "YYSecondModel.h"

@implementation YYSecondTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self setUpControls];
    }
    return self;
}

- (void)setUpControls {
    
    self.s_imageView = [[UIImageView alloc] init];
    self.s_imageView.userInteractionEnabled = YES;
    [self addSubview:self.s_imageView];
    
    self.s_subjectLabel = [[UILabel alloc] init];
    [self addSubview:self.s_subjectLabel];
}

- (void)setS_layout:(YYSecondLayout *)s_layout {
    
    _s_layout = s_layout;
    [self setUpData:_s_layout];
    [self setUpFrame:_s_layout];
}

- (void)setUpData:(YYSecondLayout *)layout {
    
    self.s_imageView.image = [UIImage imageNamed:layout.s_model.imageUrl];
    self.s_subjectLabel.text = layout.s_model.subject;
    self.s_subjectLabel.font = [UIFont fontWithName:@"Marker Felt" size:16];
}

- (void)setUpFrame:(YYSecondLayout *)layout {
    
    self.s_imageView.frame = layout.s_imageViewRect;
    self.s_subjectLabel.frame = layout.s_labelRect;
}

- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end

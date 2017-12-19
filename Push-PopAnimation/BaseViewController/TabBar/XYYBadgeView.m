//
//  XYYBadgeView.m
//  demo
//
//  Created by  Forfarming on 2017/12/18.
//  Copyright © 2017年  Forfarming. All rights reserved.
//

#import "XYYBadgeView.h"
#import "UIButton+Size.h"

#define XYYBadgeViewFont [UIFont systemFontOfSize:11]
@implementation XYYBadgeView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        self.titleLabel.font = XYYBadgeViewFont;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.layer.cornerRadius = 8.0;
        self.layer.masksToBounds = YES;
    }
    return self;
}

- (void)setBadgeValue:(NSString *)badgeValue {
    _badgeValue = badgeValue;
//判断 badgeValue 是否有内容
    if (badgeValue.length == 0 || [badgeValue isEqualToString:@"0"]) {
        self.hidden = YES;
    }else{
        self.hidden = NO;
    }
    
    if (badgeValue.length == 1) {
        CGRect rect = self.frame;
        rect.size.height = 16;
        rect.size.width = 16;
        self.frame = rect;
    }else if (badgeValue.length > 2) {
        badgeValue = @"99+";
        CGSize size = [UIButton boundingRectWithSize:badgeValue Font:self.titleLabel.font Size:CGSizeMake(MAXFLOAT, 16.0)];
        CGRect rect = self.frame;
        rect.size.height = 16;
        rect.size.width = size.width+8;
        self.frame = rect;
    }else if (badgeValue.length == 2) {
        CGSize size = [UIButton boundingRectWithSize:badgeValue Font:self.titleLabel.font Size:CGSizeMake(MAXFLOAT, 16.0)];
        CGRect rect = self.frame;
        rect.size.height = 16;
        rect.size.width = size.width+8;
        self.frame = rect;
    }
    [self setTitle:badgeValue forState:UIControlStateNormal];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

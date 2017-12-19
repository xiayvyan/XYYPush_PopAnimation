//
//  XYYBarButtonItem.m
//  demo
//
//  Created by  Forfarming on 2017/12/14.
//  Copyright © 2017年  Forfarming. All rights reserved.
//

#import "XYYBarButtonItem.h"
#import "UIButton+Size.h"

@interface XYYBarButtonItem ()

@end

@implementation XYYBarButtonItem

- (instancetype)initWithImage:(UIImage *)image target:(id)target action:(SEL)action {
    self = [super init];
    if (self) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:image forState:UIControlStateNormal];
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        btn.frame = CGRectMake(0, 0, 30, 44);
        self.frame = CGRectMake(0, 0, 30, 44);
        [self addSubview:btn];
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title target:(id)target action:(SEL)action {
    self = [super init];
    if (self) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:title forState:UIControlStateNormal];
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        CGSize size = [UIButton boundingRectWithSize:btn.titleLabel.text Font:btn.titleLabel.font Size:CGSizeMake(MAXFLOAT, 44.0)];
        CGFloat w = size.width > 30 ? size.width : 30;
        btn.frame = CGRectMake(0, 0, w, 44);
        self.frame = CGRectMake(0, 0, w, 44);
        [self addSubview:btn];
    }
    return self;
}

- (instancetype)initWithCustomView:(UIView *)customView {
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, customView.frame.size.width, 44);
        [self addSubview:customView];
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

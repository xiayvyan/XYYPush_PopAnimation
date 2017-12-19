//
//  XYYNavigationBar.m
//  demo
//
//  Created by  Forfarming on 2017/12/14.
//  Copyright © 2017年  Forfarming. All rights reserved.
//

#import "XYYNavigationBar.h"
#import "UIButton+Size.h"

@interface XYYNavigationBar ()
{
    UIFont *_font;
    UIColor *_color;
}

@end

@implementation XYYNavigationBar

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        [self initializeUI];
    }
    return self;
}

- (instancetype)init {
    return [self initWithFrame:CGRectZero];
}

- (void)initializeUI {
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, GlobalNavHeight);
    self.backgroundColor = [UIColor colorWithWhite:0.961 alpha:1.000];
    
    self.imageView = [[UIImageView alloc] init];
    self.imageView.backgroundColor = [UIColor clearColor];
    self.imageView.frame = self.bounds;
    [self addSubview:self.imageView];
    
    self.barLine = [UIView new];
    self.barLine.frame = CGRectMake(0, GlobalNavHeight - 1, SCREEN_WIDTH, 1);
    self.barLine.backgroundColor = [UIColor clearColor];
    [self addSubview:self.barLine];
    
    CGFloat titleLableX = SCREEN_WIDTH *0.5 - 50;
    self.titleLable = [[UILabel alloc] init];
    self.titleLable.frame = CGRectMake(titleLableX, GlobalNavHeight - 44, 100, 43);
    self.titleLable.text = self.title;
    self.titleLable.textAlignment = NSTextAlignmentCenter;
    self.titleLable.lineBreakMode = NSLineBreakByTruncatingTail;
    [self addSubview:self.titleLable];
}

#pragma mark - item 的字体颜色及大小
- (void)setFont:(UIFont *)font color:(UIColor *)color {
    _font = font;
    _color = color;
}

#pragma mark - setter
- (void)setLeftItem:(XYYBarButtonItem *)leftItem {
    [_leftItem removeFromSuperview];
    _leftItem = leftItem;
    _leftItem.hidden = NO;
    for (UIView *view in leftItem.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
             UIButton *btn = (UIButton *)view;
            if (_font) {
                btn.titleLabel.font = _font;
            }
            if (_color) {
                [btn setTitleColor:_color forState:UIControlStateNormal];
            }
        }
    }
    leftItem.frame = CGRectMake(10, GlobalNavHeight - 44, leftItem.frame.size.width, 44);
    [self addSubview:_leftItem];
}

- (void)setRightItem:(XYYBarButtonItem *)rightItem {
    _rightItem = rightItem;
    for (UIView *view in rightItem.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)view;
            if (_font) {
                btn.titleLabel.font = _font;
            }
            if (_color) {
                [btn setTitleColor:_color forState:UIControlStateNormal];
            }
        }
    }
    CGFloat w = rightItem.frame.size.width;
    _rightItem.frame = CGRectMake(SCREEN_WIDTH - 10 - w, GlobalNavHeight - 44, w, 44);
    [self addSubview:_rightItem];
}

- (void)setTitleView:(UIView *)titleView {
    _titleView = titleView;
    _titleLable.hidden = YES;
    _titleView.center = CGPointMake(CGRectGetMidX(self.frame), GlobalNavHeight - 22);
    [self addSubview:_titleView];
}

- (void)setTitle:(NSString *)title {
    _title = title;
    if (!title) {
        _titleLable.text = @"";
        return;
    }
    if ([title isEqualToString:_titleLable.text]) {
        return;
    }
    if (!_titleLable) {
        _titleLable = [[UILabel alloc] init];
        _titleLable.textAlignment = NSTextAlignmentCenter;
        _titleLable.lineBreakMode = NSLineBreakByTruncatingTail;
    }
    _titleLable.text = title;
    [self setNeedsDisplay];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

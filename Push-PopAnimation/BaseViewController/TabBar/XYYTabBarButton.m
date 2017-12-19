//
//  XYYTabBarButton.m
//  demo
//
//  Created by  Forfarming on 2017/12/15.
//  Copyright © 2017年  Forfarming. All rights reserved.
//

#import "XYYTabBarButton.h"
#import "XYYBadgeView.h"

@interface XYYTabBarButton ()

@property (nonatomic, strong) UILabel *label;

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) XYYBadgeView *badgeView;

@end

@implementation XYYTabBarButton

- (UILabel *)label {
    
    if (!_label) {
        _label = [[UILabel alloc] init];
    }
    return _label;
}

- (UIImageView *)imageView {
    
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}

- (XYYBadgeView *)badgeView {
    if (!_badgeView) {
        self.badgeView = [XYYBadgeView buttonWithType:UIButtonTypeCustom];
        [self addSubview:_badgeView];
    }
    return _badgeView;
}

- (void)setISelected:(BOOL)iSelected {
    
    _iSelected = iSelected;
    if (_iSelected) {
        self.label.textColor = [UIColor orangeColor];
        self.imageView.image = _item.selectedImage;
    }else{
        self.label.textColor = [UIColor lightGrayColor];
        self.imageView.image = _item.image;
    }
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.label.font = [UIFont systemFontOfSize:12.0];
        self.label.textColor = [UIColor lightGrayColor];
        self.label.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:self.label];
        [self addSubview:self.imageView];
        
        
    }
    return self;
}

#pragma mark - 传递UITabBarItem给tabBarButton,给tabBarButton内容赋值
-(void)setItem:(UITabBarItem *)item {
    _item = item;
    self.label.text = _item.title;
    self.imageView.image = _item.image;
    
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
    //KVO 时刻监听一个对象的属性有没有改变
    //给谁添加观察者
    //Observer：按钮
    [_item addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:nil];
    [_item addObserver:self forKeyPath:@"image" options:NSKeyValueObservingOptionNew context:nil];
    [_item addObserver:self forKeyPath:@"selectedImage" options:NSKeyValueObservingOptionNew context:nil];
    [_item addObserver:self forKeyPath:@"badgeValue" options:NSKeyValueObservingOptionNew context:nil];
}

#pragma mark - 监听的回调
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    NSLog(@"%@", _item.badgeValue);
    self.badgeView.badgeValue = _item.badgeValue;
}

#pragma mark - 修改按钮内部子控件的 frame
- (void)layoutSubviews {
    [super layoutSubviews];
    if (_item.title.length < 1) {
        
        //1.imageView
        CGFloat imageX = 0;
        CGFloat imageY = 9;
        CGFloat imageW = CGRectGetWidth(self.frame);
        CGFloat imageH = 25;
        self.imageView.frame = CGRectMake(imageX, imageY, imageH, imageH);
        self.imageView.center = CGPointMake(imageW/2.0, 49/2.0);
        
        //2.title
        self.label.frame = CGRectMake(0, 0, 0, 0);
        
        //3.badgeView
        CGPoint point = CGPointMake(CGRectGetMaxX(self.imageView.frame)-2, 4);
        CGRect rect = self.badgeView.frame;
        rect.origin = point;
        self.badgeView.frame = rect;
    }else{
        //1.imageView
        CGFloat imageX = 0;
        CGFloat imageY = 5;
        CGFloat imageW = CGRectGetWidth(self.frame);
        CGFloat imageH = 22;
        self.imageView.frame = CGRectMake(imageX, imageY, imageH, imageH);
        CGPoint point = self.imageView.center;
        point.x = imageW / 2.0;
        self.imageView.center = point;
        
        //2.title
        CGFloat titleX = 0;
        CGFloat titleY = 5+imageH;
        CGFloat titleW = self.bounds.size.width;
        CGFloat titleH = (self.bounds.size.height - SafeAreaBottomHeight) - titleY;
        self.label.frame = CGRectMake(titleX, titleY, titleW, titleH);
        point = self.label.center;
        point.x = self.imageView.center.x;
        self.label.center = point;
        
        //3.badgeView
        point = CGPointMake(CGRectGetMaxX(self.imageView.frame) - 2, 2);
        CGRect rect = self.badgeView.frame;
        rect.origin = point;
        self.badgeView.frame = rect;
    }
}

@end

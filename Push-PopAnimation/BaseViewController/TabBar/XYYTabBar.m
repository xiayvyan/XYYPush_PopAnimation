//
//  XYYTabBar.m
//  demo
//
//  Created by  Forfarming on 2017/12/15.
//  Copyright © 2017年  Forfarming. All rights reserved.
//

#import "XYYTabBar.h"
#import "XYYTabBarButton.h"

@interface XYYTabBar ()
{
    XYYTabBarButton *_selectedButton;
}

@property (nonatomic, strong) NSMutableArray *buttons;

@end

@implementation XYYTabBar

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self){
        [self initializeUI];
    }
    return self;
}

- (instancetype)init {
    return [self initWithFrame:CGRectZero];
}

- (void)initializeUI {
    self.frame = CGRectMake(0, SCREEN_HEIGHT - (SafeAreaBottomHeight + 49), SCREEN_WIDTH, SafeAreaBottomHeight + 49);
    self.backgroundColor = [UIColor colorWithWhite:0.961 alpha:1.000];
    
    self.imageView = [[UIImageView alloc] init];
    self.imageView.backgroundColor = [UIColor clearColor];
    self.imageView.frame = self.bounds;
    [self addSubview:self.imageView];
    
    self.barLine = [UIView new];
    self.barLine.frame = CGRectMake(0, 0, SCREEN_WIDTH, 1);
    self.barLine.backgroundColor = [UIColor clearColor];
    [self addSubview:self.barLine];
}

- (void)setItemArray:(NSArray *)itemArray {
    _itemArray = itemArray;
    //遍历模型数组，创建对应的 tabBarButton
    int i = 0;
    for (UITabBarItem *item in _itemArray) {
        
        XYYTabBarButton *btn = [[XYYTabBarButton alloc] init];
        btn.item = item;
        btn.tag = self.buttons.count+10000;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tabBarAction:)];
        [btn addGestureRecognizer:tap];
        [self addSubview:btn];
        if (i == 0) {
            _selectedButton = btn;
            btn.iSelected = YES;
        }
        //把按钮添加到按钮的数组
        [self.buttons addObject:btn];
        i++;
    }
}

- (void)tabBarAction:(UITapGestureRecognizer *)tap {
    
    XYYTabBarButton *sender = (XYYTabBarButton *)tap.view;
    _selectedButton.iSelected = NO;
    sender.iSelected = YES;
    _selectedButton = sender;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(tabBar:didClickeButton:)]) {
        [self.delegate tabBar:self didClickeButton:sender.tag-10000];
    }
}

#pragma mark - 调整子控件的位子
- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat w = self.bounds.size.width;
    CGFloat h = self.bounds.size.height;
    
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    
    CGFloat btnW = w / (self.itemArray.count);
    CGFloat btnH = h;
    
    int i = 0;
    
    for (UIView *tabBarButton in self.buttons) {
        btnX = btnW * i;
        tabBarButton.frame = CGRectMake(btnX, btnY, btnW, btnH);
        i++;
    }
}

- (NSMutableArray *)buttons {
    
    if (!_buttons) {
        self.buttons = [NSMutableArray array];
    }
    return _buttons;
}


@end

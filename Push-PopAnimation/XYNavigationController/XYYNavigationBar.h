//
//  XYYNavigationBar.h
//  demo
//
//  Created by  Forfarming on 2017/12/14.
//  Copyright © 2017年  Forfarming. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYYBarButtonItem.h"

@interface XYYNavigationBar : UIView

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIView *barLine;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) UILabel *titleLable;
@property (nonatomic, strong) UIView *titleView;

@property (nonatomic, strong) XYYBarButtonItem *leftItem;
@property (nonatomic, strong) XYYBarButtonItem *rightItem;
/**
 设置item的字体颜色和大小

 @param font 字体大小
 @param color 字体颜色
 */
- (void)setFont:(UIFont *)font color:(UIColor *)color;

@end

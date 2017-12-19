//
//  XYYTabBar.h
//  demo
//
//  Created by  Forfarming on 2017/12/15.
//  Copyright © 2017年  Forfarming. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XYYTabBar;

@protocol XYYTabBarDelegate <NSObject>

@optional
- (void)tabBar:(XYYTabBar *)tabBar didClickeButton:(NSInteger)index;

@end

@interface XYYTabBar : UIView

@property (nonatomic, weak) id<XYYTabBarDelegate> delegate;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIView *barLine;

@property (nonatomic, strong) NSArray *itemArray;

@end

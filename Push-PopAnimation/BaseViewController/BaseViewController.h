//
//  BaseViewController.h
//  demo
//
//  Created by  Forfarming on 2017/12/14.
//  Copyright © 2017年  Forfarming. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XYYNavigationBar;
@class XYYTabBar;

@interface BaseViewController : UIViewController

@property (nonatomic, strong) XYYNavigationBar *rootViewNavgationBar;

@property (nonatomic, strong) XYYTabBar *tabBar;

@property (nonatomic, strong) UIView *backView;

@property (nonatomic, strong) UIView *hiddenView;

@property (nonatomic, strong) NSMutableArray *items;

@end

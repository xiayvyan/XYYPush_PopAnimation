//
//  RootViewController.m
//  demo
//
//  Created by  Forfarming on 2017/12/15.
//  Copyright © 2017年  Forfarming. All rights reserved.
//

#import "RootViewController.h"
#import "XYYNavigationController.h"
#import "HomeViewController.h"
#import "DiscoverViewController.h"
#import "MineViewController.h"

#import "XYYTabBar.h"

@interface RootViewController ()<XYYTabBarDelegate>

@property (nonatomic, strong) HomeViewController *homeVC;

@property (nonatomic, strong) DiscoverViewController *disVC;

@property (nonatomic, strong) MineViewController *mineVC;

@end

@implementation RootViewController

#pragma mark - XYYTabBarDelegate
- (void)tabBar:(XYYTabBar *)tabBar didClickeButton:(NSInteger)index {
    switch (index) {
        case 0:
            _homeVC.view.hidden = NO;
            _disVC.view.hidden = YES;
            _mineVC.view.hidden = YES;
            [self.backView addSubview:_homeVC.view];
            break;
        case 1:
            _homeVC.view.hidden = YES;
            _disVC.view.hidden = NO;
            _mineVC.view.hidden = YES;
            [self.backView addSubview:_disVC.view];
            break;
        case 2:
            _homeVC.view.hidden = YES;
            _disVC.view.hidden = YES;
            _mineVC.view.hidden = NO;
            [self.backView addSubview:_mineVC.view];
            break;
        default:
            break;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.backView.backgroundColor = [UIColor purpleColor];
    [self setUpAllChildViewControllers];
    self.rootViewNavgationBar.hidden = YES;

    NSMutableArray *items = [NSMutableArray array];
    for (BaseViewController *VC in self.childViewControllers) {
        [items addObject:VC.tabBarItem];
    }
    self.items = items;
    self.tabBar.delegate = self;
}

#pragma mark - 添加字控制器
- (void)setUpAllChildViewControllers {
    
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    homeVC.ctrl = self;
    [self setUpChildController:homeVC image:[UIImage imageNamed:@"tabbar_home"] selectedImage:[UIImage imageNamed:@"tabbar_home_selected"] titlle:@"首页"];
    _homeVC = homeVC;
    
    DiscoverViewController *disVC = [[DiscoverViewController alloc] init];
    disVC.ctrl = self;
    [self setUpChildController:disVC image:[UIImage imageNamed:@"tabbar_discover"] selectedImage:[UIImage imageNamed:@"tabbar_discover_selected"] titlle:@"发现"];
    _disVC = disVC;
    
    MineViewController *mineVC = [[MineViewController alloc] init];
    mineVC.ctrl = self;
    [self setUpChildController:mineVC image:[UIImage imageNamed:@"tabbar_mine"] selectedImage:[UIImage imageNamed:@"tabbar_mine_selected"] titlle:@"我的"];
    mineVC.tabBarItem.badgeValue = @"9";
    _mineVC = mineVC;
    [self addChildView:_mineVC];
    [self addChildView:_disVC];
    [self addChildView:_homeVC];
}

#pragma mark - 添加一个自控制器
- (void)setUpChildController:(UIViewController *)childVc image:(UIImage *)image selectedImage:(UIImage *)selectedImage titlle:(NSString *)title {
    
    childVc.title = title;
    childVc.tabBarItem.image = image;
    childVc.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor grayColor], NSForegroundColorAttributeName, [UIFont fontWithName:@"Helvetica" size:11.0f],NSFontAttributeName,nil] forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor orangeColor], NSForegroundColorAttributeName, [UIFont fontWithName:@"Helvetica" size:11.0f],NSFontAttributeName,nil] forState:UIControlStateSelected];
    
    XYYNavigationController *naVC = [[XYYNavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:naVC];
}

#pragma mark -
- (void)addChildView:(BaseViewController *)childVc {
    childVc.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-(SafeAreaBottomHeight + 49));
    CGRect rect = childVc.backView.frame;
    rect.size.height = SCREEN_HEIGHT - (SafeAreaBottomHeight + 49);
    childVc.backView.frame = rect;
    [self.backView addSubview:childVc.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

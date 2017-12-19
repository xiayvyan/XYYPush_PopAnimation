//
//  BaseViewController.m
//  demo
//
//  Created by  Forfarming on 2017/12/14.
//  Copyright © 2017年  Forfarming. All rights reserved.
//

#import "BaseViewController.h"
#import "POPAnimation.h"
#import "PUSHAnimation.h"
#import "XYYNavigationBar.h"
#import "XYYBarButtonItem.h"
#import "XYYTabBar.h"

@interface BaseViewController ()<UINavigationControllerDelegate>

@property (strong, nonatomic) PUSHAnimation * pushAnimation;

@property (strong, nonatomic) POPAnimation  * popAnimation;

@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *interactiveTransition;

@end

@implementation BaseViewController

#pragma mark - POP ---返回---
- (void)popViewController {
    _interactiveTransition = [[UIPercentDrivenInteractiveTransition alloc] init];
    [self.navigationController popViewControllerAnimated:YES];
    [_interactiveTransition finishInteractiveTransition];
    _interactiveTransition = nil;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.delegate = self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//  容器
    _backView = [[UIView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_backView];
// 导航栏
    _rootViewNavgationBar = [[XYYNavigationBar alloc] init];
    [_rootViewNavgationBar setFont:[UIFont systemFontOfSize:16.0] color:[UIColor lightGrayColor]];
    _rootViewNavgationBar.title = self.navigationController.topViewController.title;
    [_backView addSubview:_rootViewNavgationBar];
//  返回按钮
    _rootViewNavgationBar.leftItem = [[XYYBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"button_back"] target:self action:@selector(popViewController)];
//  侧滑手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(backHandle:)];
    [self.view addGestureRecognizer:pan];
    if (self.navigationController.childViewControllers.count - 1) { //非根控制器
        _rootViewNavgationBar.leftItem.hidden = NO;
    }else{
        _rootViewNavgationBar.leftItem.hidden = YES;
    }
}

- (void)setItems:(NSMutableArray *)items {
    _items = items;
    if (items.count > 0) {
        //  底部菜单栏
        _tabBar = [[XYYTabBar alloc] init];
        [_backView addSubview:_tabBar];
        _tabBar.itemArray = items;
    }
}

#pragma mark - 侧滑手势 pop
- (void)backHandle:(UIPanGestureRecognizer *)recognizer {
    [self customControllerPopHandle:recognizer];
}
- (void)customControllerPopHandle:(UIPanGestureRecognizer *)recognizer {
    if (self.navigationController.childViewControllers.count == 1) {
        return;
    }
    CGFloat process = [recognizer translationInView:self.view].x/self.view.bounds.size.width;
    process = MIN(1.0, MAX(0.0, process));
    
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        // 此时，创建一个UIPercentDrivenInteractiveTransition交互对象，来控制整个过程中动画的状态
        _interactiveTransition = [[UIPercentDrivenInteractiveTransition alloc] init];
        [self.navigationController popViewControllerAnimated:YES];
        
    }else if (recognizer.state == UIGestureRecognizerStateChanged) {
        // 更新手势完成度
        [_interactiveTransition updateInteractiveTransition:process];
        
    }else if (recognizer.state == UIGestureRecognizerStateEnded || recognizer.state == UIGestureRecognizerStateCancelled) {
        // 手势结束时，若进度大于0.5就完成pop动画，否则取消
        if (process > 0.5) {
            [_interactiveTransition finishInteractiveTransition];
        }else{
            [_interactiveTransition cancelInteractiveTransition];
        }
        _interactiveTransition = nil;
    }
}

#pragma mark - UINavigationControllerDelegate
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    if ([fromVC isKindOfClass:[BaseViewController class]] && [toVC isKindOfClass:[BaseViewController class]]) {
        if (operation == UINavigationControllerOperationPop) {
            return self.popAnimation;
        }else if (operation == UINavigationControllerOperationPush) {
            return self.pushAnimation;
        }else{
            return nil;
        }
    }
    return nil;
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    if([animationController isKindOfClass:[POPAnimation class]]) {
        return _interactiveTransition;
    }
    return nil;
}

#pragma mark - 懒加载
- (UIView *)hiddenView {
    if (!_hiddenView) {
        _hiddenView = [[UIView alloc] initWithFrame:self.view.bounds];
        _hiddenView.backgroundColor = [UIColor blackColor];
        [self.backView addSubview:_hiddenView];
    }
    return _hiddenView;
}

- (PUSHAnimation *)pushAnimation {
    if (!_pushAnimation) {
        _pushAnimation = [[PUSHAnimation alloc] init];
    }
    return _pushAnimation;
}

- (POPAnimation *)popAnimation {
    if (!_popAnimation) {
        _popAnimation = [[POPAnimation alloc] init];
    }
    return _popAnimation;
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

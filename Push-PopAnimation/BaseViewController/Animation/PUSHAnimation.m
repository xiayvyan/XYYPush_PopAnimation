//
//  PUSHAnimation.m
//  demo
//
//  Created by  Forfarming on 2017/12/15.
//  Copyright © 2017年  Forfarming. All rights reserved.
//

#import "PUSHAnimation.h"
#import "BaseViewController.h"

@implementation PUSHAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.3;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    // 动画来自哪个vc
    __block BaseViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    // 转场到哪个vc
    BaseViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    CGRect finalFrameForVc = [transitionContext finalFrameForViewController:toVC];
    CGRect bounds = [[UIScreen mainScreen] bounds];
    toVC.view.frame = CGRectOffset(finalFrameForVc, bounds.size.width, 0);
    [[transitionContext containerView] addSubview:toVC.view];
    // 获取动画执行时间（实现的协议方法）
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    // 执行动画，让fromVC的view移动到屏幕最右侧
    [UIView animateWithDuration:duration animations:^{
        toVC.view.frame = finalFrameForVc;
        fromVC.backView.transform = CGAffineTransformMakeScale((SCREEN_WIDTH - 20) / SCREEN_WIDTH, (SCREEN_HEIGHT - 20) / SCREEN_HEIGHT);
    } completion:^(BOOL finished) {
        fromVC.hiddenView.alpha = 0.6;
        // 当动画执行完时，这个方法必须要调用，否则系统会认为你的其余操作都在动画执行过程中
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

@end

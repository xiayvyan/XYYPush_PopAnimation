//
//  POPAnimation.m
//  demo
//
//  Created by  Forfarming on 2017/12/14.
//  Copyright © 2017年  Forfarming. All rights reserved.
//

#import "POPAnimation.h"
#import "BaseViewController.h"

@interface POPAnimation ()

@end

@implementation POPAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.3;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    // 动画来自哪个vc
    __block BaseViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    // 转场到哪个vc
    BaseViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    // 转场动画是两个控制器视图的动画，需要一个containerView作为“舞台”
    UIView *containerView = [transitionContext containerView];
    [containerView insertSubview:toVC.view belowSubview:fromVC.view];
    
    // 获取动画执行时间（实现的协议方法）
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    // 执行动画，让fromVC的view移动到屏幕最右侧
    [UIView animateWithDuration:duration animations:^{
        toVC.backView.transform = CGAffineTransformMakeScale(1.0, 1.0);
        toVC.hiddenView.alpha = 0;
        fromVC.backView.transform = CGAffineTransformMakeTranslation([UIScreen mainScreen].bounds.size.width, 0);
    } completion:^(BOOL finished) {
        if (toVC.hiddenView.alpha == 0) {
            [toVC.hiddenView removeFromSuperview];
            toVC.hiddenView = nil;
        }
        // 当动画执行完时，这个方法必须要调用，否则系统会认为你的其余操作都在动画执行过程中
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

@end

/*
 ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCple8XKBlI2yCvn5Ktgn6OUAcLqWTC0X305g1GlGhSJaaKEeh/G8IvF2w1RqAqmgrDoOWlnDmqIYGJPfkmFv4rpUwbnOf0nyzLRM9CKyGzCwjCLE9sNqbWazGci5XZb0RVHFXBwfBN3VpwBT6bcIZZXBzg+CfMJFLRGfRfPQ8qcrjDwHL4Rivvb7U8H9MDqQgjFO+KmXd9i2oKEHUUApEuhRVFD4jcdXJB80wuzCpGwZnnDAaC6B0Yk1Ae6PkD6mO/XG2Zs1hjvfVXaAO/Xeu/AJ0DAhyycgU+m+wbTds1QL3hwB0CEU17HwnTah5/1/wuPelLVR6JzM1/RWZFOM2P 18602053174@163.com

 
 
 */

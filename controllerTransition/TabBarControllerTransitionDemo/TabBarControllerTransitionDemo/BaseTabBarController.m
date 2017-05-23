//
//  BaseTabBarController.m
//  TabBarControllerTransitionDemo
//
//  Created by GrayLeo on 2017/4/28.
//  Copyright © 2017年 GrayLeo. All rights reserved.
//

#import "BaseTabBarController.h"

@interface TabBarControllerTransitionAnimation : NSObject <UIViewControllerAnimatedTransitioning>
@end

@implementation TabBarControllerTransitionAnimation

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.45;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    UIView *containerView = [transitionContext containerView];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    toVC.view.alpha = 0.0;
    toVC.view.transform = CGAffineTransformMakeScale(0.5, 0.5);
    [containerView addSubview:toVC.view];
    
    [UIView animateWithDuration:0.25 animations:^{
        toVC.view.alpha = 1.0;
        toVC.view.transform = CGAffineTransformMakeScale(1.05, 1.05);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            toVC.view.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            if (finished) {
                [transitionContext completeTransition:YES];
            }
        }];
    }];
}


@end

@interface BaseTabBarController () <UITabBarControllerDelegate>

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate = self;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController
                     animationControllerForTransitionFromViewController:(UIViewController *)fromVC
                                                       toViewController:(UIViewController *)toVC  NS_AVAILABLE_IOS(7_0) {
    return [[TabBarControllerTransitionAnimation alloc] init];
}

@end

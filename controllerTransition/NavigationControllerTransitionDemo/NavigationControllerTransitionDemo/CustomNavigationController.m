//
//  CustomNavigationController.m
//  NavigationControllerTransitionDemo
//
//  Created by GrayLeo on 2017/4/27.
//  Copyright © 2017年 GrayLeo. All rights reserved.
//

#import "CustomNavigationController.h"


@interface NavigationControllerTransitionAnimate : NSObject <UIViewControllerAnimatedTransitioning>
@property (nonatomic, assign) UINavigationControllerOperation operation;

@end


@implementation NavigationControllerTransitionAnimate

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.45;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    UIView *containerView = [transitionContext containerView];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];

    if (self.operation == UINavigationControllerOperationPush) {
        
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
    } else if (self.operation == UINavigationControllerOperationPop) {
        
        fromVC.view.alpha = 1.0;
        fromVC.view.transform = CGAffineTransformIdentity;
        [containerView addSubview:toVC.view];
        [containerView addSubview:fromVC.view];//由于系统会自动把fromV吃
        
        [UIView animateWithDuration:0.2 animations:^{
            fromVC.view.transform = CGAffineTransformMakeScale(1.05, 1.05);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.25 animations:^{
                fromVC.view.alpha = 0.0;
                fromVC.view.transform = CGAffineTransformMakeScale(0.5, 0.5);
            } completion:^(BOOL finished) {
                if (finished) {
                    [fromVC.view removeFromSuperview];
                    [transitionContext completeTransition:YES];
                }
            }];
        }];
    }
}

@end






@interface CustomNavigationController () <UINavigationControllerDelegate>

@end

@implementation CustomNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate = self;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC  NS_AVAILABLE_IOS(7_0) {
    NavigationControllerTransitionAnimate *animate = [[NavigationControllerTransitionAnimate alloc] init];
    animate.operation = operation;
    return animate;
}




@end

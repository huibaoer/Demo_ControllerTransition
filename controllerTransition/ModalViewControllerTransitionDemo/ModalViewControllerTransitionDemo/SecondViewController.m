//
//  SecondViewController.m
//  ModalViewControllerTransitionDemo
//
//  Created by GrayLeo on 2017/4/28.
//  Copyright © 2017年 GrayLeo. All rights reserved.
//

#import "SecondViewController.h"

@interface PresentViewControllerAnimation : NSObject <UIViewControllerAnimatedTransitioning>
@property (nonatomic, assign) BOOL isPresent;
@end

@implementation PresentViewControllerAnimation

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.45;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    UIView *containerView = [transitionContext containerView];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    if (self.isPresent) {
        
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
    } else {
        
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





@interface SecondViewController () <UIViewControllerTransitioningDelegate>

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.transitioningDelegate = self;
}

- (IBAction)dismissAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    PresentViewControllerAnimation *animation = [[PresentViewControllerAnimation alloc] init];
    animation.isPresent = YES;
    return animation;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    PresentViewControllerAnimation *animation = [[PresentViewControllerAnimation alloc] init];
    animation.isPresent = NO;
    return animation;
}

@end

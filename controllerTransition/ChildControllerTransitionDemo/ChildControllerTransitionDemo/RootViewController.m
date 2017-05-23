//
//  RootViewController.m
//  ContainerViewController
//
//  Created by GrayLeo on 2017/5/3.
//  Copyright © 2017年 GrayLeo. All rights reserved.
//

#import "RootViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface RootViewController () <UINavigationControllerDelegate>

@property (nonatomic, weak) UIViewController *currentVC;
@property (strong, nonatomic) IBOutlet UIView *containerView;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    FirstViewController *first = [[FirstViewController alloc] init];
    [self addChildViewController:first];
    [self.containerView addSubview:first.view];
    _currentVC = first;
}

- (void)replaceViewController:(UIViewController *)oldVC newViewController:(UIViewController *)newVC {
    [self addChildViewController:newVC];
    newVC.view.frame = _containerView.bounds;
    [oldVC willMoveToParentViewController:nil];
    [self transitionFromViewController:oldVC toViewController:newVC duration:0.45 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        newVC.view.alpha = 0.0;
        newVC.view.transform = CGAffineTransformMakeScale(0.5, 0.5);
        
        [UIView animateWithDuration:0.25 animations:^{
            newVC.view.alpha = 1.0;
            newVC.view.transform = CGAffineTransformMakeScale(1.05, 1.05);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.2 animations:^{
                newVC.view.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {
            }];
        }];

    } completion:^(BOOL finished) {
        if (finished) {
            [oldVC removeFromParentViewController];
            [newVC didMoveToParentViewController:self];
            _currentVC = newVC;
        }
    }];
}

- (IBAction)buttonAction:(UIButton *)sender {
    NSString *className = nil;
    switch (sender.tag) {
        case 1000: {
            className = @"FirstViewController";
            break;
        }
        case 1001: {
            className = @"SecondViewController";
            break;
        }
        case 1002: {
            className = @"ThirdViewController";
            break;
        }
        default:
            break;
    }
    if (className) {
        UIViewController *newVC = [[NSClassFromString(className) alloc] init];
        [self replaceViewController:_currentVC newViewController:newVC];
    }
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    //set frame
    _currentVC.view.frame = _containerView.bounds;
}



@end

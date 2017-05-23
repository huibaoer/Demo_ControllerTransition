//
//  BaseViewController.m
//  ContainerViewController
//
//  Created by GrayLeo on 2017/5/3.
//  Copyright © 2017年 GrayLeo. All rights reserved.
//

#import "BaseViewController.h"

#define LogFunction NSLog(@"%@ : %s", NSStringFromClass([self class]), __FUNCTION__);

@interface BaseViewController () 

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)addChildViewController:(UIViewController *)childController NS_AVAILABLE_IOS(5_0) {
    [super addChildViewController:childController];
    LogFunction
}

- (void)removeFromParentViewController NS_AVAILABLE_IOS(5_0) {
    [super removeFromParentViewController];
    LogFunction
}

- (void)willMoveToParentViewController:(nullable UIViewController *)parent NS_AVAILABLE_IOS(5_0) {
    [super willMoveToParentViewController:parent];
    LogFunction
}

- (void)didMoveToParentViewController:(nullable UIViewController *)parent NS_AVAILABLE_IOS(5_0) {
    [super didMoveToParentViewController:parent];
    LogFunction
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    LogFunction
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    LogFunction
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    LogFunction
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    LogFunction
}

- (void)viewWillLayoutSubviews NS_AVAILABLE_IOS(5_0) {
    [super viewWillLayoutSubviews];
    LogFunction
}

- (void)viewDidLayoutSubviews NS_AVAILABLE_IOS(5_0) {
    [super viewDidLayoutSubviews];
    LogFunction
}


@end

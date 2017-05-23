//
//  RootViewController.m
//  NavigationControllerTransitionDemo
//
//  Created by GrayLeo on 2017/4/27.
//  Copyright © 2017年 GrayLeo. All rights reserved.
//

#import "RootViewController.h"
#import "SecondViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)pushAction:(id)sender {
    SecondViewController *second = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:second animated:YES];
}


@end

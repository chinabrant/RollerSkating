//
//  BaseNavigationViewController.m
//  RollerSkating
//
//  Created by wusj on 14-3-20.
//  Copyright (c) 2014年 brant. All rights reserved.
//

#import "BaseNavigationViewController.h"
#import "SJTabBarViewController.h"
#import "BaseViewController.h"

@interface BaseNavigationViewController ()

@end

@implementation BaseNavigationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    SJTabBarViewController *tbVC = (SJTabBarViewController *) self.tabBarController;
    [tbVC hideTabBar:((BaseViewController *) viewController).hideTabBar];
    NSLog(@"push");
    [super pushViewController:viewController animated:animated];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
    SJTabBarViewController *tbVC = (SJTabBarViewController *) self.tabBarController;
    [tbVC hideTabBar:NO];
    
    return [super popViewControllerAnimated:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  AppDelegate.m
//  RollerSkating
//
//  Created by wusj on 14-2-20.
//  Copyright (c) 2014年 brant. All rights reserved.
//

#import "AppDelegate.h"
#import "TestViewController.h"
#import "HomeViewController.h"
#import "AroundViewController.h"
#import "MeViewController.h"
#import "SJTabBarViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // 注册AVOS Cloud
    [AVOSCloud setApplicationId:@"tzpk1b0ugq2my4yspu01awep83yvsjplp3graz7u280flse8" clientKey:@"attw7lf4rfv65ccud72k3x93cbuajydphtayiukayxg6f1ox"];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
//    TestViewController *test = [[TestViewController alloc] init];
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:test];
//    self.window.rootViewController = nav;
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    HomeViewController *home = [[HomeViewController alloc] init];
    home.title = @"首页";
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:home];
    homeNav.title = @"首页";
    UITabBarItem *homeItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:[UIImage imageNamed:@"tabbar_home"] tag:100];
    homeNav.tabBarItem = homeItem;
    
    AroundViewController *around = [[AroundViewController alloc] init];
    around.title = @"附近";
    UINavigationController *aroundNav = [[UINavigationController alloc] initWithRootViewController:around];
    aroundNav.title = @"附近";
    UITabBarItem *aroundItem = [[UITabBarItem alloc] initWithTitle:@"附近" image:[UIImage imageNamed:@"tabbar_around"] tag:100];
    aroundNav.tabBarItem = aroundItem;
    
    MeViewController *me = [[MeViewController alloc] init];
    me.title = @"我";
    UINavigationController *meNav = [[UINavigationController alloc] initWithRootViewController:me];
    UITabBarItem *meItem = [[UITabBarItem alloc] initWithTitle:@"我" image:[UIImage imageNamed:@"tabbar_user"] tag:100];
    meNav.tabBarItem = meItem;
    
    [tabBarController setViewControllers:@[homeNav, aroundNav, meNav]];
//    self.window.rootViewController = tabBarController;
    
    SJTabBarViewController *sj = [[SJTabBarViewController alloc] init];
    self.window.rootViewController = sj;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    return [AVOSCloudSNS handleOpenURL:url];
}

@end

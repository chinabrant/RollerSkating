//
//  HomeViewController.m
//  RollerSkating
//
//  Created by wusj on 14-3-19.
//  Copyright (c) 2014年 brant. All rights reserved.
//

#import "HomeViewController.h"
#import "LoginViewController.h"
#import "UserManager.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

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

    UIBarButtonItem *logoutButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(logout)];
    self.navigationItem.rightBarButtonItem = logoutButton;
    
//    [UserManager followeeWithUserObjectID:@"532651ffe4b0e7cd84b69be6" andCallback:^(BOOL succeeded, NSError *error) {
//        if (succeeded) {
//            NSLog(@"关注成功");
//        } else {
//            NSLog(@"关注失败");
//            if (error.code == kAVErrorDuplicateValue) {
//                //            //重复关注
//                NSLog(@"已关注此用户");
//            }
//        }
//    }];
}

- (void)logout {
    [AVUser logOut];
}

- (void)viewWillAppear:(BOOL)animated {
    if (![AVUser currentUser]) {
        LoginViewController *login = [[LoginViewController alloc] init];
        [self presentViewController:login animated:YES completion:^{
            NSLog(@"completion");
        }];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

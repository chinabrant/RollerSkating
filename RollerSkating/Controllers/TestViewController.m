//
//  TestViewController.m
//  RollerSkating
//
//  Created by wusj on 14-2-20.
//  Copyright (c) 2014年 brant. All rights reserved.
//

#import "TestViewController.h"
#import <AVOSCloudSNS/AVOSCloudSNS.h>
#import "RegisterViewController.h"
#import "LoginViewController.h"
#import <AVOSCloudSNS/AVUser+SNS.h>

@interface TestViewController ()

@end

@implementation TestViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginClicked:(id)sender {
    [AVOSCloudSNS setupPlatform:AVOSCloudSNSSinaWeibo withAppKey:@"2475282962" andAppSecret:@"c69d0a819aec269a65194a5d363812c6" andRedirectURI:@"http://www.yurengame.com"];

    [AVOSCloudSNS loginWithCallback:^(id object, NSError *error) {
        //
        dispatch_async(dispatch_get_main_queue(), ^{
            if (object) {
                [AVUser loginWithAuthData:object block:^(AVUser *user, NSError *error) {
                    
                    //返回AVUser
                }];
                NSLog(@"新浪微博登录成功");
            } else {
                NSLog(@"新浪微博登录失败");
            }
        });
        
        
    } toPlatform:AVOSCloudSNSSinaWeibo];
    
}

- (IBAction)signupButtonClicked:(id)sender {
    LoginViewController *registerVC = [[LoginViewController alloc] init];
    [self.navigationController pushViewController:registerVC animated:YES];
}

- (IBAction)sendStatusClicked:(id)sender {
    AVUser *user = [AVUser currentUser];
}

@end

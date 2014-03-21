//
//  LoginViewController.m
//  RollerSkating
//
//  Created by wusj on 14-3-7.
//  Copyright (c) 2014年 brant. All rights reserved.
//

#import "LoginViewController.h"


@interface LoginViewController () {
    CGRect labelFrame;
    CGRect sinaFrame;
    CGRect qqFrame;
}

@end

@implementation LoginViewController

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
    labelFrame = self.topLabel.frame;
    sinaFrame = self.sinaButton.frame;
    qqFrame = self.qqButton.frame;
    self.topLabel.y = self.view.size.height;
    self.sinaButton.y = self.view.size.height;
    self.qqButton.y = self.view.height;
}

- (void)viewDidAppear:(BOOL)animated {
    [UIView animateWithDuration:2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.topLabel.frame = labelFrame;
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:2.4 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.sinaButton.frame = sinaFrame;
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:2.7 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.qqButton.frame = qqFrame;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginButtonClicked:(id)sender {
    NSString *username = self.usernameField.text;
    NSString *password = self.passwordField.text;
    [AVUser logInWithUsernameInBackground:username password:password block:^(AVUser *user, NSError *error) {
        if (user) {
            NSLog(@"登录成功");
        } else {
            NSLog(@"登录失败 %@", [error userInfo]);
        }
    }];
}

- (IBAction)registerButtonClicked:(id)sender {
//    RegisterViewController *rvc = [[RegisterViewController alloc] init];
//    [self.navigationController pushViewController:rvc animated:YES];
}

- (IBAction)sinaButtonClicked:(id)sender {
    [AVOSCloudSNS setupPlatform:AVOSCloudSNSSinaWeibo withAppKey:@"2475282962" andAppSecret:@"c69d0a819aec269a65194a5d363812c6" andRedirectURI:@"http://www.yurengame.com"];
    
    [AVOSCloudSNS loginWithCallback:^(id object, NSError *error) {
        //
        dispatch_async(dispatch_get_main_queue(), ^{
            if (object) {
                [AVUser loginWithAuthData:object block:^(AVUser *user, NSError *error) {
                    if (user) {
                        NSString *username = [object valueForKey:@"username"];
                        NSString *imgUrl = [object valueForKey:@"avatar"];
                        NSLog(@"新浪微博登录成功 username: %@ \n imageUrl : %@", username, imgUrl);
                        if ([user valueForKey:@"nickname"] == nil) {
                            [user setObject:username forKey:@"nickname"];
                            [user saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                                if (succeeded) {
                                    [self dismissViewControllerAnimated:YES completion:^{
                                        
                                    }];
                                }
                            }];
                        } else {
                            [self dismissViewControllerAnimated:YES completion:^{
                                
                            }];
                        }
                        
                        
                    }
                    //返回AVUser
                }];
                
            } else {
                NSLog(@"新浪微博登录失败");
            }
        });
        
    } toPlatform:AVOSCloudSNSSinaWeibo];
}

- (IBAction)qqButtonClicked:(id)sender {
    [AVOSCloudSNS setupPlatform:AVOSCloudSNSQQ withAppKey:@"101044486" andAppSecret:@"5cfad0f7d97b6b2175f8431c9581e4f8" andRedirectURI:nil]; // @"http://www.yurengame.com"];
    
    [AVOSCloudSNS loginWithCallback:^(id object, NSError *error) {
        //
        dispatch_async(dispatch_get_main_queue(), ^{
            if (object) {
                [AVUser loginWithAuthData:object block:^(AVUser *user, NSError *error) {
                    if (user) {
                        NSString *username = [object valueForKey:@"username"];
                        NSString *imgUrl = [object valueForKey:@"avatar"];
                        NSLog(@"QQ登录成功 username: %@ \n imageUrl : %@", username, imgUrl);
                        if ([user valueForKey:@"nickname"] == nil) {
                            [user setObject:username forKey:@"nickname"];
                            [user saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                                if (succeeded) {
                                    [self dismissViewControllerAnimated:YES completion:^{
                                        
                                    }];
                                }
                            }];
                        } else {
                            [self dismissViewControllerAnimated:YES completion:^{
                                
                            }];
                        }
                        
                        
                    }
                    //返回AVUser
                }];
                
            } else {
                NSLog(@"QQ登录失败");
            }
        });
        
    } toPlatform:AVOSCloudSNSQQ];
}

@end

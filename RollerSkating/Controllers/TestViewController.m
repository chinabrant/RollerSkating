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
    [AVOSCloudSNS setupPlatform:AVOSCloudSNSSinaWeibo withAppKey:@"3410250485" andAppSecret:@"31071e68b7e9b3e5711e2c198ee36ce1" andRedirectURI:@"https://api.weibo.com/oauth2/default.html"];
    
    [AVOSCloudSNS loginWithCallback:^(id object, NSError *error) {
        //you code here
    } toPlatform:AVOSCloudSNSSinaWeibo];
    
}

- (IBAction)signupButtonClicked:(id)sender {
    RegisterViewController *registerVC = [[RegisterViewController alloc] init];
    [self.navigationController pushViewController:registerVC animated:YES];
}
@end

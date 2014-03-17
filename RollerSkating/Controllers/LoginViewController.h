//
//  LoginViewController.h
//  RollerSkating
//
//  Created by wusj on 14-3-7.
//  Copyright (c) 2014年 brant. All rights reserved.
//

#import "BaseViewController.h"

@interface LoginViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

- (IBAction)loginButtonClicked:(id)sender;
- (IBAction)registerButtonClicked:(id)sender;
- (IBAction)sinaButtonClicked:(id)sender;
- (IBAction)qqButtonClicked:(id)sender;
@end

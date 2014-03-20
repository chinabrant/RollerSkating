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
@property (weak, nonatomic) IBOutlet UILabel *topLabel;
@property (weak, nonatomic) IBOutlet UIButton *sinaButton;
@property (weak, nonatomic) IBOutlet UIButton *qqButton;

- (IBAction)loginButtonClicked:(id)sender;
- (IBAction)registerButtonClicked:(id)sender;
- (IBAction)sinaButtonClicked:(id)sender;
- (IBAction)qqButtonClicked:(id)sender;
@end

//
//  MeViewController.h
//  RollerSkating
//
//  Created by wusj on 14-3-20.
//  Copyright (c) 2014年 brant. All rights reserved.
//

#import "BaseViewController.h"

@interface MeViewController : BaseViewController <UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIImageView *topBackImageView;
@property (weak, nonatomic) IBOutlet UIScrollView *backScrollView;

- (IBAction)followeeClicked:(id)sender;
- (IBAction)followerClicked:(id)sender;
- (IBAction)myStatusClicked:(id)sender;

@end

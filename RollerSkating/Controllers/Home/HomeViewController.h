//
//  HomeViewController.h
//  RollerSkating
//
//  Created by wusj on 14-3-19.
//  Copyright (c) 2014年 brant. All rights reserved.
//

#import "BaseViewController.h"
#import "HomeCell.h"

@interface HomeViewController : BaseViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

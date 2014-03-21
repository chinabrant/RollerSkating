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
#import <AVOSCloud/AVQuery.h>

@interface HomeViewController () {
    NSMutableArray *statusArray;
}

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        statusArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    UIBarButtonItem *logoutButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(logout)];
    self.navigationItem.rightBarButtonItem = logoutButton;
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    // 读取收件箱
//    [AVStatus getStatusesWithType:kAVStatusTypeTimeline skip:0 limit:10 andCallback:^(NSArray *objects, NSError *error) {
//        NSLog(@"statuses : %@", objects);
//        for (AVStatus *status in objects) {
//            NSLog(@"状态内容 : %@", [status.data valueForKey:@"text"]);
//            NSLog(@"发表人    : %@", [status.source valueForKey:@"nickname"]);
//            
//        }
//        
//        [statusArray addObjectsFromArray:objects];
//        [self.tableView reloadData];
//    }];
}

# pragma mark -
# pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return statusArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *Identifier = @"cell";
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HomeCell" owner:self options:nil] lastObject];
    }
    
    [cell bindData:[statusArray objectAtIndex:indexPath.row]];
    
    return cell;
}

# pragma mark -
# pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [HomeCell getCellHeightWithData:[statusArray objectAtIndex:indexPath.row]];
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

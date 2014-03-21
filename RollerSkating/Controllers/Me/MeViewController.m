//
//  MeViewController.m
//  RollerSkating
//
//  Created by wusj on 14-3-20.
//  Copyright (c) 2014年 brant. All rights reserved.
//

#import "MeViewController.h"
#import "UserManager.h"
#import "StatusManager.h"
#import "MyTeamViewController.h"
#import "MyStatusesViewController.h"

@interface MeViewController () {

}

@end

@implementation MeViewController

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
    
    self.topBackImageView.image = [UIImage imageNamed:@"top_back_image"];
    self.backScrollView.bounces = YES;
    self.backScrollView.contentSize = CGSizeMake(320, 600);
    self.backScrollView.delegate = self;
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.usernameLabel.text = [[AVUser currentUser] objectForKey:@"nickname"];
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = YES;
}

# pragma mark -
# pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    NSLog(@"%f", scrollView.contentOffset.y);
    if (scrollView.contentOffset.y < 0) {
        self.topBackImageView.y = scrollView.contentOffset.y / 2.0 - 100;
    }
}

# pragma mark -
# pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        cell.textLabel.text = @"我的轮滑队";
        return cell;
    } else if (indexPath.section == 1) {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        cell.textLabel.text = @"设置";
        return cell;
    }
    
    return nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

# pragma mark -
# pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.section) {
        case 0: {
            MyTeamViewController *myTeam = [[MyTeamViewController alloc] init];
            myTeam.hideTabBar = YES;
            [self.navigationController pushViewController:myTeam animated:YES];
            break;
        }
            
        case 1: {
//            [StatusManager sendTimelineStatus:@"一条测试状态,发一条长点的来测试一下换行效果，要再长一点，差不多了。。。" withCallback:^(BOOL succeeded, NSError *error) {
//                if (succeeded) {
//                    NSLog(@"发表成功");
//                } else {
//                    NSLog(@"状态发表失败");
//                }
//            }];
            
//            [UserManager followeeWithUserObjectID:@"53287319e4b0bb08e1878df0" andCallback:^(BOOL succeeded, NSError *error) {
//                if (succeeded) {
//                    NSLog(@"关注成功");
//                } else {
//                    NSLog(@"关注失败");
//                }
//            }];
            break;
        }
            
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 我关注的人
- (IBAction)followeeClicked:(id)sender {
    [UserManager getFolloweesWithBlock:^(NSArray *objects, NSError *error) {
        NSLog(@"followees : %@", objects);
        for (int i = 0; i < objects.count; i++) {
            AVUser *user = [objects objectAtIndex:i];
            NSLog(@"username : %@", [user valueForKey:@"username"]);
        }
    }];
}

// 关注我的人
- (IBAction)followerClicked:(id)sender {
    [UserManager getFollowersWithBlock:^(NSArray *objects, NSError *error) {
        NSLog(@"followers : %@", objects);
    }];
}

// 我的发件箱
- (IBAction)myStatusClicked:(id)sender {
    MyStatusesViewController *myStatus = [[MyStatusesViewController alloc] init];
    myStatus.hideTabBar = YES;
    [self.navigationController pushViewController:myStatus animated:YES];
}

@end

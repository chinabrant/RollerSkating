//
//  SJTabBarViewController.m
//  RollerSkating
//
//  Created by wusj on 14-3-19.
//  Copyright (c) 2014年 brant. All rights reserved.
//

#import "SJTabBarViewController.h"
#import "HomeViewController.h"
#import "AroundViewController.h"
#import "MeViewController.h"
#import "ActivityViewController.h"
#import "BaseNavigationViewController.h"

@interface SJTabBarViewController () {
    UIView *tabBarView;
    int currentSelectedIndex;
    PopCoverView *popCoverView;
}

@end

@implementation SJTabBarViewController

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
	// Do any additional setup after loading the view.
    self.tabBar.hidden = YES;
    
    HomeViewController *home = [[HomeViewController alloc] init];
    home.title = @"首页";
    BaseNavigationViewController *homeNav = [[BaseNavigationViewController alloc] initWithRootViewController:home];
    homeNav.title = @"首页";
    UITabBarItem *homeItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:[UIImage imageNamed:@"tabbar_home"] tag:100];
    homeNav.tabBarItem = homeItem;
    
    AroundViewController *around = [[AroundViewController alloc] init];
    around.title = @"附近66";
    BaseNavigationViewController *aroundNav = [[BaseNavigationViewController alloc] initWithRootViewController:around];
    aroundNav.title = @"附近66";
    UITabBarItem *aroundItem = [[UITabBarItem alloc] initWithTitle:@"附近66" image:[UIImage imageNamed:@"tabbar_around"] tag:100];
    aroundNav.tabBarItem = aroundItem;
    
    ActivityViewController *activity = [[ActivityViewController alloc] init];
    activity.title = @"活动";
    BaseNavigationViewController *activityNav = [[BaseNavigationViewController alloc] initWithRootViewController:activity];
    activityNav.title = @"活动";
    
    MeViewController *me = [[MeViewController alloc] init];
    me.title = @"我";
    BaseNavigationViewController *meNav = [[BaseNavigationViewController alloc] initWithRootViewController:me];
    UITabBarItem *meItem = [[UITabBarItem alloc] initWithTitle:@"我" image:[UIImage imageNamed:@"tabbar_user"] tag:100];
    meNav.tabBarItem = meItem;
    
    [self setViewControllers:@[homeNav, aroundNav, activityNav, meNav]];
    
    [self createTabBar];
}

- (void)hideTabBar:(BOOL)hide {
    if (hide) {
        tabBarView.hidden = YES;
    } else {
        tabBarView.hidden = NO;
    }
}

- (void)createTabBar {
    tabBarView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 44, self.view.width, 44)];
    tabBarView.frame = self.tabBar.frame;
    tabBarView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    
    SJTabBarItem *homeItem = [[SJTabBarItem alloc] initWithFrame:CGRectMake(0, 0, 60, 44) index:0];
    homeItem.delegate = self;
    homeItem.normalImage = [UIImage imageNamed:@"tabbar_home"];
    [homeItem setSelected:YES];
    [tabBarView addSubview:homeItem];
    
    SJTabBarItem *aroundItem = [[SJTabBarItem alloc] initWithFrame:CGRectMake(60, 0, 60, 44) index:1];
    aroundItem.delegate = self;
    aroundItem.normalImage = [UIImage imageNamed:@"tabbar_around"];
    [aroundItem setTitle:@"附近66"];
    [tabBarView addSubview:aroundItem];
    
    SJTabBarItem *activityItem = [[SJTabBarItem alloc] initWithFrame:CGRectMake(60 * 2 + 80, 0, 60, 44) index:2];
    activityItem.delegate = self;
    activityItem.normalImage = [UIImage imageNamed:@"tabbar_activity"];
    [activityItem setTitle:@"活动"];
    [tabBarView addSubview:activityItem];
    
    SJTabBarItem *meItem = [[SJTabBarItem alloc] initWithFrame:CGRectMake(60 * 3 + 80, 0, 60, 44) index:3];
    meItem.delegate = self;
    meItem.normalImage = [UIImage imageNamed:@"tabbar_user"];
    [meItem setTitle:@"我"];
    [tabBarView addSubview:meItem];
    
    UIButton *addButton = [[UIButton alloc] initWithFrame:CGRectMake(60 * 2, 0, 80, 44)];
    [addButton setImage:[UIImage imageNamed:@"popover_group"] forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(addButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [tabBarView addSubview:addButton];
    
    [self.view addSubview:tabBarView];
}

- (void)addButtonClicked {
    PopCoverView *popCover = [[PopCoverView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight)];
    
    [self.view addSubview:popCover];
}

- (void)clickedTabBarItemAtIndex:(int)index {
//    NSLog(@"index : %d", index);
    if (currentSelectedIndex == index) {
        return;
    } else {
        currentSelectedIndex = index;
        NSArray *array = [tabBarView subviews];
        for (UIView *view in array) {
            if ([view isKindOfClass:[SJTabBarItem class]]) {
                SJTabBarItem *item = (SJTabBarItem *) view;
                if (item.index == index) {
                    [item setSelected:YES];
                } else {
                    [item setSelected:NO];
                }
            }
        }
    }
    
    switch (index) {
        case 0: {
            [self setSelectedIndex:0];
            break;
        }
            
        case 1: {
            [self setSelectedIndex:1];
            break;
        }
            
        case 2: {
            [self setSelectedIndex:2];
            break;
        }
            
        case 3: {
            [self setSelectedIndex:3];
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

@end

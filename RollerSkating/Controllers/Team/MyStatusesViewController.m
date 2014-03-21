//
//  MyStatusesViewController.m
//  RollerSkating
//
//  Created by wusj on 14-3-21.
//  Copyright (c) 2014年 brant. All rights reserved.
//

#import "MyStatusesViewController.h"

@interface MyStatusesViewController ()

@end

@implementation MyStatusesViewController

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
    [AVStatus getStatusesFromCurrentUserWithType:kAVStatusTypeTimeline skip:0 limit:10 andCallback:^(NSArray *objects, NSError *error) {
        NSLog(@"statuses : %@", objects);
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidDisappear:(BOOL)animated {
    self.navigationController.navigationBarHidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

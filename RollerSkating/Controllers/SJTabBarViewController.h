//
//  SJTabBarViewController.h
//  RollerSkating
//
//  Created by wusj on 14-3-19.
//  Copyright (c) 2014年 brant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SJTabBarItem.h"
#import "PopCoverView.h"

@interface SJTabBarViewController : UITabBarController <SJTabBarItemDelegate>

- (void)hideTabBar:(BOOL)hide;

@end

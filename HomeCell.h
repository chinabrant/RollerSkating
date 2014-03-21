//
//  HomeCell.h
//  RollerSkating
//
//  Created by wusj on 14-3-21.
//  Copyright (c) 2014年 brant. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

- (void)bindData:(AVStatus *)status;
+ (CGFloat)getCellHeightWithData:(AVStatus *)status;

@end

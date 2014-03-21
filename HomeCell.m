//
//  HomeCell.m
//  RollerSkating
//
//  Created by wusj on 14-3-21.
//  Copyright (c) 2014年 brant. All rights reserved.
//

#import "HomeCell.h"

@implementation HomeCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)bindData:(AVStatus *)status {
    self.contentLabel.numberOfLines = 0;
    self.usernameLabel.text = [status.source valueForKey:@"nickname"];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:SS";
    self.timeLabel.text = [formatter stringFromDate:status.createdAt];
    
    self.height = [HomeCell getCellHeightWithData:status];
    self.contentLabel.y = 49;
    self.contentLabel.backgroundColor = [UIColor orangeColor];
    self.contentLabel.height = [CommonFunction getStringHeightWithFont:[UIFont systemFontOfSize:17] width:305 string:[status.data valueForKey:@"text"]] + 15;
    self.contentLabel.text = [status.data valueForKey:@"text"];
}

+ (CGFloat)getCellHeightWithData:(AVStatus *)status {
    return 44 + 5 + [CommonFunction getStringHeightWithFont:[UIFont systemFontOfSize:17] width:305 string:[status.data valueForKey:@"text"]] + 10;
}

@end

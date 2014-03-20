//
//  PopCoverView.m
//  RollerSkating
//
//  Created by wusj on 14-3-20.
//  Copyright (c) 2014年 brant. All rights reserved.
//

#import "PopCoverView.h"

@implementation PopCoverView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    
    UIButton *closeButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    closeButton.centerX = self.width / 2.0;
    closeButton.centerY = self.height - 70;
    [closeButton addTarget:self action:@selector(closeButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [closeButton setImage:[UIImage imageNamed:@"popover_group"] forState:UIControlStateNormal];
    [self addSubview:closeButton];
}

- (void)closeButtonClicked {
    [self removeFromSuperview];
}

@end

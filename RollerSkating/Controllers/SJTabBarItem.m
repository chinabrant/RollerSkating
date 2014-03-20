//
//  SJTabBarItem.m
//  RollerSkating
//
//  Created by wusj on 14-3-20.
//  Copyright (c) 2014年 brant. All rights reserved.
//

#import "SJTabBarItem.h"
#define DEFAULT_SELECTED_COLOR [UIColor redColor]

@interface SJTabBarItem () {
    
    UIColor *normalColor;
    UIColor *selectedColor;
    UIImageView *imageView;
    UILabel *label;
}

@end

@implementation SJTabBarItem

- (id)initWithFrame:(CGRect)frame index:(int)ind
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setupViews];
        self.index = ind;
    }
    return self;
}

- (void)setNormalImage:(UIImage *)normalImage {
    _normalImage = normalImage;
    [imageView setImage:normalImage];
}

- (void)setSelected:(BOOL)selected {
    if (selected) {
        label.textColor = DEFAULT_SELECTED_COLOR;
    } else {
        label.textColor = [UIColor blackColor];
    }
}

- (void)setTitle:(NSString *)title {
    label.text = title;
}

- (void)setupViews {
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    imageView.centerX = self.frame.size.width / 2.0;
    imageView.image = [UIImage imageNamed:@"tabbar_home"];
    label = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, self.width, 14)];
    label.text = @"首页";
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:15];
    [self addSubview:imageView];
    [self addSubview:label];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clicked)];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:tap];
}

- (void)clicked {
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickedTabBarItemAtIndex:)]) {
        [self.delegate clickedTabBarItemAtIndex:self.index];
    }
}

@end

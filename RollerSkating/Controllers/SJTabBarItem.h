//
//  SJTabBarItem.h
//  RollerSkating
//
//  Created by wusj on 14-3-20.
//  Copyright (c) 2014年 brant. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SJTabBarItemDelegate <NSObject>

- (void)clickedTabBarItemAtIndex:(int)index;

@end

@interface SJTabBarItem : UIView

@property (nonatomic, strong) UIImage *normalImage;
@property (nonatomic, strong) UIImage *selectedImage;
@property (nonatomic) int index;
@property (nonatomic) id <SJTabBarItemDelegate> delegate;

- (void)setTitle:(NSString *)title;
- (void)setSelected:(BOOL)selected;
- (id)initWithFrame:(CGRect)frame index:(int)ind;

@end

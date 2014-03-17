//
//  StatusManager.m
//  RollerSkating
//
//  Created by wusj on 14-3-17.
//  Copyright (c) 2014年 brant. All rights reserved.
//

#import "StatusManager.h"

@implementation StatusManager

+ (StatusManager *)sharedManager
{
    static StatusManager *sharedStatusManagerInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedStatusManagerInstance = [[super allocWithZone:NULL] init];
    });
    
    return sharedStatusManagerInstance;
}

+ (instancetype) allocWithZone:(struct _NSZone *)zone
{
    return [self sharedManager];
}

- (void)sendTimelineStatus:(NSString *)message {
    AVStatus *status = [[AVStatus alloc] init];
    status.data = @{@"text" : message};
    [AVStatus sendStatusToFollowers:status andCallback:^(BOOL succeeded, NSError *error) {
        NSLog(@"============ Send %@", [status debugDescription]);
    }];
}

// 给关注用户发送一条时间线状态
- (void)sendTimelineStatus:(NSString *)message withCallback:(AVBooleanResultBlock)callback {
    AVStatus *status = [[AVStatus alloc] init];
    status.data = @{@"text" : message};
    [AVStatus sendStatusToFollowers:status andCallback:callback];
}

@end

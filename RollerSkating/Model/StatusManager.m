//
//  StatusManager.m
//  RollerSkating
//
//  Created by wusj on 14-3-17.
//  Copyright (c) 2014年 brant. All rights reserved.
//

#import "StatusManager.h"
#import <AVOSCloud/AVQuery.h>

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
+ (void)sendTimelineStatus:(NSString *)message withCallback:(AVBooleanResultBlock)callback {
    AVStatus *status = [[AVStatus alloc] init];
    status.data = @{@"text" : message};
    [AVStatus sendStatusToFollowers:status andCallback:callback];
}

- (void)getTimelineStatus {
//    AVStatusQuery *query=[AVStatus inboxQuery:kAVStatusTypePrivateMessage];
//    //限制50条
//    query.limit=50;
//    //限制1397这个messageId以前的, 如果不设置,默认为最新的
//    query.maxId=1397;
//    //需要同时附带发送者的数据
//    [query includeKey:@"source"];
//    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
//        //获得AVStatus数组
//    }];
}

@end

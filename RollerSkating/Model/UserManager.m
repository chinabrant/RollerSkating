//
//  UserManager.m
//  RollerSkating
//
//  Created by wusj on 14-3-20.
//  Copyright (c) 2014年 brant. All rights reserved.
//

#import "UserManager.h"

@implementation UserManager

+ (UserManager *)sharedManager
{
    static UserManager *sharedUserManagerInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedUserManagerInstance = [[super allocWithZone:NULL] init];
    });
    
    return sharedUserManagerInstance;
}

+ (instancetype) allocWithZone:(struct _NSZone *)zone
{
    return [self sharedManager];
}

+ (void)getFollowersWithBlock:(AVArrayResultBlock)block {
    NSString *userObjectID = [AVUser currentUser].objectId;
    //粉丝列表查询
    AVQuery *query= [AVUser followerQuery:userObjectID];
    [query findObjectsInBackgroundWithBlock:block];
}

+ (void)getFolloweesWithBlock:(AVArrayResultBlock)block {
    NSString *userObjectID = [AVUser currentUser].objectId;
    //关注列表查询
    AVQuery *query= [AVUser followeeQuery:userObjectID];
    [query findObjectsInBackgroundWithBlock:block];
}

// 关注
+ (void)followeeWithUserObjectID:(NSString *)userObjectID andCallback:(AVBooleanResultBlock)block {
    [[AVUser currentUser] follow:userObjectID andCallback:block];
     
//     ^(BOOL succeeded, NSError *error) {
//        if (error.code == kAVErrorDuplicateValue) {
//            //重复关注
//        }
//        
//    }];
}

// 取消关注
+ (void)unFollowWithUserObjectID:(NSString *)userObjectID andCallback:(AVBooleanResultBlock)block {
    [[AVUser currentUser] unfollow:userObjectID andCallback:block];
}

// TODO: 发一个退出广播
+ (void)logOut {
    [AVUser logOut];
}

@end

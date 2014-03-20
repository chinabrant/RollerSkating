//
//  UserManager.h
//  RollerSkating
//
//  Created by wusj on 14-3-20.
//  Copyright (c) 2014年 brant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserManager : NSObject

+ (UserManager *)sharedManager;
+ (void)logOut;
// 取粉丝列表
+ (void)getFollowersWithBlock:(AVArrayResultBlock)block;
// 取我关注的人列表
+ (void)getFolloweesWithBlock:(AVArrayResultBlock)block;

// 关注
+ (void)followeeWithUserObjectID:(NSString *)userObjectID andCallback:(AVBooleanResultBlock)block;
// 取消关注
+ (void)unFollowWithUserObjectID:(NSString *)userObjectID andCallback:(AVBooleanResultBlock)block;

@end

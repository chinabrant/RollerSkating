//
//  StatusManager.h
//  RollerSkating
//
//  Created by wusj on 14-3-17.
//  Copyright (c) 2014年 brant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StatusManager : NSObject

+ (StatusManager *)sharedManager;
- (void)sendTimelineStatus:(NSString *)message withCallback:(AVBooleanResultBlock)callback;

@end

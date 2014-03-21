//
//  CommonFunction.m
//  RollerSkating
//
//  Created by wusj on 14-3-7.
//  Copyright (c) 2014年 brant. All rights reserved.
//

#import "CommonFunction.h"

@implementation CommonFunction

+ (CGFloat)getStringHeightWithFont:(UIFont *)font width:(CGFloat)width string:(NSString *)tstring {
    CGSize size = CGSizeMake(width, 10000);
    //    获取当前文本的属性
//    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName,nil];
    // ios7方法，获取文本需要的size，限制宽度
//    CGSize  actualsize =[tstring boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    
    // ios7之前使用方法获取文本需要的size，7.0已弃用下面的方法。此方法要求font，与breakmode与之前设置的完全一致
    CGSize actualsize = [tstring sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByCharWrapping];
    NSLog(@"height : %f", actualsize.height);
    return actualsize.height;
}

@end

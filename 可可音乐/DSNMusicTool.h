//
//  DSNMusicTool.h
//  可可音乐
//
//  Created by 谢谦 on 16/3/1.
//  Copyright © 2016年 杜苏南. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DSNMusicTool : NSObject

+(BOOL)playWith:(NSString *)filename;
+(void)stopWith:(NSString *)filename;

@end

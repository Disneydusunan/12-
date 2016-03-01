//
//  DSNMusicTool.m
//  可可音乐
//
//  Created by 谢谦 on 16/3/1.
//  Copyright © 2016年 杜苏南. All rights reserved.
//

#import "DSNMusicTool.h"

@implementation DSNMusicTool
static NSMutableDictionary *_musics;
+(NSMutableDictionary *)musics
{
    if (!_musics) {
        _musics = [NSMutableDictionary dictionary];
    }
    return _musics;

}

//+(BOOL)playWith:(NSString *)filename
//{
//    if (!filename) {
//        <#statements#>
//    }
//
//
//}

@end

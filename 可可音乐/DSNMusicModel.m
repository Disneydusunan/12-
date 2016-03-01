//
//  DSNMusicModel.m
//  可可音乐
//
//  Created by 谢谦 on 16/3/1.
//  Copyright © 2016年 杜苏南. All rights reserved.
//

#import "DSNMusicModel.h"

@implementation DSNMusicModel

-(instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
+(instancetype)musicWithDic:(NSDictionary *)dic
{
    return [[self alloc]initWithDic:dic];
}
@end

//
//  DSNMusicModel.h
//  可可音乐
//
//  Created by 谢谦 on 16/3/1.
//  Copyright © 2016年 杜苏南. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DSNMusicModel : NSObject
@property (nonatomic,copy)NSString *time;
@property (nonatomic,copy)NSString *icon;
@property (nonatomic,copy)NSString *singericon;
@property (nonatomic,copy)NSString *singer;
@property (nonatomic,copy)NSString *filename;
@property (nonatomic,copy)NSString *name;

-(instancetype)initWithDic:(NSDictionary *)dic;
+(instancetype)musicWithDic:(NSDictionary *)dic;

@end

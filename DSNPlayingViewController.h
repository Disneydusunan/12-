//
//  DSNPlayingViewController.h
//  可可音乐
//
//  Created by 谢谦 on 16/3/1.
//  Copyright © 2016年 杜苏南. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DSNPlayingViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *singerView;
@property (weak, nonatomic) IBOutlet UIProgressView *barProgress;
@property (weak, nonatomic) IBOutlet UILabel *currentTime;
@property (weak, nonatomic) IBOutlet UILabel *totalTime;


@property (nonatomic,copy)NSString *filename;
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *icon;
@property (nonatomic,copy)NSString *total;
@property (nonatomic,copy)NSString *singer;
@end

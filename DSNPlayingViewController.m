//
//  DSNPlayingViewController.m
//  可可音乐
//
//  Created by 谢谦 on 16/3/1.
//  Copyright © 2016年 杜苏南. All rights reserved.
//

#import "DSNPlayingViewController.h"
#import "DSNMusicModel.h"
#import <AVFoundation/AVFoundation.h>

@interface DSNPlayingViewController ()
@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UILabel *singerNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *songNameLabel;
@property(nonatomic,strong)NSArray *musics;
@property (nonatomic,assign)int currentIndex;
@property (nonatomic,strong)AVAudioPlayer *player;
- (IBAction)playBTNClick:(UIButton *)sender;



@end

@implementation DSNPlayingViewController
{
    int flag;
    CADisplayLink *link ;

}
-(NSArray *)musics{
    if (!_musics) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"musics.plist" ofType:nil];
        NSArray *arr = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:arr.count];
        for(NSDictionary *dic in arr){
            DSNMusicModel *model = [DSNMusicModel musicWithDic:dic];
            [arrM addObject:model];
        
        }
        _musics = [arrM copy];
    }
    return _musics;

}


- (IBAction)play {
//    CADisplayLink *link = nil;
    flag+=1;
    if (flag%2==1) {
        [self.player play];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            link = [CADisplayLink displayLinkWithTarget:self selector:@selector(transformCircle)];
            [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
            
            [UIView animateWithDuration:1.0 animations:^{
                
                self.playButton.transform = CGAffineTransformRotate(self.playButton.transform, M_PI_4);
                
            }];
        });

    }else if(flag %2 == 0){
        [self.player pause];
        [link invalidate];
        
        [UIView animateWithDuration:1.0 animations:^{
            self.playButton.transform = CGAffineTransformRotate(self.playButton.transform, -M_PI_4);
        }];
    }


}
- (IBAction)back {
    [self.player stop];
//    [link invalidate];
    self.currentIndex--;
    if (self.currentIndex == self.musics.count) {
        self.currentIndex = 0;
    }
    [self.player play];
}
- (IBAction)forward {
    [self.player stop];
    
    self.currentIndex ++;
    if (self.currentIndex == 0) {
        self.currentIndex = (int)self.musics.count;
    }
    [self.player stop];
}

- (void)viewDidLoad {
    [super viewDidLoad];
       NSURL *url = [[NSBundle mainBundle]URLForResource:self.name withExtension:@".mp3"];
    self.player = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
    self.currentIndex = 0;
    

    [self initSubviews];
    // Do any additional setup after loading the view.
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"back"]) {
        [self.player stop];
    }


}
-(void)transformCircle{
    
    self.singerView.transform = CGAffineTransformRotate(self.singerView.transform, M_PI_2/100);

}
-(void)initSubviews
{
    self.singerView.layer.cornerRadius = 100;
    self.singerView.layer.masksToBounds = YES;
    self.singerView.layer.borderColor = [UIColor blackColor].CGColor;
    self.singerView.layer.borderWidth = 30;
    self.singerView.image = [UIImage imageNamed:self.icon];
    
    self.totalTime.text = self.total;
    self.singerNameLabel.text = self.singer;
    self.songNameLabel.text = self.name;
    
    self.playButton.transform = CGAffineTransformRotate(self.playButton.transform, -M_PI_4);
    
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(updatePro) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop]addTimer:timer forMode:NSRunLoopCommonModes];
    
}
-(void)updatePro{
    
    NSString *xiaoshi= [self.total substringToIndex:1];
    NSString *fenzhong = [self.total substringToIndex:2];
    int t = [xiaoshi intValue] *60 + [fenzhong intValue];
    self.barProgress.progress = self.player.currentTime/t;
    
    int currentFenzhong = (int)self.player.currentTime % 60;
    int currentXiaoshi = (int)self.player.currentTime /60;
    self.currentTime.text = [NSString stringWithFormat:@"0%d:%d",currentXiaoshi,currentFenzhong];;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)playBTNClick:(UIButton *)sender {
}
@end

//
//  DSNMusicTableViewController.m
//  可可音乐
//
//  Created by 谢谦 on 16/3/1.
//  Copyright © 2016年 杜苏南. All rights reserved.
//

#import "DSNMusicTableViewController.h"
#import "DSNMusicModel.h"
#import "DSNPlayingViewController.h"

@interface DSNMusicTableViewController ()
@property (nonatomic,strong)NSArray *musics;
@end

@implementation DSNMusicTableViewController
-(NSArray *)musics
{
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

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 80;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.musics.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    DSNMusicModel *model = self.musics[indexPath.row];
    cell.textLabel.text = model.singer;
    cell.detailTextLabel.text = model.name;
    
    
    cell.imageView.frame = CGRectMake(10, 0, 30, 30);
    cell.imageView.image = [UIImage imageNamed:model.singericon];
    cell.imageView.layer.masksToBounds = YES;
    cell.imageView.layer.cornerRadius = 40;
    cell.imageView.layer.borderColor = [UIColor greenColor].CGColor;
    cell.imageView.layer.borderWidth = 2;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DSNPlayingViewController *plaVC = [self.storyboard instantiateViewControllerWithIdentifier:@"playID"];
    [self.navigationController showViewController:plaVC sender:nil];
    

    DSNMusicModel *model = self.musics[indexPath.row];
    plaVC.icon = model.icon;
    plaVC.total = model.time;
    plaVC.name = model.name;
    plaVC.singer = model.singer;

}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

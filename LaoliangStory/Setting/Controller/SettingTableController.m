//
//  SettingTableViewController.m
//  LaoliangStory
//
//  Created by zjq on 15-10-22.
//  Copyright (c) 2015年 tens. All rights reserved.
//

#import "SettingTableController.h"
#import "MBProgressHUD.h"




@interface SettingTableController ()

@end

@implementation SettingTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


//统计缓存文件
- (CGFloat)countcachesfilesize
{
    NSString *cachesfilepaht = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)firstObject];
//    NSLog(@"%@",cachesfilepaht);
    
    NSFileManager *filemamager = [NSFileManager defaultManager];
    NSArray *allsubpath = [filemamager subpathsAtPath:cachesfilepaht];
    
   long long totalfilesize = 0;
    for (NSString *path  in allsubpath) {
        
        NSString *subpath = [cachesfilepaht stringByAppendingPathComponent:path];
        
        NSDictionary *fileattributes = [filemamager attributesOfItemAtPath:subpath error:nil];
        long filesize = [[fileattributes objectForKey:NSFileSize]longValue];
        totalfilesize += filesize;
    }
    
    
    return (CGFloat)totalfilesize/1024/1024;
    
}

//删除缓存文件
- (void)clearcachesfiles
{
    NSString *cachesfilepath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)firstObject];
    
    NSFileManager *filemamager = [NSFileManager defaultManager];
    NSArray *allsubpath = [filemamager subpathsAtPath:cachesfilepath];
    
    for (NSString *path in allsubpath) {
        
        NSString *subpath = [cachesfilepath stringByAppendingPathComponent:path];
        [filemamager removeItemAtPath:subpath error:nil];
    }
    
}


//清理缓存提示框
- (void)showHUDViewWithTitle:(NSString *)title
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:window];
    [window addSubview:HUD];
    HUD.mode = MBProgressHUDModeCustomView;
    HUD.labelText = title;
    HUD.removeFromSuperViewOnHide = YES;
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark"]];
    
    HUD.customView = imageView;
    [HUD show:YES];
    
    [HUD hide:YES afterDelay:1];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        return 2;
    }
    
    return 1;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{

    UILabel *sizeLabel = (UILabel *)[cell viewWithTag:1];
    
    sizeLabel.text = [NSString stringWithFormat:@"%.1f M",[self countcachesfilesize]];
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 1) {
        
        [self clearcachesfiles];
        
        [self showHUDViewWithTitle:@"清理完成！"];
    }
    
    [tableView reloadData];
    
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

//
//  HomeController.m
//  LaoliangStory
//
//  Created by tens on 15-10-19.
//  Copyright (c) 2015年 tens. All rights reserved.
//

#import "HomeViewController.h"
#import "StorydetailViewController.h"

#define imageWidth [TSWedth - 50]/2
#define imageHeight [imageWidth + 30]


@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *myScrollView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationController.navigationBar.tintColor = [UIColor redColor];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg_topbar"] forBarMetrics:UIBarMetricsDefault];
    // 设置字体的颜色和大小
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:20]}];
    
   // [self setScrollView];
   // [self addViewToScrollView];
    
    

}

#pragma mark-- 设置ScrollView
-(void)setScrollView{

    self.myScrollView.contentSize = CGSizeMake(TSWedth, TSHeight * 2);
}

-(void)addViewToScrollView
{

    for (int i = 0; i < 7 ; i++) {
        
    }
    
}




//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    StorydetailViewController *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"StorydetailViewController"];
//    [self.navigationController pushViewController:detail animated:YES];
//    
//}




@end

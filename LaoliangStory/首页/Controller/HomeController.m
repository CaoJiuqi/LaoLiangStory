//
//  HomeController.m
//  LaoliangStory
//
//  Created by tens on 15-10-19.
//  Copyright (c) 2015年 tens. All rights reserved.
//

#import "HomeController.h"
#import "ItemView.h"

#define imageWedth  (TSWedth - 50)/2
#define imageHeight imageWedth + 50

@interface HomeController ()<UIScrollViewDelegate>

{
    ItemView *view;

}


@property (weak, nonatomic) IBOutlet UIView *backgroundView;

@property (weak, nonatomic) IBOutlet UIScrollView *myScrollView;
@property (strong,nonatomic)NSMutableArray  *bgviewArray;
@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setScrollView];
    [self addItemViewToScrollView];

}


-(void)setScrollView
{
    int height = self.view.bounds.size.height +imageHeight -20  ;
    self.myScrollView.contentSize = CGSizeMake(TSWedth ,  height);
    self.myScrollView.delegate = self;
}

-(void)addItemViewToScrollView
{
    for (int i = 0; i < 7; i ++) {
        
        view = [[[NSBundle mainBundle]loadNibNamed:@"ItemView" owner:self options:nil]lastObject];
        view.tag = i;
        view.userInteractionEnabled = YES;
        CGFloat viewX = 0;
        CGFloat viewY = 10+ (i/2)* (imageHeight);

        if (i % 2 == 0) {
            viewX = 0 ;
        }else
        {
            viewX = imageWedth + 15 ;
        }
        view.frame = CGRectMake(15 + viewX,viewY , imageWedth, imageHeight);
        [self.myScrollView addSubview:view];
    }
}








@end

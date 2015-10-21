//
//  TSCollectionView.m
//  LaoliangStory
//
//  Created by tens on 15-10-20.
//  Copyright (c) 2015年 tens. All rights reserved.
//

#import "TSCollectionView.h"
#import "TSCollectionViewCell.h"
#import "CollectionViewCell.h"

static NSString *const pageID = @"cellID";


@interface TSCollectionView () <UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong)UICollectionView *collectView;



@end

@implementation TSCollectionView

-(void)awakeFromNib
{
   
//    [self.collnectView registerNib:[UINib nibWithNibName:@"CollectionViewCell.h" bundle:nil] forCellWithReuseIdentifier:pageID];
//    
//    self.collnectView.delegate = self;
    
//    self.backgroundColor =[UIColor blackColor];
    
    [self addSubview:self.collectView];
    
    
}

-(UICollectionView *)collectView
{
    if (_collectView == nil) {
        _collectView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:[[UICollectionViewFlowLayout alloc]init]];
        _collectView.frame = self.bounds;
        _collectView.backgroundColor = [UIColor redColor];
        _collectView.delegate = self;
        _collectView.dataSource = self;
    }
    return _collectView;
}




#pragma mark--<UICollectionViewDataSource,UICollectionViewDelegate>
/*
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 7;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TSCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:pageID forIndexPath:indexPath];
    return cell;
}
 */

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(100, 200);

}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(200, 200);

}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 21;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    
    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
//    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:pageID forIndexPath:indexPath];
//    
//    if (cell == nil) {
//        cell = [[UICollectionViewCell alloc]init];
//    }
    UICollectionViewCell *cell = [[UICollectionViewCell alloc]init];

    
    return  cell;
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 10, 5, 10);
}

@end

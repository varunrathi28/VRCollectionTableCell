//
//  ViewController.m
//  VRCollectionTableCell
//
//  Created by Varun Rathi on 17/05/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

#import "ViewController.h"
#import "VRCollectionTblCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma MARK - TableView Methods

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _arrColors.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString * cellIdentifier = @"TableCell";
    VRCollectionTblCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil)
    {
        cell = [[VRCollectionTblCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64;
}


-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    VRCollectionTblCell * customCell = (VRCollectionTblCell *)cell;
    [customCell setDatasourceWithObject:self withIndex:indexPath.row];
    NSInteger index = customCell.collectionView.index;
    CGFloat horizontalOffset = [self.offsetDic[[@(index) stringValue]] floatValue];
    [customCell.collectionView setContentOffset:CGPointMake(horizontalOffset, 0)];
}

-(void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    VRCollectionTblCell * customCell = (VRCollectionTblCell *)cell;
    CGFloat hOffset = customCell.collectionView.contentOffset.x;
    NSInteger index = customCell.collectionView.index;
    self.offsetDic[[@(index) stringValue]] = @(hOffset);
    
}

#pragma MARK - CollectionView Cell Methods

-(NSInteger)collectionView:(VRCustomCollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    NSArray * arrSectionColors = _arrColors[collectionView.index];
    return arrSectionColors.count;
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell" forIndexPath:indexPath];
    
    NSArray * sectionColor = _arrColors[indexPath.section];
    cell.backgroundColor = sectionColor[indexPath.item];
    
    return cell;
    
}

@end

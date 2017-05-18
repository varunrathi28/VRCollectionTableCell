//
//  VRCollectionTblCell.h
//  VRCollectionTableCell
//
//  Created by Varun Rathi on 18/05/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VRCustomCollectionView.h"

@interface VRCollectionTblCell : UITableViewCell

@property (nonatomic, strong) VRCustomCollectionView * collectionView;

-(void)setDatasourceWithObject:(id<UICollectionViewDelegate,UICollectionViewDataSource>)dataDelegate withIndex:(NSInteger)index;
@end

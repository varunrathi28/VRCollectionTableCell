//
//  VRCollectionTblCell.m
//  VRCollectionTableCell
//
//  Created by Varun Rathi on 18/05/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

#import "VRCollectionTblCell.h"

@implementation VRCollectionTblCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake(44, 44);
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        

        self.collectionView = [[VRCustomCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        self.collectionView.backgroundColor = [UIColor blackColor];
        [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"CollectionViewCell"];
        self.collectionView.showsHorizontalScrollIndicator = NO;
        [self.contentView addSubview:self.collectionView];
    
    }
    
    return self;
}

-(void)setDatasourceWithObject:(id<UICollectionViewDelegate,UICollectionViewDataSource>)dataDelegate withIndex:(NSInteger)index
{
    self.collectionView.delegate = dataDelegate;
    self.collectionView.dataSource = dataDelegate;
    [self.collectionView setContentOffset:self.collectionView.contentOffset animated:NO];
    self.collectionView.index  = index;
    [self.collectionView reloadData];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)layoutSubviews
{
    [super layoutSubviews ];
    self.collectionView.frame = self.contentView.bounds;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

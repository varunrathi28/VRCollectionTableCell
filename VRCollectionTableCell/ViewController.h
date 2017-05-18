//
//  ViewController.h
//  VRCollectionTableCell
//
//  Created by Varun Rathi on 17/05/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDataSource>

@property (nonatomic,strong) NSArray * arrColors;

@property (nonatomic,strong) NSMutableDictionary * offsetDic;

@property (nonatomic,weak) IBOutlet UITableView * tblView;
@end


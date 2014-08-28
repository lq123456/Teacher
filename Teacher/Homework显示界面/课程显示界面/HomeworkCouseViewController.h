//
//  HomeworkCouseViewController.h
//  Teacher
//
//  Created by CollegePre on 14-7-24.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionCell.h"
@interface HomeworkCouseViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong) IBOutlet UICollectionView *collView;
@property  (nonatomic,strong)         CollectionCell *  collcell;
@end


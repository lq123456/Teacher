//
//  AssignHomeworkViewController.h
//  Teacher
//
//  Created by CollegePre on 14-8-15.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionCell.h"
#import "AssignTableViewCell.h"
@interface AssignHomeworkViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UITableViewDelegate,UITableViewDataSource,delegate,AstableViewCelldelegate>
{

    int fg;

}
@property (nonatomic,strong) AssignTableViewCell *Assincell;
@property  (nonatomic,strong)         CollectionCell *  collcell;
@property (nonatomic,strong) IBOutlet UICollectionView *AScollView;
@property (nonatomic,strong) IBOutlet UITableView *tableClassView;
@property (nonatomic,strong) NSMutableArray *sutdentMutableArry;
@property (nonatomic,strong) NSString   * classNum;
-(void)ClassMutableArry:(NSMutableArray *)arr;
@end

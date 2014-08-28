//
//  CourseLessonHomeworkViewController.h
//  Teacher
//
//  Created by CollegePre on 14-8-22.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionCell.h"
@interface CourseLessonHomeworkViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong) IBOutlet UICollectionView *lessonView;
@property  (nonatomic,strong)         CollectionCell *  collcell;

@end

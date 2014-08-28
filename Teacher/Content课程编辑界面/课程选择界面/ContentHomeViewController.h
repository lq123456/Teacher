//
//  ContentHomeViewController.h
//  Teacher
//
//  Created by 罗强 on 14-7-22.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "oneViewController.h"
#import "ContentCell.h"
@interface ContentHomeViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{


}
@property (nonatomic,strong)       oneViewController *one;
@property (nonatomic,strong) IBOutlet UICollectionView *collView;
@property  (nonatomic,strong)         ContentCell *  collcell;
@property (nonatomic ,strong) UIButton *coursebutton;
@property (nonatomic,strong)  NSString * km;
@property (nonatomic,strong)  NSString * m;
@property (nonatomic,strong)  NSString *lablestring;
@end

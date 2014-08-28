//
//  CollectionCell.h
//  Teacher
//
//  Created by CollegePre on 14-8-15.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol delegate <NSObject>
-(void)Push:(int)indextPatn;
-(void)buttonItemBackColor:(int)indextPatn;
@end
@interface CollectionCell : UICollectionViewCell{

    int k;

}
@property(nonatomic,assign)id <delegate>Pushdelsgat;
@property (nonatomic ,strong) IBOutlet UIImageView *imageView;
@property (nonatomic ,strong) IBOutlet UILabel     *textLable;
@property(nonatomic,strong) IBOutlet UIButton *buttonItem;
@end

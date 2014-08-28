//
//  AssignTableViewCell.h
//  Teacher
//
//  Created by CollegePre on 14-8-17.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol AstableViewCelldelegate <NSObject>
-(void)addImageViewBackColorImage:(int)indextPatn;
-(void)removeImageViewBackColorImage:(int)indextPatn;
@end
@interface AssignTableViewCell : UITableViewCell
{
    int k;
}
@property (nonatomic ,assign)  id< AstableViewCelldelegate>celldelegate;
@property (nonatomic,strong) IBOutlet UIButton *buttonItem;
@property (nonatomic,strong) IBOutlet UILabel *lable;
@property (nonatomic,strong) IBOutlet UIImageView *imaView;
@end

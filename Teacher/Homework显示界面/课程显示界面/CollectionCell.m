//
//  CollectionCell.m
//  Teacher
//
//  Created by CollegePre on 14-8-15.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "CollectionCell.h"

@implementation CollectionCell
@synthesize buttonItem;
@synthesize Pushdelsgat;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        // 初始化时加载collectionCell.xib文件
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"CollectionCell" owner:self options:nil];
        // 如果路径不存在，return nil
        if (arrayOfViews.count < 1)
        {
            return nil;
        }
        // 如果xib中view不属于UICollectionViewCell类，return nil
        if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[UICollectionViewCell class]])
        {
            return nil;
        }
        // 加载nib
        self = [arrayOfViews objectAtIndex:0];
    }
    return self;
}
-(IBAction)btuuonItem:(UIButton*)sender
{
    int t=k++;
    if (t%2==0) {
        NSLog(@"1");
       [Pushdelsgat Push:sender.tag];
        self.backgroundColor=[UIColor grayColor];
        self.textLable.textColor=[UIColor redColor];
    }else{
        NSLog(@"2");
       [Pushdelsgat buttonItemBackColor:sender.tag];
       self.backgroundColor=[UIColor whiteColor];
       self.textLable.textColor=[UIColor blackColor];

    }

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

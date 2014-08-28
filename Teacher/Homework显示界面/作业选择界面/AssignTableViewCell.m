//
//  AssignTableViewCell.m
//  Teacher
//
//  Created by CollegePre on 14-8-17.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "AssignTableViewCell.h"

@implementation AssignTableViewCell
@synthesize lable;
@synthesize imaView;
@synthesize buttonItem;
@synthesize celldelegate;
- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(IBAction)tableViewCellbuttonItem:(UIButton *)sender
{
    int i=k++;
    if (i%2==0) {
     
        self.imaView.image=[UIImage imageNamed:@"icon_picked.png"];
        [celldelegate addImageViewBackColorImage:sender.tag];
        self.backgroundColor=[UIColor grayColor];
    }else{
        self.imaView.image=[UIImage imageNamed:@" "];
        [celldelegate removeImageViewBackColorImage:sender.tag];
        self.backgroundColor=[UIColor whiteColor];

    }

}
@end

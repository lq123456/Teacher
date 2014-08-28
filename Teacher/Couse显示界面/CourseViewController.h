//
//  CourseViewController.h
//  Teacher
//
//  Created by 罗强 on 14-7-22.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CourseViewController : UIViewController
@property(nonatomic,strong) NSString *string;
@property(nonatomic,strong) NSString *IP;
-(IBAction)push:(id)sender;
@property (nonatomic,strong) IBOutlet UILabel *nexttimeLabel;
@property (nonatomic,strong) IBOutlet UILabel *timeLabel;
@property (nonatomic,strong) NSString  *IPString;

@end

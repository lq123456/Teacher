//
//  HomeWorkOrganitzitionViewController.h
//  Teacher
//
//  Created by CollegePre on 14-8-13.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol HomeworkOrganiztiondelegate <NSObject>
-(void)HomeworkWep:(NSString *)Url;
-(void)Homeworkoder:(int)oder;
@end
@interface HomeWorkOrganitzitionViewController : UITableViewController
@property(nonatomic,assign)id <HomeworkOrganiztiondelegate>homeWorkdelegate;

@end

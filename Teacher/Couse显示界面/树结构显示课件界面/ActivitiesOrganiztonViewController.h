//
//  ActivitiesOrganiztonViewController.h
//  Teacher
//
//  Created by CollegePre on 14-8-13.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ActivitiesOrganiztiondelegate <NSObject>
-(void)ActivitiesWep:(NSString *)Url;
-(void)Activities:(int)oder part:(int)der;
@end
@interface ActivitiesOrganiztonViewController : UITableViewController
@property(nonatomic,assign)id <ActivitiesOrganiztiondelegate>Activitiesdelegate;

@property (nonatomic,strong) NSMutableArray                      *   AcNameArry;
@property (nonatomic,strong) NSMutableArray                      *   AcUrlArry;
-(void)AcNameArry:(NSMutableArray *)acname AcUrlArry:(NSMutableArray *)acurl;
-(void)Acswick:(int)num;
@end

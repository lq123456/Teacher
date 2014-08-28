//
//  ActivitiesButtonViewController.h
//  Teacher
//
//  Created by CollegePre on 14-8-5.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol delegateActivities <NSObject>
-(void)AcWepUrl:(NSString *)Url;
@end

@interface ActivitiesButtonViewController : UITableViewController
@property(nonatomic,assign)id <delegateActivities>delegatea;
@property (nonatomic,strong) NSMutableArray *namearry;
@property (nonatomic,strong) NSMutableArray *urlarry;
-(void)AcName:(NSArray *)name NcUrl:(NSArray *)url;
-(void)Json:(NSDictionary *)dimc;
@end

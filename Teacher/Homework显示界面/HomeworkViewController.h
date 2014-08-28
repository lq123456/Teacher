//
//  HomeworkViewController.h
//  Teacher
//
//  Created by 罗强 on 14-7-22.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeworkViewController : UIViewController<UITabBarDelegate,UITableViewDataSource>
@property (nonatomic,strong) IBOutlet  UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *HomeworkNameArry;
@end

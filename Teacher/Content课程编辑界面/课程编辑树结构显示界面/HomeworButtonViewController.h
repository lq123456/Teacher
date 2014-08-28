//
//  HomeworButtonViewController.h
//  Teacher
//
//  Created by CollegePre on 14-8-5.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol delegatehome <NSObject>
-(void)Homelink:(NSString *)linkString;
@end
@interface HomeworButtonViewController : UITableViewController
@property(nonatomic,assign)id <delegatehome>delegateurl;
//-(void)name:(NSArray *)arry url:(NSArray *)url;
@property (nonatomic,strong) NSMutableArray *namearry;
@property (nonatomic,strong) NSMutableArray *urlarry;
@end

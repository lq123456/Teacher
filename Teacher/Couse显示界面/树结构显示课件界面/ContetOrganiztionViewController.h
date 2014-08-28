//
//  ContetOrganiztionViewController.h
//  Teacher
//
//  Created by CollegePre on 14-8-13.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TQMultistageTableView.h"
@protocol ContetOrganiztiondelegate <NSObject>
-(void) Contetswich:(int)indextpah;
-(void)ContetWep:(NSString *)Url;
-(void)Contetelement:(NSArray *)url element:(int)number part:(int)partnumber;
@end
@interface ContetOrganiztionViewController : UIViewController<TQTableViewDataSource, TQTableViewDelegate>
@property (nonatomic, strong) TQMultistageTableView *mTableView;
@property(nonatomic,assign)id <ContetOrganiztiondelegate>Contetdelegate;

@property (nonatomic,strong) NSMutableArray                      *   PartNameArry;
@property (nonatomic,strong) NSMutableArray                      *   PartUrlArry;
@property (nonatomic,strong) NSMutableArray                      *   PartArry;

-(void)PartNameArry:(NSMutableArray *)partname PartUrlArry:(NSMutableArray *)url Part:(NSMutableArray *)part;
@end

//
//  TableViewController.h
//  Teacher
//
//  Created by CollegePre on 14-8-1.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TQMultistageTableView.h"
@protocol delegate <NSObject>
-(void) wepUrl:(NSString *)url;
-(void) swich:(int)indextpah;
-(void) ShoewHidden:(NSString *)text;
-(void) AddHidden;
-(void)ActiviJson:(NSDictionary *)dic;
-(void) AcNameArry:(NSArray *)acnamearry  AcUrl:(NSArray *)url;
@end
@interface TableViewController : UIViewController<TQTableViewDataSource, TQTableViewDelegate>
{

    int k;

}
@property(nonatomic,assign)id <delegate>delegatestring;

@property (nonatomic,strong) NSMutableArray *mutableArry;
@property (nonatomic,strong) NSMutableArray *ClassArry;
@property (nonatomic,strong) NSMutableArray *addArry;
@property (nonatomic, strong) TQMultistageTableView *mTableView;


// 确定点击partX的时候   另外2个tableview 里面将要显示的参数
@property (nonatomic,strong) NSMutableArray *aNameArry;
@property (nonatomic,strong) NSMutableArray *aUrlArry;
@property (nonatomic,strong) NSMutableArray *hNameArry;
@property (nonatomic,strong) NSMutableArray *hUrlArry;



@end

//
//  NoteDateViewController.h
//  Teacher
//
//  Created by CollegePre on 14-8-6.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMDatabase.h"
@protocol delegatenote <NSObject>
-(void)judgenote;
-(void)buttonkmt;
-(void)shouwButton;
-(void)ad:(int)m;
-(void)st:(NSString *)s;
-(void)note:(NSString *)note;
-(void)couse:(NSString *)text;
-(void)TextView:(NSString *)couse Patr:(NSString*)part Note:(NSString *)note;
@end
@interface NoteDateViewController : UIViewController
@property(nonatomic,assign)id <delegatenote>delegatehiden;
@property (nonatomic, strong) NSString *Course;
@property (nonatomic, strong) NSString *Content;
@property (nonatomic, strong) NSString *Part;
@property (nonatomic, strong) NSString *Note;
-(void)addNotes:(NSString *)course  Part:(NSString *)part Note:(NSString *)note;
-(void)ShowNotes:(NSString *)course  Part:(NSString *)part Note:(NSString *)note;
-(void)deleteNotes:(NSString *)course  Part:(NSString *)part Note:(NSString *)note;
-(void)updateNotes:(NSString *)course  Part:(NSString *)part Note:(NSString *)note;
//判断part是否有备注有备注就显示****如果有备注就显示备注按钮
-(void)notebutton:(NSString *)headName parename:(NSString *)parename;
-(void)notestring:(NSString *)headName parename:(NSString *)parename;
-(void)notes:(NSString *)headName parename:(NSString *)parename;
@end

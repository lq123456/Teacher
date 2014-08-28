//
//  OrganViewController.h
//  Teacher
//
//  Created by CollegePre on 14-8-13.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContetOrganiztionViewController.h"
#import "ActivitiesOrganiztonViewController.h"
#import "HomeWorkOrganitzitionViewController.h"
@protocol OrganViewDelegate <NSObject>
-(void)removeOrganView;
-(void)OrganViewNoteVieweText:(NSString *)text;
-(void) OrganContetswich:(int)indextpah;
-(void)WepUrl:(NSString *)url;
-(void)Activities:(int)oder part:(int)der;
-(void)Homeworkoder:(int)oder;
-(void)Contetelement:(NSArray *)url element:(int)number part:(int)partnumber;
@end

@interface OrganViewController : UIViewController<ContetOrganiztiondelegate,HomeworkOrganiztiondelegate,ActivitiesOrganiztiondelegate>
@property (nonatomic,strong)  IBOutlet UILabel * lable;
@property(nonatomic,assign)id <OrganViewDelegate>Organdelegate;
@property (nonatomic,strong) ContetOrganiztionViewController     *   ContetView;
@property (nonatomic,strong) ActivitiesOrganiztonViewController  *   ActivitiesView;
@property (nonatomic,strong) HomeWorkOrganitzitionViewController *   HomeWorkView;
@property (nonatomic,strong) NSMutableArray                      *   PartNameArry;
@property (nonatomic,strong) NSMutableArray                      *   PartUrlArry;
@property (nonatomic,strong) NSMutableArray                      *   AcNameArry;
@property (nonatomic,strong) NSMutableArray                      *   AcUrlArry;
@property (nonatomic,strong) NSMutableArray                      *   PartArry;

-(void) PartNameArry:(NSMutableArray *)prtnamr PartUrlArry:(NSMutableArray *)parturl    AcNameArry:(NSMutableArray *)acname AcUrlArry:(NSMutableArray *)acurl Part:(NSMutableArray *)part;

-(void) partname:(NSString *)name
   referencename:(NSString *)referencenam
     elementname:(NSString *)elementname
    activitynamu:(NSString *)activityname;
@end

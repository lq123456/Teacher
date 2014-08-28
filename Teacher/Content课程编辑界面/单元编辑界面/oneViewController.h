//
//  oneViewController.h
//  Teacher
//
//  Created by CollegePre on 14-7-23.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActivitiesButtonViewController.h"
#import "HomeworButtonViewController.h"
#import "TableViewController.h"
#import "NotesViewController.h"
#import "ShoewViewController.h"
#import "EditNotesViewController.h"
@interface oneViewController : UIViewController<delegate,UIWebViewDelegate,UITextViewDelegate,delegateActivities,delegatehome,AddNoteDelegate,ShowNoteDelegate,EditNoteDelegate>
{


    int tm;
    int km;
    int edit;
    int show;
    int t;
    BOOL M;
    BOOL tb;
}
@property (assign) int Noteindextpah;
@property (nonatomic,strong) NSString *string;
@property (nonatomic,strong) NSString *patrname;
@property (nonatomic,strong) NSString *ParetTEXT;
@property (nonatomic,strong) NSString *heafstring;
@property (nonatomic,strong) UIImageView *iMageView;
@property (nonatomic,strong) UIImageView *ShowImagView;
@property (nonatomic,strong) UIImageView *EditImagView;

@property (nonatomic ,strong) ActivitiesButtonViewController * Activitiesbutton;
@property (nonatomic ,strong) HomeworButtonViewController    * Homeworkbutton;
@property (nonatomic ,strong) TableViewController            * tableButton;
@property (nonatomic ,strong) NotesViewController            * AddNoteView;
@property (nonatomic ,strong) ShoewViewController            * ShowNoteView;
@property (nonatomic ,strong) EditNotesViewController        * EditNoteView;

@property (nonatomic ,strong)           NSMutableArray * showarry;
@property (nonatomic ,strong) IBOutlet  UIImageView    * cellImage;
@property (nonatomic,strong)  IBOutlet  UIWebView      * wbview;
@property (nonatomic,strong)            NSString       * CourseString;
@property (nonatomic,strong)  IBOutlet  UILabel        * headLble;
@property (nonatomic ,strong) IBOutlet  UIButton       * ShowNotes;
@property (nonatomic ,strong) IBOutlet  UIButton       * EditNotes;
@property (nonatomic ,strong) IBOutlet  UIButton       * AddNotes;

@property (nonatomic ,strong)           UIButton       * back;
@property (nonatomic ,strong)           NSArray       * AcNameArry;
@property (nonatomic ,strong)           NSArray       * AcUrlArry;

@property (nonatomic ,strong) IBOutlet  UIImageView     * tableVImageView;
@property (nonatomic ,strong) IBOutlet  UIButton        * Content;
@property (nonatomic ,strong) IBOutlet  UIButton        * homework;
@property (nonatomic ,strong) IBOutlet  UIButton        * Activities;

-(IBAction)homework:(id)sender;
-(IBAction)Content:(id)sender;
-(IBAction)Activities:(id)sender;
-(IBAction)Addnotes:(id)sender;
-(IBAction)Shownotes:(id)sender;
-(IBAction)Editnotes:(id)sender;
-(void) Course:(NSString *)course;
@end

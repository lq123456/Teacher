
//
//  oneViewController.m
//  Teacher
//
//  Created by CollegePre on 14-7-23.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "oneViewController.h"
#import "ActivitiesButtonViewController.h"
#import "HomeworButtonViewController.h"
#import "TableViewController.h"
@interface oneViewController ()
@end

@implementation oneViewController
{
    NSString        * notenew;
    NSDictionary    * weDic;
    NSArray         * ar;
    NSArray         * slq;
    NSArray         * slqtext;
    NSMutableArray  * mu;
    NSMutableArray  * mutable;
    NSMutableArray  * elmsetable;
    NSMutableArray  * core;
    NSMutableArray  * acname;
    NSMutableArray  * actiArry;
    NSMutableArray  * actiDress;
    NSMutableArray  * actiClassname;
    NSMutableArray *datarry;
    
    
    NSString *add;
    
}
@synthesize wbview;
@synthesize string;
@synthesize patrname;
@synthesize headLble;
@synthesize ParetTEXT;
@synthesize heafstring;
@synthesize tableButton      = _tableButton;
@synthesize Homeworkbutton   = _Homeworkbutton;
@synthesize Activitiesbutton = _Activitiesbutton;
@synthesize cellImage;
@synthesize  AcNameArry,AcUrlArry;
@synthesize ShowNotes,EditNotes,AddNotes;
@synthesize AddNoteView;
@synthesize Noteindextpah;
@synthesize iMageView;
@synthesize ShowNoteView,ShowImagView;
@synthesize EditImagView,EditNoteView;
@synthesize CourseString =_CourseString;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
 
        // Custom initialization
    }
    return self;
}

-(void)back:(id)sender
{
    
    [[self navigationController]  popViewControllerAnimated:NO];
    
}
-(void)edit
{
   
    
}
-(void)viewDidAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden=YES;
    [super viewDidAppear:animated];
}
-(void)viewDidDisappear:(BOOL)animated//开始pus到下一界面的时候 确定动画

{
    self.navigationController.navigationBarHidden=NO;
}
-(IBAction)Back:(id)sender
{
    [[self navigationController] popViewControllerAnimated:NO];
}
//获得课程
-(void) Course:(NSString *)course
{
//    NSLog(@"234525%@",course);
    _CourseString=course;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    headLble.text=heafstring;
    _showarry=[[NSMutableArray alloc]init ];
    datarry=[[NSMutableArray alloc]init];
    AcNameArry=[[NSArray alloc]init];
    AcUrlArry=[[NSArray alloc]init];
    
    ShowNotes.hidden=YES;
    EditNotes.hidden=YES;
    [self addcellView];
    [self AddnoteImageView];
    [self addShoewImageView];
}
-(void)AddnoteImageView{
    iMageView=[[UIImageView alloc]init];
    iMageView.frame=self.view.bounds;
    iMageView.userInteractionEnabled=YES;
    iMageView.backgroundColor=[UIColor grayColor];
    iMageView.alpha=0.9;
    [self.view addSubview:iMageView];
    AddNoteView=[[NotesViewController alloc]init];
    AddNoteView.Notedelegate=self;
    AddNoteView.view.frame=CGRectMake(247, 119, 700, 500);
    [iMageView addSubview:AddNoteView.view];
    iMageView.hidden=YES;
}
-(void)addShoewImageView
{
    ShowImagView=[[UIImageView alloc]init];
    ShowImagView.frame=self.view.bounds;
    ShowImagView.userInteractionEnabled=YES;
    ShowImagView.backgroundColor=[UIColor grayColor];
    ShowImagView.alpha=0.9;
    [self.view addSubview:ShowImagView];
    ShowNoteView=[[ShoewViewController alloc]init];
    ShowNoteView.view.frame=CGRectMake(247, 119, 700, 500);
    ShowNoteView.Showdelegate=self;
    [ShowImagView addSubview:ShowNoteView.view];
    ShowImagView.hidden=YES;

}
-(void)addEditNotesView
{
    EditImagView=[[UIImageView alloc]init];
    EditImagView.frame=self.view.bounds;
    EditImagView.userInteractionEnabled=YES;
    EditImagView.backgroundColor=[UIColor grayColor];
    EditImagView.alpha=0.9;
    [self.view addSubview:EditImagView];
    EditNoteView=[[EditNotesViewController alloc]init];
    EditNoteView.view.frame=CGRectMake(247, 119, 700, 500);
    EditNoteView.Editdelegate=self;
    [EditImagView addSubview:EditNoteView.view];
    EditImagView.hidden=YES;
}
-(void)addcellView{
    
    _tableButton=[[TableViewController alloc]init];
    _tableButton.view.backgroundColor=[UIColor whiteColor];
    _tableButton.view.frame=CGRectMake(0, 20, 210, 550);
    _tableButton.delegatestring=self;
    _tableButton.view.hidden=YES;
    [self.tableVImageView addSubview:_tableButton.view];
    
    _Activitiesbutton=[[ActivitiesButtonViewController alloc]init];
    _Activitiesbutton.view.frame=CGRectMake(0, 120, 210, 450);
    _Activitiesbutton.delegatea=self;
    _Activitiesbutton.view.hidden=YES;
    [self.tableVImageView addSubview:_Activitiesbutton.view];
    
    
    _Homeworkbutton=[[HomeworButtonViewController alloc]init];
    _Homeworkbutton.view.frame=CGRectMake(0, 155, 210, 400);
    _Homeworkbutton.delegateurl=self;
    _Homeworkbutton.view.hidden=YES;
    [self.tableVImageView addSubview:_Homeworkbutton.view];

}
-(void)ActiviJson:(NSDictionary *)dic
{
    [_Activitiesbutton  Json:dic];
}
//Conten*****wep***url
-(void) wepUrl:(NSString *)url
{
    NSLog(@"%@",url);
    // 获取程序Documents目录路径
    NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"/parts/%@",url]];
    NSLog(@"%@",path);
    [wbview loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath: path]]];
}
-(void) AcNameArry:(NSArray *)acnamearry  AcUrl:(NSArray *)url
{
    AcNameArry=acnamearry;
    AcUrlArry=url;
    [_Activitiesbutton AcName:acnamearry NcUrl:url];
}
-(void)AcWepUrl:(NSString *)Url;
{
    NSLog(@"%@",Url);
    // 获取程序Documents目录路径
    NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"/parts/%@",Url]];
    [wbview loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath: path]]];
}
-(void) swich:(int) indextpah

{
    Noteindextpah=indextpah;
    add=@"add";
    [self.view reloadInputViews];
}
//添加备注
-(IBAction)Addnotes:(id)sender
{
    
    if ([add isEqualToString:@"add"]) {
     iMageView.hidden=NO;
    }else{
        UIAlertView *a=[[UIAlertView alloc] initWithTitle:nil message:@"Pleace swick in the lessons" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [a show];
        NSLog(@"请选择 你要添加的章节");
    }
 
}
-(void)removeAddNoteView
{
    iMageView.hidden=YES;
}
-(void)AddNoteVieweText:(NSString *)text
{
    NSLog(@"%d",Noteindextpah);
    NSError *error;
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *notepath=[paths objectAtIndex:0];
    NSString *Json_path=[notepath stringByAppendingPathComponent:@"JsonFile.json"];
    NSData *date=[NSData dataWithContentsOfFile:Json_path options:NSUTF8StringEncoding error:&error];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:date options:NSJSONReadingMutableLeaves error:&error];
    NSMutableDictionary * allJson=[[NSMutableDictionary alloc] initWithDictionary:dic copyItems:YES];
    NSMutableArray *arr=[[NSMutableArray alloc] init];
    [arr addObjectsFromArray:[dic objectForKey:@"parts"]];
    NSMutableDictionary*ddm=[[NSMutableDictionary alloc] initWithDictionary:[arr objectAtIndex:Noteindextpah] copyItems:YES];//
    NSString * str=[ddm objectForKey:@"note"];
    if ([str length]==Noteindextpah) {
        [ddm setObject:text forKey:@"note"];
    }else{
        [ddm setObject:text forKey:@"note"];
    }
    [arr removeObjectAtIndex:Noteindextpah];
    [arr insertObject:ddm atIndex:Noteindextpah];
    [allJson setObject:arr forKey:@"parts"];
    //讲字典转换为date数据类型
    NSData* jsonData =[NSJSONSerialization dataWithJSONObject:allJson
                                                      options:NSJSONWritingPrettyPrinted error:&error];
    NSString *suv = [[NSString alloc] initWithData:jsonData
                                          encoding:NSUTF8StringEncoding];
    NSLog(@"1---------->%@",suv);
    NSArray *noreJosn=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *pathh=[noreJosn objectAtIndex:0];
    NSString *NoteJson_path=[pathh stringByAppendingPathComponent:@"JsonFile.json"];
    [jsonData writeToFile:NoteJson_path atomically:YES];
    AddNotes.hidden=YES;
    ShowNotes.hidden=NO;
    EditNotes.hidden=NO;
}
-(void) ShoewHidden:(NSString *)text
{
    ShowNotes.hidden=NO;
    EditNotes.hidden=NO;
    AddNotes.hidden=YES;
    ShowNoteView.textView.text=text;
}
-(void)removeEditNoteView
{
    EditImagView.hidden=YES;
}
//编辑note之后
-(void)EditNoteVieweText:(NSString *)text
{
    NSError *error;
    //读取Json
    //==Json文件路径
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *notepath=[paths objectAtIndex:0];
    NSString *Json_path=[notepath stringByAppendingPathComponent:@"Json.json"];
    NSData *date=[NSData dataWithContentsOfFile:Json_path options:NSUTF8StringEncoding error:&error];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:date options:NSJSONReadingMutableLeaves error:&error];
    NSMutableDictionary * allJson=[[NSMutableDictionary alloc] initWithDictionary:dic copyItems:YES];
    NSMutableArray *arr=[[NSMutableArray alloc] init];
    [arr addObjectsFromArray:[dic objectForKey:@"parts"]];
    NSMutableDictionary*ddm=[[NSMutableDictionary alloc] initWithDictionary:[arr objectAtIndex:Noteindextpah] copyItems:YES];//
    NSString * str=[ddm objectForKey:@"note"];
    NSLog(@"10-----------%@",str);
    if ([str length]==Noteindextpah) {
        [ddm setObject:text forKey:@"note"];
    }else{
        [ddm setObject:text forKey:@"note"];
    }
    [arr removeObjectAtIndex:Noteindextpah];
    [arr insertObject:ddm atIndex:Noteindextpah];
    [allJson setObject:arr forKey:@"parts"];
    //讲字典转换为date数据类型
    NSData* jsonData =[NSJSONSerialization dataWithJSONObject:allJson
                                                      options:NSJSONWritingPrettyPrinted error:&error];
//    NSString *suv = [[NSString alloc] initWithData:jsonData
//                                          encoding:NSUTF8StringEncoding];
    NSArray *noreJosn=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *pathh=[noreJosn objectAtIndex:0];
    NSString *NoteJson_path=[pathh stringByAppendingPathComponent:@"Json.json"];
    [jsonData writeToFile:NoteJson_path atomically:YES];
}
-(void) AddHidden
{
    ShowNotes.hidden=YES;
    EditNotes.hidden=YES;
    AddNotes.hidden=NO;
}
-(IBAction)Shownotes:(id)sender
{
    ShowImagView.hidden=NO;
}
-(void)removeShowNoteView;
{
    ShowImagView.hidden=YES;
}
-(IBAction)Editnotes:(id)sender
{
    EditImagView.hidden=NO;
    EditNoteView.view.hidden=NO;

    EditNoteView.textView.text=ShowNoteView.textView.text;

}
//wepview显示home
-(void)Homelink:(NSString *)linkString
{
    NSLog(@"%@",linkString);
    // 获取程序Documents目录路径
    NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"/parts/%@",linkString]];
    [wbview loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath: path]]];
}
-(IBAction)homework:(id)sender
{
    if (tb==YES) {
        
    }if (tb==NO) {
        int fn=km++;
        if (fn%2==0) {
            [UIView animateWithDuration:0.5 animations:^{
                
                _Homeworkbutton.view.hidden=NO;
                _tableButton.view.hidden=YES;
                _Activitiesbutton.view.hidden=YES;;

            } completion:^(BOOL finished){
                
                }];
        }else{
            [UIView animateWithDuration:0.5 animations:^{
 
                _Homeworkbutton.view.hidden=YES;
                _tableButton.view.hidden=YES;
                _Activitiesbutton.view.hidden=YES;;

            } completion:^(BOOL finished){
                
                
            }];
        }
    }
}
-(IBAction)Content:(id)sender
{
    int ww=km++;
        if(ww%2==0){
//            tm=[datarry count]+1;
            M=YES;
            tb=YES;
            [UIView animateWithDuration:0.5 animations:^{
                self.Activities.frame=CGRectMake(13, 516, 210, 56);
                self.homework.frame=CGRectMake(13, 571, 210, 56);
            } completion:^(BOOL finished){
                
                _tableButton.view.hidden=NO;
                _Homeworkbutton.view.hidden=YES;
                _Activitiesbutton.view.hidden=YES;;

         
            }];
        }else{
            [UIView animateWithDuration:0.5 animations:^{
                M=NO;
                tb=NO;
                self.Activities.frame=CGRectMake(13, 102, 210, 56);
                self.homework.frame=CGRectMake(13, 155, 210, 56);
                _tableButton.view.hidden=YES;
                _Homeworkbutton.view.hidden=YES;
                _Activitiesbutton.view.hidden=YES;;

            } completion:^(BOOL finished){
            }];
        }
}
-(IBAction)Activities:(id)sender
{
    if (M==YES) {
    }
    if (M==NO) {
        int ko=tm++;
        if(ko%2==0){
            tb=YES;
            [UIView animateWithDuration:0.5 animations:^{
 
                self.homework.frame=CGRectMake(13, 571, 210, 56);

                _Activitiesbutton.view.hidden=NO;;
                _Homeworkbutton.view.hidden=YES;
                _tableButton.view.hidden=YES;

            
            } completion:^(BOOL finished){
            }];
        }else{
            tb=NO;
            [UIView animateWithDuration:0.5 animations:^{
                self.homework.frame=CGRectMake(13, 155, 210, 56);
                _Activitiesbutton.view.hidden=YES;;
                _Homeworkbutton.view.hidden=YES;
                _tableButton.view.hidden=YES;
            }completion:^(BOOL finished){
            }];
        }
    
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end

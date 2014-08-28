//
//  OrganViewController.m
//  Teacher
//
//  Created by CollegePre on 14-8-13.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "OrganViewController.h"

@interface OrganViewController ()

@end

@implementation OrganViewController
@synthesize lable;
@synthesize ContetView,ActivitiesView,HomeWorkView;
@synthesize Organdelegate;
@synthesize PartNameArry=_PartNameArry;
@synthesize PartUrlArry=_PartUrlArry;
@synthesize AcNameArry=_AcNameArry;
@synthesize AcUrlArry=_AcUrlArry;
@synthesize PartArry=_PartArry;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self AddCellView];
    // Do any additional setup after loading the view from its nib.
}

-(void) partname:(NSString *)name
   referencename:(NSString *)referencenam
     elementname:(NSString *)elementname
    activitynamu:(NSString *)activityname;
{
 
    NSError *error;
    //==Json文件路径
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path=[paths objectAtIndex:0];
    NSString *Json_path=[path stringByAppendingPathComponent:@"Json.json"];
    //    NSLog(@"%@",Json_path);
    //==Json数据
    NSData *data=[NSData dataWithContentsOfFile:Json_path];
    //==JsonObject
    
    id JsonObject=[NSJSONSerialization JSONObjectWithData:data
                                                  options:NSJSONReadingAllowFragments
                                                    error:&error];
    
    
    
    
    
    NSMutableArray *mutablearry=[JsonObject objectForKey:@"parts"];
    NSLog(@"%@",mutablearry);
    NSDictionary *dic=[mutablearry objectAtIndex:[name intValue]];
    
    if (elementname!=nil) {
        NSMutableArray *a=[dic objectForKey:@"elements"];
        NSDictionary *m=[a objectAtIndex:[elementname intValue]-1>=0];
        NSString *eladdrem=[m objectForKey:@"address"];
        [Organdelegate WepUrl:eladdrem];
    }
    
  else  if (activityname!=nil) {
      NSMutableArray *aq=[dic objectForKey:@"activities"];
      NSDictionary *mk=[aq objectAtIndex:[activityname intValue]-1>=0];
      NSDictionary *eladdrem=[mk objectForKey:@"content"];
      NSString *scvt=[eladdrem objectForKey:@"address"];
      [Organdelegate WepUrl:scvt];
 
    }
  else{
      NSDictionary *core=[dic objectForKey:@"core"];
      NSString *partaddress=[core objectForKey:@"address"];
     [Organdelegate WepUrl:partaddress];
  
  }
    
    
    

}
-(void) PartNameArry:(NSMutableArray *)prtnamr PartUrlArry:(NSMutableArray *)parturl    AcNameArry:(NSMutableArray *)acname AcUrlArry:(NSMutableArray *)acurl Part:(NSMutableArray *)part;
{
    _PartNameArry=prtnamr;
    _PartUrlArry=parturl;
    _AcUrlArry=acurl;
    _AcNameArry=acname;
    _PartArry=part;
}
-(void )AddCellView
{

    self.ContetView=[[ContetOrganiztionViewController alloc]init];
    self.ContetView.view.frame=CGRectMake(0, 110, 700,380);
    self.ContetView.view.hidden=NO;
    self.ContetView.Contetdelegate=self;
    [self.ContetView PartNameArry:_PartNameArry PartUrlArry:_PartUrlArry Part:_PartArry];
    self.ContetView.view.backgroundColor=[UIColor redColor];
    [self.view addSubview:self.ContetView.view];
    
    
    self.ActivitiesView=[[ActivitiesOrganiztonViewController alloc]init];
    self.ActivitiesView.view.frame=CGRectMake(0,110, 700, 400);
    [self.ActivitiesView AcNameArry:_AcNameArry AcUrlArry:_AcUrlArry];
    self.ActivitiesView.view.hidden=YES;
    self.ActivitiesView.Activitiesdelegate=self;
    [self.view addSubview:self.ActivitiesView.view];
    
    
    
    
    self.HomeWorkView=[[HomeWorkOrganitzitionViewController alloc]init];
    self.HomeWorkView.view.frame=CGRectMake(0,110, 700, 400);
    self.HomeWorkView.view.hidden=YES;
    self.HomeWorkView.homeWorkdelegate=self;
    [self.view addSubview:self.HomeWorkView.view];
    
   
    

}
-(IBAction)Content:(id)sender
{
    self.lable.frame=CGRectMake(14, 101, 200, 6);
    self.ContetView.view.hidden=NO;
    self.HomeWorkView.view.hidden=YES;
    self.ActivitiesView.view.hidden=YES;

}
-(IBAction)Activities:(id)sender
{
    self.lable.frame=CGRectMake(239, 101, 200, 6);
    self.ContetView.view.hidden=YES;
    self.HomeWorkView.view.hidden=YES;
    self.ActivitiesView.view.hidden=NO;
    
    
}
-(IBAction)Homework:(id)sender
{
    self.lable.frame=CGRectMake(480, 101, 200, 6);
    self.HomeWorkView.view.hidden=NO;
    self.ActivitiesView.view.hidden=YES;
    self.ContetView.view.hidden=YES;

}
-(IBAction)closeButton:(id)sender
{


    [Organdelegate removeOrganView];

}
-(void) Contetswich:(int)indextpah;
{

    [ActivitiesView Acswick:indextpah];
    [Organdelegate OrganContetswich:indextpah];
    
}
-(void)ContetWep:(NSString *)Url
{
    [Organdelegate WepUrl:Url];

}
-(void)HomeworkWep:(NSString *)Url
{
    
[Organdelegate WepUrl:Url];

}
-(void)ActivitiesWep:(NSString *)Url
{
    [Organdelegate WepUrl:Url];


}
-(void)Activities:(int)oder part:(int)der
{

    [Organdelegate Activities:oder part:der];


}
-(void)Contetelement:(NSArray *)url element:(int)number part:(int)partnumber
{
    [Organdelegate Contetelement:url element:number part:partnumber];

}
-(void)Homeworkoder:(int)oder
{
    [Organdelegate Homeworkoder:oder];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

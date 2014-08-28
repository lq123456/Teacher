//
//  NoteDateViewController.m
//  Teacher
//
//  Created by CollegePre on 14-8-6.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "NoteDateViewController.h"
#import "FMDatabase.h"
@interface NoteDateViewController ()
{

//    NSString *cu;
}
@property (nonatomic, strong) FMDatabase *db;
@property (nonatomic, strong) NSString *courseString;
@property (nonatomic, strong) NSString *partString;
@property (nonatomic, strong) NSString *noteString;
@property (nonatomic, strong) NSString *St;
@property (nonatomic, strong) NSString *nt;
@property (nonatomic, strong) NSString *cu;
@property (nonatomic, strong) NSString *s;


@end

@implementation NoteDateViewController
@synthesize delegatehiden;
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
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [docPath stringByAppendingPathComponent:@"notetext.sqlite"];
    self.db = [FMDatabase databaseWithPath:path];
    if ([self.db open]) {
        NSLog(@"打开数据库成功");
        BOOL success = [self.db executeUpdate:@"create table if not exists t_notetext(id integer primary key autoincrement ,course text not null,part text not null,note text not null)"];
        NSLog(@"%hhd",success);
        if(success)
        {
            NSLog(@"数据库创建成功");
        }
        else
        {
            NSLog(@"数据库创建失败");
        }
        
    }
    else
    {
        NSLog(@"打开数据库失败");
        
    }

    // Do any additional setup after loading the view.
}
//添加数据到数据库里面
-(void)addNotes:(NSString *)course  Part:(NSString *)part Note:(NSString *)note
{
    //添加数据到数据库里面
    NSString *coursetext  = [NSString stringWithFormat:@"%@",course];
    NSLog(@"%@",course);
    NSString *parttext  = [NSString stringWithFormat:@"%@",part];
    NSLog(@"%@",parttext);
    NSString *notetext  = [NSString stringWithFormat:@"%@",note];
    NSLog(@"%@",notetext);
    BOOL success = [self.db executeUpdate:@"insert into t_notetext (course,part,note) values(?,?,?)",coursetext,parttext,notetext] ;
    if(success)
    {
        
        [self.delegatehiden buttonkmt];
        UIAlertView *al=[[UIAlertView alloc]initWithTitle:nil message:@"保存成功" delegate:self cancelButtonTitle:@"O K" otherButtonTitles:nil];
        [al show];
        
        [self.delegatehiden shouwButton];
    }
    else
    {
        UIAlertView *al=[[UIAlertView alloc]initWithTitle:nil message:@"保存失败" delegate:self cancelButtonTitle:@"O K" otherButtonTitles:nil];
        [al show];
    }
}
//判断数据库里面是否有指定章节的备注如果有就回显示备注button
-(void)notebutton:(NSString *)headName parename:(NSString *)parename
{

    
    FMResultSet *set = [self.db executeQuery:@"select * from t_notetext where course like ? and part like ? ",headName,parename];
    while ([set next]) {
        
        self.St=[set stringForColumn:@"course"];
        self.nt=[set stringForColumn:@"part"];
        self .cu=[set stringForColumn:@"note"];

    }
    NSLog(@"%@",self .cu);
    if (self.cu==nil) {
        [self.delegatehiden judgenote];
        [self.delegatehiden ad:100];
        self.cu=nil;
    }
    else if (self .cu!=nil){
      
        [self.delegatehiden shouwButton];
        [self.delegatehiden ad:101];
        self.cu=nil;

    }
  
}
//查询显示
-(void)ShowNotes:(NSString *)course  Part:(NSString *)part Note:(NSString *)note
{
    //    FMDatabase * db;
    FMResultSet *set = [self.db executeQuery:@"select * from t_notetext where course like ? and part like ? ",course,part];
    while ([set next]) {
        self.courseString=[set stringForColumn:@"course"];
        self.partString=[set stringForColumn:@"part"];
        self.noteString=[set stringForColumn:@"note"];
        NSLog(@"1---------%@",self.courseString);
        NSLog(@"2-------- %@",self.partString);
        NSLog(@"3---------%@",self.noteString);
        [self.delegatehiden  TextView:self.courseString Patr:self.partString Note:self.noteString];
    }
    
}
//删除
-(void)deleteNotes:(NSString *)course  Part:(NSString *)part Note:(NSString *)note
{
    //     FMDatabase * db;
    BOOL success = [self.db executeUpdate:@"update t_notetext set part=? ",note];
    if(success)
    {
        NSLog(@"update成功");
    }
    else
    {
        NSLog(@"update失败");
    }
    
}
//更新
-(void)updateNotes:(NSString *)course  Part:(NSString *)part Note:(NSString *)note
{
    //    FMDatabase * db;
    BOOL success = [self.db executeUpdate:@"update t_notetext set part=? ",part];
    if(success)
    {
        NSLog(@"update成功");
    }
    else
    {
        NSLog(@"update失败");
    }
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//判断数据库里面是否有指定章节的备注如果有就回显示备注button
-(void)notestring:(NSString *)headName parename:(NSString *)parename
{
    FMResultSet *set = [self.db executeQuery:@"select * from t_notetext where course like ? and part like ? ",headName,parename];
    while ([set next]) {
        self.St=[set stringForColumn:@"course"];
        self.nt=[set stringForColumn:@"part"];
        self .cu=[set stringForColumn:@"note"];
    }
    if (self.cu==nil) {
        [self.delegatehiden st:self.cu];
        self.cu=nil;
    }
    else if (self .cu!=nil){
     [self.delegatehiden note:self .cu];
        self.cu=nil;
    }
    
}
//判断数据库里面是否有指定章节的备注如果有就回显示备注button
-(void)notes:(NSString *)headName parename:(NSString *)parename
{

    FMResultSet *set = [self.db executeQuery:@"select * from t_notetext where course like ? and part like ? ",headName,parename];
    while ([set next]) {
        self.St=[set stringForColumn:@"course"];
        self.nt=[set stringForColumn:@"part"];
        self .cu=[set stringForColumn:@"note"];
    }
    if (self.cu==nil) {
        UIAlertView *al=[[UIAlertView alloc]initWithTitle:nil message:@"改章节没有备注请到Content页面添加备注" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [al show];
        self.cu=nil;
    }
    else if (self .cu!=nil){
        [self.delegatehiden couse:self .cu];
        self.cu=nil;
    }


}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

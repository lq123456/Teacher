//
//  HomeworkAssignViewController.m
//  Teacher
//
//  Created by CollegePre on 14-7-24.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "HomeworkAssignViewController.h"
#import "AssignHomeworkViewController.h"
@interface HomeworkAssignViewController (){

    NSMutableArray *   HomeworkNameArry;
    NSMutableArray *  HomeworkArry;
    NSMutableArray * AddOrderArry;
    NSMutableDictionary *dicm;
    NSMutableDictionary *addClassDic;
    AssignTableViewCell *Ascell;
    NSMutableArray *dressMutableArry;
    NSMutableDictionary  *dressDictry;
}

@end

@implementation HomeworkAssignViewController
@synthesize lableBarText;
@synthesize barString;
@synthesize Assincell;
@synthesize wepView;
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
    dressMutableArry=[[NSMutableArray alloc]init];
    dressDictry =[[NSMutableDictionary alloc]init];
    
    

    AddOrderArry=[[NSMutableArray alloc]init];
    addClassDic=[[NSMutableDictionary alloc] init];
    
    
    
    static NSString *CellIdentifier = @"AssignTableViewCell";
    UINib *nib = [UINib nibWithNibName:@"AssignTableViewCell" bundle:nil];
    [self.tablecell registerNib:nib forCellReuseIdentifier:CellIdentifier];
    static BOOL nibsRegistered = NO;
    nibsRegistered = YES;
    if ([barString length]==0) {
       self.lableBarText.text=@"Homework";
    }else{
        self.lableBarText.text=barString;
    }
    [self JsonObject];
    // Do any additional setup after loading the view from its nib.
}
-(IBAction)back:(id)sender
{
    [[self navigationController]popViewControllerAnimated:NO];
//    self.BackButton.hidden=YES;
}
-(void)viewDidDisappear:(BOOL)animated//开始pus到下一界面的时候 确定动画
{
    self.navigationController.navigationBarHidden=NO;
}
-(void)viewDidAppear:(BOOL)animated//页面加载结束之后的动画
{
    self.navigationController.navigationBarHidden=YES;
}
-(void)JsonObject
{
    NSError *error;
    //读取Json
    //==Json文件路径
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path=[paths objectAtIndex:0];
    NSString *Json_path=[path stringByAppendingPathComponent:@"homework.json"];
    //    NSLog(@"%@",Json_path);
    //==Json数据
    NSData *data=[NSData dataWithContentsOfFile:Json_path];
    //==JsonObject
    
    id JsonObject=[NSJSONSerialization JSONObjectWithData:data
                                                  options:NSJSONReadingAllowFragments
                                                    error:&error];
    //    NSLog(@"1----------%@",JsonObject);
    NSDictionary *content1=[JsonObject objectForKey:@"content"];
    //    NSLog(@"2-------%@",content1);
    NSDictionary *content2=[content1 objectForKey:@"content"];
    //    NSLog(@"3-------%@",content2);
    HomeworkNameArry=[[NSMutableArray alloc]init];
    HomeworkArry=[content1 objectForKey:@"content"];
    for (NSDictionary *dic in content2) {
        NSLog(@"%@",dic);
        NSDictionary *name=[dic objectForKey:@"name"];
        NSString *English=[name objectForKey:@"English"];
        NSDictionary *content=[dic objectForKey:@"content"];
        NSString *address=[content objectForKey:@"address"];
        
        [HomeworkNameArry addObject:English];
        [dressMutableArry  addObject:address];
    }
    NSLog(@"%@",dressMutableArry);
    NSLog(@"%@",HomeworkNameArry);
}
#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [HomeworkNameArry count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"AssignTableViewCell";
    AssignTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    static BOOL nibsRegistered = NO;
    if (!nibsRegistered) {
        UINib *nib = [UINib nibWithNibName:@"AssignTableViewCell" bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:CellIdentifier];
//        nibsRegistered = YES;
    }
    cell.contentView.backgroundColor=[UIColor clearColor];
    cell.lable.text=[HomeworkNameArry objectAtIndex:indexPath.row];
    cell.buttonItem.tag=indexPath.row;
    cell.celldelegate=self;
    return cell;
}
-(void)addImageViewBackColorImage:(int)indextPatn
{
    
    
    NSLog(@"%d",indextPatn);
    NSString *string=[NSString stringWithFormat:@"%d",indextPatn];
    [addClassDic  setObject:string forKey:[NSString  stringWithFormat:@"%d",indextPatn]];
    
     NSString *url=[dressMutableArry objectAtIndex:indextPatn];
    [self wepUrl:url];
    [dressDictry setObject:url forKey:[NSString stringWithFormat:@"%d",indextPatn]];
    NSLog(@"%@",dressDictry);


}
-(void)removeImageViewBackColorImage:(int)indextPatn
{
    if ([addClassDic count]!=0) {
        NSString *string=[NSString stringWithFormat:@"%d",indextPatn];
        [addClassDic removeObjectForKey:string];
    }
    if ([dressDictry count]!=0) {
        [dressDictry removeObjectForKey:[NSString stringWithFormat:@"%d",indextPatn]];
    }
//    NSLog(@"%@",addClassDic);

}
-(void)wepViewurl:(NSString *)string
{
    // 获取程序Documents目录路径
    NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"/parts/%@",string]];
    [wepView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath: path]]];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
//    Ascell.imaView=(UIImageView *)[self.view viewWithTag:indexPath.row+1233];
//   
//    
//    if (Ascell.imaView.tag==indexPath.row+1233) {
//    [Ascell setimage:[UIImage imageNamed:@"icon_picked.png"]];
//    }
//    NSDictionary *dic=[HomeworkArry objectAtIndex:indexPath.row];
////    NSLog(@"%@",dic);
//    [self JsonHomenActivity:dic indexPath:indexPath];

}
-(void)JsonHomenActivity:(NSDictionary *)dic indexPath:(NSIndexPath *)indexPath
{
//
    NSDictionary *dicname=[dic objectForKey:@"name"];
    NSString *name=[dicname objectForKey:@"English"];
    
    NSDictionary *content=[dic objectForKey:@"content"];
    NSString *address=[content objectForKey:@"address"];
    NSString *contentType=[content objectForKey:@"type"];
    
    NSString*order=[dic objectForKey:@"order"];
    NSString *type=[dic objectForKey:@"type"];
    NSString *partno=[dic objectForKey:@"part no"];
    NSString *partid=[dic objectForKey:@"part id"];
    NSString *data=[dic objectForKey:@"data"];
    dicm=[[NSMutableDictionary alloc]init];
    if ([AddOrderArry count]<indexPath.row+1) {
        [dicm setObject:[NSString stringWithFormat:@"%d",indexPath.row+1] forKey:@"order"];
        [AddOrderArry addObject:dicm];
    }
//    else{
//        NSString *str=[AddOrderArry objectAtIndex:indexPath.row];
//        NSLog(@"87878------%@",str);
//      [AddOrderArry removeObjectAtIndex:indexPath.row];
//    }
    [self wepUrl:address];
}
-(void)wepUrl:(NSString *)url
{
    
//    NSLog(@"%@",url);
    NSLog(@"%@",url);
    NSString *documentsDirectory=[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"/parts/%@",url]];
    [self.wepView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath: path]]];
}
-(IBAction)NextTep:(id)sender
{
    AssignHomeworkViewController *ak=[[AssignHomeworkViewController alloc]init];
    [ak ClassMutableArry:AddOrderArry];
    [[self navigationController] pushViewController:ak animated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end

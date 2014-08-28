//
//  TableViewController.m
//  Teacher
//
//  Created by CollegePre on 14-8-1.
//  Copyright (c) 2014年 apple. All rights reserved.
//
#import "TableViewController.h"

@interface TableViewController (){
    NSArray *numarry;
    NSMutableArray *mutable;
    NSMutableArray *elmsetable;
    NSMutableArray *core;
    NSArray *linkArry;
    NSMutableArray *NameArry;
    NSMutableArray *UrlArry;
    NSMutableArray *JsonArry;
    
    int tm;
    
}

@end

@implementation TableViewController
@synthesize mutableArry,ClassArry,addArry;
@synthesize delegatestring;


// 确定点击partX的时候   另外2个tableview 里面将要显示的参数
@synthesize aNameArry,aUrlArry;
@synthesize hNameArry,hUrlArry;

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
    
    
    tm=8;
    
    self.mTableView = [[TQMultistageTableView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width , 400)];
    self.mTableView.delegate = self;
    self.mTableView.dataSource = self;
    [self.view addSubview:self.mTableView];
    [self Json];
}
-(void)Json
{
    NSError *error;
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path=[paths objectAtIndex:0];
    NSString *Json_path=[path stringByAppendingPathComponent:@"JsonFile.json"];
    NSData *data=[NSData dataWithContentsOfFile:Json_path];
    id JsonObject=[NSJSONSerialization JSONObjectWithData:data
                                                  options:NSJSONReadingAllowFragments
                                                    error:&error];
    id JsonParts=[JsonObject objectForKey:@"parts"];
    JsonArry=[JsonObject objectForKey:@"parts"];
    mutable=[[NSMutableArray alloc]init];
    for (NSDictionary *ob in JsonParts) {
        NSDictionary *name=[ob objectForKey:@"name"];
        NSString *sreing=[name objectForKey:@"English"];
        [mutable addObject:sreing];
    }
   
    
    
    
}
#pragma mark - TQTableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(TQMultistageTableView *)tableView
{
    return [mutable count];
}
//点击父类的时候返回多少行
- (NSInteger)mTableView:(TQMultistageTableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSDictionary *dic=[JsonArry objectAtIndex:section];
    NameArry=[[NSMutableArray alloc] init];
    UrlArry=[[NSMutableArray alloc] init];
    NSString *cor=@"core";
    [NameArry addObject:cor];
    NSDictionary *corem=[dic   objectForKey:@"core"];
    NSString *address=[corem objectForKey:@"address"];
    [UrlArry addObject:address];
    NSDictionary *elements=[dic  objectForKey:@"elements"];
    for (NSDictionary *elmeDic  in  elements) {
        NSString *elementsaddress=[elmeDic objectForKey:@"address"];
        NSDictionary *elementsname=[elmeDic  objectForKey:@"name"];
        NSString *elementsstr=[elementsname objectForKey:@"English"];
        [NameArry addObject:elementsstr];
        [UrlArry addObject:elementsaddress];
    }
    
    return [NameArry count];

}

- (UITableViewCell *)mTableView:(TQMultistageTableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"TQMultistageTableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    UIView *view = [[UIView alloc] initWithFrame:cell.frame] ;
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 48, tableView.frame.size.width, 1)];
    v.backgroundColor=[UIColor blackColor];
    NSString *string=[NameArry objectAtIndex:indexPath.row];
    cell.textLabel.text=[NSString stringWithFormat:@"    %@",string];
    view.backgroundColor = [UIColor whiteColor];
    cell.backgroundView = view;
    [cell addSubview:v];
    return cell;
}

#pragma mark - Table view delegate

- (CGFloat)mTableView:(TQMultistageTableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (CGFloat)mTableView:(TQMultistageTableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}
//添加子cell下一级cell的高度
- (CGFloat)mTableView:(TQMultistageTableView *)tableView heightForOpenCellAtIndexPath:(NSIndexPath *)indexPath
{
    return 0;
}
- (UIView *)mTableView:(TQMultistageTableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * control = [[UIView alloc] init];
    control.backgroundColor = [UIColor whiteColor];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 48, tableView.frame.size.width, 1)];
    view.backgroundColor = [UIColor blackColor];
    UILabel *label = [[UILabel alloc] init];
    label.text=[mutable objectAtIndex:section];
    label.textColor = [UIColor blackColor];
    label.frame = CGRectMake(20, 0, 200, 40);
    [control addSubview:label];
    [control addSubview:view];
    return control;
}
- (UIView *)mTableView:(TQMultistageTableView *)tableView openCellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   /*
    UIView * control = [[UIView alloc] init];
    control.backgroundColor = [UIColor whiteColor];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 48, tableView.frame.size.width, 1)];
    view.backgroundColor = [UIColor blackColor];
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor blackColor];
    label.frame = CGRectMake(20, 0, 200, 40);
    [control addSubview:label];
    [control addSubview:view];
    */
    return 0;
    
}
//点击父类cell
- (void)mTableView:(TQMultistageTableView *)tableView didSelectHeaderAtSection:(NSInteger)section
{
   [self jsonNote:section];
}
//class celll点击
- (void)mTableView:(TQMultistageTableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *lin=[UrlArry  objectAtIndex:indexPath.row];
    [delegatestring wepUrl:lin];
}
//父类展开
- (void)mTableView:(TQMultistageTableView *)tableView willOpenHeaderAtSection:(NSInteger)section
{
    NSDictionary *dic=[JsonArry objectAtIndex:section];
    [delegatestring ActiviJson:dic];
    [delegatestring swich:section];
}
-(void)jsonNote:(NSInteger) section
{
    
    
//    NSError *error;
//    NSString *mainBundleDirectory=[[NSBundle mainBundle] bundlePath];
//    NSString *path=[mainBundleDirectory stringByAppendingPathComponent:@"Json.json"];
//    NSData *date=[NSData dataWithContentsOfFile:path options:NSUTF8StringEncoding error:&error];
//    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:date options:NSJSONReadingMutableLeaves error:&error];
//    //讲字典转换为date数据类型
//    NSData* jsonData =[NSJSONSerialization dataWithJSONObject:dic
//                                                      options:NSJSONWritingPrettyPrinted error:&error];
//    NSString *suv = [[NSString alloc] initWithData:jsonData
//                                          encoding:NSUTF8StringEncoding];
//    
//    
    NSError *error;
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path=[paths objectAtIndex:0];
    NSString *Json_path=[path stringByAppendingPathComponent:@"Json.json"];
    NSData *data=[NSData dataWithContentsOfFile:Json_path];
    id JsonObject=[NSJSONSerialization JSONObjectWithData:data
                                                  options:NSJSONReadingAllowFragments
                                                    error:&error];
    id JsonParts=[JsonObject objectForKey:@"parts"];
     NSMutableArray * note=[[NSMutableArray alloc]init];
      for (NSDictionary *ob in JsonParts)
     {
         NSString *no=[ob objectForKey:@"note"];
         NSLog(@"1-------2-------%@",no);
         [note addObject:no];
     }
    
    NSString *nott=[note objectAtIndex:section];
    
    if ([nott length]==0) {
        
        [delegatestring AddHidden ];
        
    }else{
        [delegatestring ShoewHidden:nott];
    }
}
-(void)cell:(int )inm
{
/*
    NSError *error;
    NSString *mainBundleDirectory=[[NSBundle mainBundle] bundlePath];
    NSString *path=[mainBundleDirectory stringByAppendingPathComponent:@"lesson.json"];
    NSData *date=[NSData dataWithContentsOfFile:path options:NSUTF8StringEncoding error:&error];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:date options:NSJSONReadingMutableLeaves error:&error];
    NSMutableDictionary * allJson=[[NSMutableDictionary alloc] initWithDictionary:dic copyItems:YES];
    NSMutableArray *arr=[[NSMutableArray alloc] init];
    [arr addObjectsFromArray:[dic objectForKey:@"parts"]];
    NSMutableDictionary*ddm=[[NSMutableDictionary alloc] initWithDictionary:[arr objectAtIndex:inm] copyItems:YES];//
    NSString * str=[ddm objectForKey:@"note"];
    if ([str length]==0) {
//        [ddm setObject:@"11" forKey:@"note"];
    }else if([str length]!=0){
    }
    [arr removeObjectAtIndex:inm];
    [arr insertObject:ddm atIndex:inm];
    [allJson setObject:arr forKey:@"parts"];

    */
}
//父类关闭
- (void)mTableView:(TQMultistageTableView *)tableView willCloseHeaderAtSection:(NSInteger)section
{
  
    

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

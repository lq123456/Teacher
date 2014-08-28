//
//  ContetOrganiztionViewController.m
//  Teacher
//
//  Created by CollegePre on 14-8-13.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "ContetOrganiztionViewController.h"

@interface ContetOrganiztionViewController (){

    NSArray *NameArry;
    NSArray *UrlArry;
    int partnumber;
}

@end

@implementation ContetOrganiztionViewController
@synthesize mTableView;
@synthesize PartNameArry=_PartNameArry;
@synthesize PartUrlArry=_PartUrlArry;
@synthesize PartArry=_PartArry;
@synthesize Contetdelegate;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)PartNameArry:(NSMutableArray *)partname PartUrlArry:(NSMutableArray *)url Part:(NSMutableArray *)part
{

    
    _PartNameArry=partname;
    _PartUrlArry=url;
    _PartArry=part;
    [self.mTableView reloadData];

}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.mTableView = [[TQMultistageTableView alloc] initWithFrame:CGRectMake(0,0, self.view.frame.size.width-3, 380)];
    self.mTableView.delegate = self;
    self.mTableView.dataSource = self;
    [self.view addSubview:self.mTableView];

    // Do any additional setup after loading the view from its nib.
}
#pragma mark - TQTableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(TQMultistageTableView *)tableView
{
    return [_PartArry count];
    
}
//点击父类的时候返回多少行
- (NSInteger)mTableView:(TQMultistageTableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NameArry=[_PartNameArry objectAtIndex:section];
    UrlArry=[_PartUrlArry objectAtIndex:section];
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
    view.backgroundColor = [UIColor grayColor];
    view.alpha=0.8;
    UILabel *label = [[UILabel alloc] init];
    label.text=[_PartArry objectAtIndex:section];
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
//点击cell是触发
- (void)mTableView:(TQMultistageTableView *)tableView didSelectHeaderAtSection:(NSInteger)section
{
 
    [Contetdelegate Contetswich:section];

    
}
//class celll点击开始处理
- (void)mTableView:(TQMultistageTableView *)tableView willOpenCellAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *url=[UrlArry objectAtIndex:indexPath.row];
    //    NSLog(@"%@",url);
    [Contetdelegate ContetWep:url];
    if (indexPath.row!=0) {
        [Contetdelegate Contetelement:UrlArry element:indexPath.row part:partnumber];
    }
}
//class celll点击开始出发
- (void)mTableView:(TQMultistageTableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSLog(@"%d",indexPath.row);
//    NSString *lin=[UrlArry  objectAtIndex:indexPath.row];
//    [Contetdelegate ContetWep:lin];
}
//父类展开
- (void)mTableView:(TQMultistageTableView *)tableView willOpenHeaderAtSection:(NSInteger)section
{
    NSLog(@"%ld",(long)section);
    partnumber=section;
    
}
//父类关闭
- (void)mTableView:(TQMultistageTableView *)tableView willCloseHeaderAtSection:(NSInteger)section
{
    
    
    //    numarry=[elmsetable objectAtIndex:section];
    
    
}




- (void)mTableView:(TQMultistageTableView *)tableView willCloseCellAtIndexPath:(NSIndexPath *)indexPath;
{
    
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

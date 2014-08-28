//
//  HomeworkViewController.m
//  Teacher
//
//  Created by 罗强 on 14-7-22.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "HomeworkViewController.h"
#import "HomeworkCouseViewController.h"

//#import "HomeworkAssignViewController.h"
@interface HomeworkViewController ()
{
    NSMutableArray *HomeworkArry;

}
@property (nonatomic ,strong)NSArray *array;
@end
@implementation HomeworkViewController
@synthesize HomeworkNameArry;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewDidAppear:(BOOL)animated//页面加载结束之后的动画
{
    [super viewDidAppear:YES];
    CPTabBarViewController *tab = (CPTabBarViewController *)self.tabBarController;
    tab.customTabBar.hidden = NO;
    self.navigationController.navigationBarHidden=YES;
}
-(void)viewDidDisappear:(BOOL)animated//开始pus到下一界面的时候 确定动画
{
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden=NO;
    [UIView animateKeyframesWithDuration:0.25 delay:0.25 options:0 animations:^{
        CPTabBarViewController *tab = (CPTabBarViewController *)self.tabBarController;
        tab.customTabBar.hidden = YES;
    } completion:^(BOOL finished) {
    }];
}
-(IBAction)addHomewor:(id)sender
{

    HomeworkCouseViewController *couse=[[HomeworkCouseViewController alloc]init];
    [[self navigationController] pushViewController:couse animated:NO];

}
- (void)viewDidLoad
{
    [super viewDidLoad];
//    [self JsonObject];

    // Do any additional setup after loading the view from its nib.
}
#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    //return [HomeworkNameArry count];
    return 6;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.font=[UIFont systemFontOfSize:30];
    cell.textLabel.text=[NSString stringWithFormat:@"Homework%d",indexPath.row+1];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{

    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

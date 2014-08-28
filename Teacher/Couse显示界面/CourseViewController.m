//
//  CourseViewController.m
//  Teacher
//
//  Created by 罗强 on 14-7-22.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "CourseViewController.h"
#import "CouseStudentViewController.h"
#import "EnterIpViewController.h"
@interface CourseViewController ()<IPdelegate>
{
   
    
}
@property (nonatomic, assign) BOOL isSocketReady;
@property (strong, nonatomic) NSTimer *timerHearbeat;
@property (nonatomic, assign) BOOL isSocketConnect;
@end
@implementation CourseViewController
@synthesize string;
@synthesize IP;
@synthesize IPString;
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self time];
}
-(void)time
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale=[[NSLocale alloc]initWithLocaleIdentifier:@"en_US"];
    [dateFormatter setDateFormat:@"a"];
    NSString *strdating=[dateFormatter stringFromDate:[NSDate date]];
    //获得系统日期
    NSDate*date = [NSDate date];
    NSCalendar*calendar = [NSCalendar currentCalendar];
    NSDateComponents*comps=[calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit |NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit)fromDate:date];
    NSInteger year = [comps year];
    NSInteger month = [comps month];
    NSInteger day = [comps day];
    NSInteger hour = [comps hour];
    NSInteger  min = [comps minute];
    _timeLabel.text=[NSString stringWithFormat:@"%ld-%ld-%ld    %ld:%ld    %@",(long)year,(long)month,(long)day,(long)hour,(long)min,strdating];
    _timeLabel.textColor=[UIColor redColor];
    _nexttimeLabel.text=[NSString stringWithFormat:@"%ld-%ld-%ld    %ld:00    %@",(long)year,(long)month,(long)day,hour+1,strdating];
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
-(void)IPString:(NSString *)ip
{
    IP=ip;
}
-(IBAction)push:(id)sender
{

    
    if (IP!=nil) {
        CouseStudentViewController* _coupage=[[CouseStudentViewController alloc]init];
        [_coupage SocketIp:IP];
        [[self navigationController] pushViewController:_coupage animated:NO];
    }else{
        UIAlertView *al=[[UIAlertView alloc] initWithTitle:nil message:@"Please enter the IP address" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [al show];
    }
}
-(IBAction)enterip:(id)sender
{
    EnterIpViewController *enterip=[[EnterIpViewController alloc] init];
    enterip.delegate=self;
    [[self navigationController] pushViewController:enterip animated:NO];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end

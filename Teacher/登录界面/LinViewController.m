//
//  LinViewController.m
//  Teacher
//
//  Created by CollegePre on 14-8-8.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "LinViewController.h"
#import "CPTabBarViewController.h"
#import "GCDAsyncSocket.h"

@interface LinViewController ()<UITextFieldDelegate,GCDAsyncSocketDelegate>
{
    GCDAsyncSocket * _socket;

}
@property (nonatomic, assign) NSInteger activityType;
@property (strong, nonatomic) NSString *localIPAddress;
@property (strong, nonatomic) NSString *serverIPAddress;
@property (strong, nonatomic) NSString *account;
@property (strong,nonatomic)  NSString *command;
@property (strong,nonatomic)  NSString  *typr;
@property (strong, nonatomic) NSString *pass;
@property (strong, nonatomic) NSString *count;
@property (nonatomic, strong) NSMutableData *recData;
@property (nonatomic, assign) BOOL isSocketReady;
@property (nonatomic, assign) BOOL isConnected;
@property (nonatomic, assign) BOOL isSocketConnect;

@property (strong, nonatomic) UIActivityIndicatorView *indicator;
@property (strong, nonatomic) NSTimer *timerHearbeat;
@end
@implementation LinViewController
@synthesize Login;
@synthesize Username,Password;
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
    [self json_Object];
    self.Password.secureTextEntry=YES;//密码保护模式
    // 注册监听键盘位置改变的通知
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(keyboardWillChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
}
#pragma mark - 键盘位置发生改变时调用
- (void)keyboardWillChange:(NSNotification *)note{
    NSLog(@"键盘显示的坐标%@",note);

}
-(void)json_Object
{
    NSError *error;
    //读取Json
    //==Json文件路径
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *notepath=[paths objectAtIndex:0];
    NSString *Json_path=[notepath stringByAppendingPathComponent:@"JsonFile.json"];
    NSData *date=[NSData dataWithContentsOfFile:Json_path options:NSUTF8StringEncoding error:&error];
    NSLog(@"%@",error);
    if (error!=nil) {
        [self addJosn];
    }else{
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:date options:NSJSONReadingMutableLeaves error:&error];
        if (dic !=nil) {
            
            NSLog(@"不为空");
            
        }else{
            [self addJosn];
            
        }
    
    }
 
    
    
    

    
}
//吧json存储到本地
-(void)addJosn
{
    NSError *error;
    NSString *mainBundleDirectory=[[NSBundle mainBundle] bundlePath];
    NSString *path=[mainBundleDirectory stringByAppendingPathComponent:@"lesson_1.json"];
    NSData *date=[NSData dataWithContentsOfFile:path options:NSUTF8StringEncoding error:&error];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:date options:NSJSONReadingMutableLeaves error:&error];
    //讲字典转换为date数据类型
    NSData* jsonData =[NSJSONSerialization dataWithJSONObject:dic
                                                      options:NSJSONWritingPrettyPrinted error:&error];
    NSString *suv = [[NSString alloc] initWithData:jsonData
                                          encoding:NSUTF8StringEncoding];
    NSLog(@"%@",suv);
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *pathh=[paths objectAtIndex:0];
    NSString *Json_path=[pathh stringByAppendingPathComponent:@"JsonFile.json"];
    NSLog(@"%@",Json_path);
    [jsonData writeToFile:Json_path atomically:YES];
    
}
#pragma mark - 建立Socket连接。
-(void)viewDidAppear:(BOOL)animated//页面加载结束之后的动画
{
    [super viewDidAppear:YES];
    self.navigationController.navigationBarHidden=YES;
   
}
-(void)viewDidDisappear:(BOOL)animated//开始pus到下一界面的时候 确定动画

{
    [super viewDidDisappear:YES];
    
    self.navigationController.navigationBarHidden=NO;
    self.tabBarController.tabBar.hidden=YES;

}
-(IBAction)Login:(id)sender
{
    self.count = self.Username.text;
    self.pass = self.Password.text;
    self.Password.textColor=[UIColor clearColor];
    
    
#pragma mark warning 直接跳转
    if ([self.account isEqualToString:@""])
    {
        UIAlertView *alerView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"The account is missing" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alerView show];
        return;
    }
    else{
            NSLog(@"OK");
            CPTabBarViewController *bar=[[CPTabBarViewController alloc]init];
            self.view.window.rootViewController=bar;
             [Login loginHome];
    }
}

#pragma mark - textFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];

    return YES;
}
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    

    self.view.frame=CGRectMake(0, -100, self.view.frame.size.height, self.view.frame.size.width);
    
}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{

    return YES;

}
-(BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    return YES;

}// return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
- (void)textFieldDidEndEditing:(UITextField *)textField
{

    self.view.frame=CGRectMake(0, 0, self.view.frame.size.height, self.view.frame.size.width);


}
-(IBAction)forgot:(id)sender
{




}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

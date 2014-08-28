//
//  EnterIpViewController.m
//  Teacher
//
//  Created by CollegePre on 14-8-27.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "EnterIpViewController.h"

@interface EnterIpViewController ()

@end

@implementation EnterIpViewController
@synthesize IPsing;
@synthesize delegate;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewDidDisappear:(BOOL)animated//开始pus到下一界面的时候 确定动画

{
    [super viewDidDisappear:YES];
    self.navigationController.navigationBarHidden=NO;
}
-(void)viewDidAppear:(BOOL)animated//页面加载结束之后的动画
{
    self.navigationController.navigationBarHidden=YES;
    [super viewDidAppear:YES];

    /*
     if ([m isEqual:@"56"]) {
     
     if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
     SEL selector = NSSelectorFromString(@"setOrientation:");
     NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
     [invocation setSelector:selector];
     [invocation setTarget:[UIDevice currentDevice]];
     int val = UIDeviceOrientationPortrait;
     [invocation setArgument:&val atIndex:2];
     [invocation invoke];
     }
     }
     if ([m isEqual:@"78"]) {
     
     }
     */
}
-(void)note
{
    
    UIImageView *vi=[[UIImageView alloc]init];
    vi.frame=self.view.bounds;
    vi.backgroundColor=[UIColor grayColor];
    vi.alpha=0.8;
    vi.tag=20011;
    vi.hidden=YES;
    [self.view addSubview:vi];
    
    UILabel *lable=[[UILabel alloc]init];
    lable.text=@"Save success";
    lable.textColor=[UIColor blackColor];
    lable.frame=CGRectMake(420, 310, 120,80);
    lable.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"Dom_button.png"]];
    lable.backgroundColor=[UIColor grayColor];
    lable.font=[UIFont systemFontOfSize:17.0];
    lable.tag=20012;
    lable.hidden=YES;
    [vi addSubview:lable];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self note];
    [self.texfield becomeFirstResponder];
    self.texfield.clearsOnBeginEditing=NO;//UITextField的是否出现一件清除按钮
    self.texfield.keyboardType = UIKeyboardTypeNumberPad;   //设置键盘的样式
    self.texfield.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.texfield.returnKeyType =UIReturnKeyDone;   //return键变成什么键    
    NSUserDefaults *userd=[NSUserDefaults standardUserDefaults];
    NSString *string=[userd stringForKey:@"IPDress"];
    if (string!=nil) {
        self.texfield.text=string;
    }
    
}
-(IBAction)dome:(id)sender
{
    self.AlView=[[UIAlertView alloc]initWithTitle:nil message:@"Save success" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];

    [self.AlView show];
    [self.texfield resignFirstResponder];
    NSUserDefaults *userd=[NSUserDefaults standardUserDefaults];
    [userd setObject:self.texfield.text forKey:@"IPDress"];
    [userd synchronize];
     IPsing=self.texfield.text;
    [self.AlView dismissWithClickedButtonIndex:0 animated:NO];
}

-(IBAction)login:(id)sender
{
    if (IPsing !=nil) {
        [delegate IPString:IPsing];
        [[self navigationController] popViewControllerAnimated:NO];
    }else{
   
    }
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];//查一下resign这个单词的意思就明白这个方法了
    IPsing=textField.text;
    return YES;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  studentViewController.m
//  Teacher
//
//  Created by 罗强 on 14-7-22.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "studentViewController.h"
#import "ProfileViewController.h"
@interface studentViewController ()
@property (nonatomic,strong)UIButton *studentbutton;
@end

@implementation studentViewController
@synthesize studentbutton;
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
    

    
    
    self.ImageView.userInteractionEnabled=YES;
    
    for (int i = 0; i < 9; i ++)
        
    {
        UIButton *burron=[[UIButton alloc]init];
        burron .frame=CGRectMake(18 + 122  * (i % 8), 10 + 112* (i /8), 102, 102);  //button frame
        burron.backgroundColor=[UIColor clearColor];
        burron.tag=200+i;
        [burron setImage:[UIImage imageNamed:@"student_02.png"] forState:0];
        [self.ImageView addSubview:burron];
        burron.titleLabel.textColor=[UIColor blackColor];
        [burron addTarget:self action:@selector(swich:) forControlEvents:UIControlEventTouchUpInside];
        
        
        UILabel *lable=[[UILabel alloc]init];
        lable .frame=CGRectMake(38 + (122) * (i % 8),  95+ (112) * (i /8), 60, 20);
        lable.backgroundColor=[UIColor clearColor];
        lable.tag=200+i;
        lable.text=[NSString stringWithFormat:@"Student%d",i+1];
        lable.font = [UIFont systemFontOfSize: 14.0];
        lable.textColor=[UIColor blackColor];
        [self.ImageView  addSubview:lable];
        
        
    }

    // Do any additional setup after loading the view from its nib.
}
-(IBAction)back:(id)sender
{
//    [self dismissViewControllerAnimated:NO completion:nil];
    [[self navigationController]  popViewControllerAnimated:NO];

}
-(void)viewDidAppear:(BOOL)animated//页面加载结束之后的动画
{
    self.navigationController.navigationBarHidden=YES;
//    NSLog(@"3");
}
-(void)viewDidDisappear:(BOOL)animated//开始pus到下一界面的时候 确定动画

{
    self.navigationController.navigationBarHidden=NO;
}
-(void)swich:(NSInteger *)tag
{

    ProfileViewController *pre=[[ProfileViewController alloc]init];
    [[self navigationController]   pushViewController:pre animated:NO];

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  ShowTexeView.m
//  Teacher
//
//  Created by CollegePre on 14-8-7.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "ShowTexeView.h"
 
@implementation ShowTexeView
@synthesize showdelegate;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        
        UIButton *back=[[UIButton alloc]init];
        back.frame=CGRectMake(570, 5, 80, 40);
        [back setTitle:@"back" forState:0];
        back.titleLabel.font=[UIFont systemFontOfSize:27];
        back.backgroundColor=[UIColor redColor];
        [back addTarget:self action:@selector(remove) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:back];
        
        
        
        self.userInteractionEnabled=YES;
        self.textView=[[UITextView alloc]init];
        self.textView.tag=100002;
        self.textView.frame=CGRectMake(0, 50,675, 482);
        self.textView.delegate=self;
        self.textView.backgroundColor=[UIColor grayColor];
        self.textView.textColor=[UIColor blackColor];
        self.textView.font=[UIFont  systemFontOfSize:30];
        [self addSubview:self.textView];
        
        
        
        _RemoveButton=[[UIButton alloc]init];
        _RemoveButton.frame=CGRectMake(220, 470, 100, 40);
        [_RemoveButton setTitle:@"remove" forState:0];
        _RemoveButton.titleLabel.font=[UIFont systemFontOfSize:27];
        _RemoveButton.backgroundColor=[UIColor grayColor];
        [_RemoveButton addTarget:self action:@selector(remove) forControlEvents:UIControlEventTouchUpInside];
        _RemoveButton.hidden=YES;
        [self addSubview:_RemoveButton];
        
        
        _saveButton=[[UIButton alloc]init];
        _saveButton.frame=CGRectMake(380, 470, 100, 40);
        [_saveButton setTitle:@"save" forState:0];
        _saveButton.titleLabel.font=[UIFont systemFontOfSize:27];
        _saveButton.backgroundColor=[UIColor grayColor];
        [_saveButton addTarget:self action:@selector(save) forControlEvents:UIControlEventTouchUpInside];
        _saveButton.hidden=YES;
        [self addSubview:_saveButton];
    
        
    }
    return self;
}
//键盘退出
- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    textView.frame=CGRectMake(0, 0, 675, 460);
    _saveButton.hidden=NO;
    _RemoveButton.hidden=NO;
    
    self.Note=textView.text;
    return YES;
}
-(void)shoewTextViewtext:(NSString *)couse Part:(NSString *)pare  Note:(NSString *)note
{
    self.Couse=couse;
    self.Part=pare;
    self.removeNote=note;
    UITextView *textview=(UITextView *)[self viewWithTag:100002];
    textview.text=note;
    textview.backgroundColor=[UIColor blueColor];
    textview.textColor=[UIColor blackColor];
    textview.font=[UIFont  systemFontOfSize:30];
}
-(void)save
{

    [showdelegate Newcoust:self.Couse Newpart:self.Part Newnote:self.Note removew:self.removeNote];
    
}
-(void)remove
{


    [showdelegate removeShowView];


}


@end

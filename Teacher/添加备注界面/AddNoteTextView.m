//
//  AddNoteTextView.m
//  Teacher
//
//  Created by CollegePre on 14-8-6.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "AddNoteTextView.h"

@implementation AddNoteTextView
@synthesize delegateTEXT;
- (id)initWithFrame:(CGRect)frame

{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled=YES;
        UITextView *text=[[UITextView alloc]init];
        text.tag=100000;
        text.frame=CGRectMake(10, 10,655, 420);
        text.delegate=self;
        text.backgroundColor=[UIColor blueColor];
        text.textColor=[UIColor blackColor];
        text.font=[UIFont  systemFontOfSize:30];
        [self addSubview:text];
        
        
        
        UIButton *remove=[[UIButton alloc]init];
        remove.frame=CGRectMake(220, 450, 100, 40);
        [remove setTitle:@"remove" forState:0];
        remove.titleLabel.font=[UIFont systemFontOfSize:27];
        remove.backgroundColor=[UIColor greenColor];
        [remove addTarget:self action:@selector(remove) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:remove];
        
        
        
        
        UIButton *save=[[UIButton alloc]init];
        save.frame=CGRectMake(380, 450, 100, 40);
        [save setTitle:@"save" forState:0];
        save.titleLabel.font=[UIFont systemFontOfSize:27];
        save.backgroundColor=[UIColor greenColor];
        [save addTarget:self action:@selector(save) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:save];
        
    }
    return self;
}
-(void)save
{
    NSLog(@"%@",self.string);
    if (self.string==NULL) {
        UIAlertView *al=[[UIAlertView alloc]initWithTitle:nil message:@"你保存的备注为空" delegate:self cancelButtonTitle:@"重新编辑我的备注" otherButtonTitles:@"取消我得备注编辑", nil];
        [al show];
    }else{
    
        [delegateTEXT textString:self.string edit:100];

    }
}
-(void)remove
{
    NSLog(@"remove");

}
//内容发生改变编辑
- (void)textViewDidChange:(UITextView *)textView
{
    NSLog(@"1-------------%@",textView.text);

    [delegateTEXT judge:textView.text];
    
}



//键盘退出
- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    self.string=textView.text;
    NSLog(@"%@",self.string);
    return YES;
}
//当编辑备注的时候  备注里面的信息为空的时候就弹出提示框 提示编辑的类容为空  同时给出选择
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:{
        
            NSLog(@"重新编辑我的备注");
        }
            break;
        case 1:{
        
            NSLog(@"取消我得备注编辑");
        
        }
            
        default:
            break;
    }
}
-(void)shoewTextViewtext:(NSString *)couse Part:(NSString *)pare  Note:(NSString *)note
{
    UITextView *textview=(UITextView *)[self viewWithTag:100000];
    textview.text=note;
    textview.backgroundColor=[UIColor blueColor];
    textview.textColor=[UIColor blackColor];
    textview.font=[UIFont  systemFontOfSize:30];

}
@end

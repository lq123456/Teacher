//
//  EditNotesViewController.m
//  Teacher
//
//  Created by CollegePre on 14-8-13.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "EditNotesViewController.h"

@interface EditNotesViewController (){

  NSString *noteText;
  NSString *image;

}

@end

@implementation EditNotesViewController
@synthesize Editdelegate;
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
    // Do any additional setup after loading the view from its nib.
}
-(IBAction)RemoveEditsNotesView:(id)sender
{

    if ([image isEqualToString:@"123"]) {
        
        if ([noteText  length]==0) {
            NSLog(@"你添加的内容为空");
            [Editdelegate  removeEditNoteView];
        }else{
            
            NSLog(@"11111--------%@",noteText);
            NSLog(@"添加成功");
            [Editdelegate EditNoteVieweText:noteText];
            [Editdelegate removeEditNoteView];
        }
    }

}

//键盘退出
- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    
    noteText=textView.text;
    image=@"123";
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

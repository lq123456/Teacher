//
//  SharNoteViewController.m
//  Teacher
//
//  Created by CollegePre on 14-8-13.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "SharNoteViewController.h"
@interface SharNoteViewController ()
@end
@implementation SharNoteViewController
@synthesize textView;
@synthesize Shardelegate;

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
-(IBAction)SharButton:(id)sender
{

    [Shardelegate   removeSharNoteView ];
    [Shardelegate SharNoteVieweText:self.textView.text];

}
-(IBAction)CloseButton:(id)sender
{
    
    [Shardelegate   removeSharNoteView ];
    
}
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    return NO;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

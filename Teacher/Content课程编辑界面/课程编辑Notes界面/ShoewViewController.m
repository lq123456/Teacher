//
//  ShoewViewController.m
//  Teacher
//
//  Created by CollegePre on 14-8-13.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "ShoewViewController.h"

@interface ShoewViewController ()

@end

@implementation ShoewViewController
@synthesize textView;
@synthesize Showdelegate;
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
-(IBAction)CloseNote:(id)sender
{

    [Showdelegate removeShowNoteView];

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

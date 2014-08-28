//
//  ShoewViewController.h
//  Teacher
//
//  Created by CollegePre on 14-8-13.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ShowNoteDelegate <NSObject>
-(void)removeShowNoteView;
@end
@interface ShoewViewController : UIViewController
@property(nonatomic,assign)id <ShowNoteDelegate>Showdelegate;

@property (nonatomic,strong) IBOutlet UITextView *textView;
@end

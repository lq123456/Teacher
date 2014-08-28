//
//  EditNotesViewController.h
//  Teacher
//
//  Created by CollegePre on 14-8-13.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol EditNoteDelegate <NSObject>
-(void)removeEditNoteView;
-(void)EditNoteVieweText:(NSString *)text;
@end
@interface EditNotesViewController : UIViewController
@property(nonatomic,assign)id <EditNoteDelegate>Editdelegate;

@property (nonatomic,strong) IBOutlet UITextView * textView;
@end

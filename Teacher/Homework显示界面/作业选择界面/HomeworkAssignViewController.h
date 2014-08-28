//
//  HomeworkAssignViewController.h
//  Teacher
//
//  Created by CollegePre on 14-7-24.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AssignTableViewCell.h"
@interface HomeworkAssignViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIWebViewDelegate,AstableViewCelldelegate>
@property (nonatomic,strong) NSString *barString;
@property (nonatomic,strong) AssignTableViewCell *Assincell;
@property(nonatomic,strong) IBOutlet UILabel *lableBarText;
@property(nonatomic,strong) IBOutlet UIButton *BackButton;
@property(nonatomic,strong) IBOutlet UITableView *tablecell;
@property (nonatomic,strong) IBOutlet UIWebView *wepView;
@end

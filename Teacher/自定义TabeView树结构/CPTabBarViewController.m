//
//  CPTabBarViewController.m
//  Learner Kit
//
//  Created by Wade on 14-8-7.
//  Copyright (c) 2014年 itcast1. All rights reserved.
// icon :156 * 163

#import "CPTabBarViewController.h"
#import "CPTabBarView.h"
#import "CourseViewController.h"
#import "StudentsViewController.h"
#import "ContentHomeViewController.h"
#import "HomeworkViewController.h"
@interface CPTabBarViewController ()<CPTabBarViewDelegate>

@end

@implementation CPTabBarViewController
@synthesize customTabBar;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // 初始化自己的所有子控制器
        [self setupAllChildVCs];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"back_image.png"]];
    [self.tabBar removeFromSuperview];
  
    [self setupTabBarView];
    
}

- (void)setupTabBarView
{

    CPTabBarView *tab = [[CPTabBarView alloc] init];
    tab.frame = CGRectMake(200, 640, 600, 120);
    tab.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"back_image.png"]];
    self.customTabBar = tab;
    tab.delegate = self;
    [self.view addSubview:tab];
}

- (void)setupAllChildVCs
{

    CourseViewController *class = [[CourseViewController alloc] init];
    [self setupOneChildVC:class title:@"Course" imageName:@"menuicon_course_normal" selectedImageName:@"menuicon_course_clicked"];
//

    ContentHomeViewController *home = [[ContentHomeViewController alloc] init];
    [self setupOneChildVC:home title:@"Content" imageName:@"menuicon_content_normal" selectedImageName:@"menuicon_content_current"];
    

    StudentsViewController *statistics = [[StudentsViewController alloc] init];
    [self setupOneChildVC:statistics title:@"Student" imageName:@"menuicon_student_normal" selectedImageName:@"menuicon_student_current"];
    

    HomeworkViewController *system = [[HomeworkViewController alloc] init];
    [self setupOneChildVC:system title:@"Homework" imageName:@"menuicon_honmework_normal" selectedImageName:@"menuicon_honmework_current"];
}
- (void)setupOneChildVC:(UIViewController *)child title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    // 1.设置tabBarItem
    // 设置标题
    child.title = title;
    // 设置图片
    child.tabBarItem.image = [UIImage imageNamed:imageName];
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
//    if (iOS7) { // 如果是iOS7, 不需要渲染图片
//        selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    }
    // 设置选中的图片
    child.tabBarItem.selectedImage = selectedImage;
    
    // 2.添加子控制器
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:child];
    [self addChildViewController:nav];
    
    // 3.往tabbar里面添加选项卡按钮
    [self.customTabBar addTabBarButton:child.tabBarItem];
}

#pragma mark - TabBarView的代理方法
- (void)tabBar:(CPTabBarView *)tabBar didSelectButtonFrom:(int)from to:(int)to
{
    self.selectedIndex = to;
    
    // 相同
//    self.selectedViewController = self.childViewControllers[to];
}


@end

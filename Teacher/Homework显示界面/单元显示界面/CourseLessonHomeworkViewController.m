//
//  CourseLessonHomeworkViewController.m
//  Teacher
//
//  Created by CollegePre on 14-8-22.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "CourseLessonHomeworkViewController.h"
#import "HomeworkAssignViewController.h"
@interface CourseLessonHomeworkViewController ()

@end

@implementation CourseLessonHomeworkViewController
@synthesize lessonView,collcell;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(IBAction)Back:(id)sender
{

    [[self navigationController]popViewControllerAnimated:NO];


}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [lessonView registerClass:[CollectionCell class] forCellWithReuseIdentifier:@"CollectionCell"];
    lessonView.backgroundView.backgroundColor=nil;
    lessonView.backgroundColor=[UIColor whiteColor];
    // Do any additional setup after loading the view from its nib.
}
//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 9;
}
//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
    
}
//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //    UICollectionViewCell * cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    HomeworkAssignViewController *kassing=[[HomeworkAssignViewController alloc]init];
    [[self navigationController]  pushViewController:kassing animated:NO];
    
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionCell *cell = (CollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionCell" forIndexPath:indexPath];
    cell.textLable.text=[NSString  stringWithFormat:@"Lesson%d",indexPath.item+1];
    cell.buttonItem.hidden=YES;
    return cell;
    
    
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectioView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"CollectionCell";
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(130, 150);
}
-(void)viewDidDisappear:(BOOL)animated//开始pus到下一界面的时候 确定动画

{
    self.navigationController.navigationBarHidden=NO;
}
-(void)viewDidAppear:(BOOL)animated//页面加载结束之后的动画
{
    self.navigationController.navigationBarHidden=YES;
    //    NSLog(@"3");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  HomeworkCouseViewController.m
//  Teacher
//
//  Created by CollegePre on 14-7-24.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "HomeworkCouseViewController.h"
#import "CourseLessonHomeworkViewController.h"
@interface HomeworkCouseViewController ()
{

    CGRect frame;
    NSMutableArray *url;
}
@property (strong ,nonatomic)  NSArray *array;
@property (strong,nonatomic) NSString *textstring;
@end

@implementation HomeworkCouseViewController
@synthesize collView;
@synthesize collcell;
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
    [collView registerClass:[CollectionCell class] forCellWithReuseIdentifier:@"CollectionCell"];
    collView.backgroundView.backgroundColor=nil;
    collView.backgroundColor=[UIColor whiteColor];
  
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
//    CourseLessonHomeworkViewController
    CourseLessonHomeworkViewController *kassing=[[CourseLessonHomeworkViewController alloc]init];
    [[self navigationController]  pushViewController:kassing animated:NO];
//    HomeworkAssignViewController *kassing=[[HomeworkAssignViewController alloc]init];
//    [[self navigationController]  pushViewController:kassing animated:YES];
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
   CollectionCell *cell = (CollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionCell" forIndexPath:indexPath];
    cell.textLable.text=[NSString  stringWithFormat:@"Couse%d",indexPath.item+1];
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
-(IBAction)back:(id)sender
{

    [[self navigationController] popViewControllerAnimated:NO];

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

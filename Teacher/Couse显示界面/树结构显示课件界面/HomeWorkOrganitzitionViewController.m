//
//  HomeWorkOrganitzitionViewController.m
//  Teacher
//
//  Created by CollegePre on 14-8-13.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "HomeWorkOrganitzitionViewController.h"
@interface HomeWorkOrganitzitionViewController ()
{
    NSMutableArray *namearry;
    NSMutableArray *urlarry;

}
@end

@implementation HomeWorkOrganitzitionViewController
@synthesize homeWorkdelegate;
- (void)viewDidLoad
{
    [super viewDidLoad];
    namearry=[[NSMutableArray alloc]init];
    urlarry=[[NSMutableArray alloc]init];
    
    
    [self json];

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)json
{
    
    NSError *error;
    NSString *mainBundleDirectory=[[NSBundle mainBundle] bundlePath];
    NSString *path=[mainBundleDirectory stringByAppendingPathComponent:@"homework.json"];
    NSData *date=[NSData dataWithContentsOfFile:path options:NSUTF8StringEncoding error:&error];
    NSDictionary *weatherDic= [NSJSONSerialization JSONObjectWithData:date options:NSJSONReadingMutableLeaves error:&error];
//    NSLog(@"%@",weatherDic);
    NSDictionary *di=[weatherDic objectForKey:@"content"];
    NSDictionary *dic=[di objectForKey:@"content"];
    //    NSLog(@"%@",dic);
    for (NSDictionary *d in dic) {
        NSDictionary *name=[d objectForKey:@"name"];
        NSString *strname=[name objectForKey:@"English"];
        [namearry addObject:strname];
        NSDictionary *dress=[d objectForKey:@"content"];
        NSString *stUrl=[dress objectForKey:@"address"];
        [urlarry addObject:stUrl];
        //        NSString *partID=[d objectForKey:@"part id"];
        //        NSString *data=[d objectForKey:@"data"];
        //        NSString *order=[d objectForKey:@"order"];
        //        NSString *partnum=[d objectForKey:@"part no"];
        //        NSString *type=[d objectForKey:@"type"];
    }
//    NSLog(@"%@",namearry);
//    NSLog(@"%@",urlarry);
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [namearry count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    //    if ([namearry count]!=0) {
    cell.textLabel.text=[namearry objectAtIndex:indexPath.row];
    //    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
    NSString *link=[urlarry objectAtIndex:indexPath.row];
//    NSLog(@"%@",link);
    [homeWorkdelegate HomeworkWep:link];
    [homeWorkdelegate Homeworkoder:indexPath.row+1];
}
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

@end

//
//  RandomTableViewController.m
//  Info Test
//
//  Created by apple on 12-5-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "RandomTableViewController.h"

@implementation RandomTableViewController
@synthesize labelResult;
@synthesize choiceA;
@synthesize choiceB;
@synthesize choiceC;
@synthesize choiceD;
@synthesize descriptionTextView;
@synthesize finishText;
@synthesize next;
@synthesize finish;
@synthesize position;
@synthesize data;
@synthesize current = _current;
@synthesize count;
@synthesize WAcount;
@synthesize textToDisplay;
@synthesize buttonToResult;

-(NSInteger) getRandomNumber
{
    return arc4random() % data.count;
}

- (NSDictionary *)dictAtIndex:(NSUInteger)index
{
    return [self.data objectAtIndex:self.current];
}

-(void) update
{
    NSDictionary *mydic;
    mydic = [self.data objectAtIndex:self.current];
    self.descriptionTextView.text = [mydic objectForKey:@"q"];
    self.descriptionTextView.text = [NSString stringWithFormat:@"    %@",self.descriptionTextView.text];
    labelResult.text = @"";
    self.choiceA.text = [NSString stringWithFormat:@"A.%@",[mydic objectForKey:@"a"]];
    self.choiceB.text = [NSString stringWithFormat:@"B.%@",[mydic objectForKey:@"b"]];
    self.choiceC.text = [NSString stringWithFormat:@"C.%@",[mydic objectForKey:@"c"]];
    self.choiceD.text = [NSString stringWithFormat:@"D.%@",[mydic objectForKey:@"d"]];
    
}

- (NSUInteger)currentKey
{
    NSString *s = [[self.data objectAtIndex:self.current]objectForKey:@"k"];
    
    if ([s isEqualToString:@"A"]) {
        return 1;
    } else if([s isEqualToString:@"B"]){
        return 2;
    } else if([s isEqualToString:@"C"]){
        return 3;
    } else if([s isEqualToString:@"D"]){
        return 4;
    }
    return 0;
}

-(NSInteger)current
{
    if (_current > data.count) {
        return data.count;
    } else if (_current < 0) {
        return 0;
    }
    return _current;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)click:(id)sender {
    count++;
    if(count > 20)
    {
        return;
    }
    else if (count == 20) 
    {
        finish.hidden = false;
        next.enabled = NO; next.hidden = YES;
        finishText.text = [NSString stringWithFormat:@"正确率 %u／%u",WAcount,count];
        if(WAcount != count)
            buttonToResult.hidden = false;
        [[NSUserDefaults standardUserDefaults]setObject:textToDisplay forKey:@"keyToResultText"];
        self.descriptionTextView.text = @"";
        self.choiceA.hidden = true;
        self.choiceB.hidden = true;
        self.choiceC.hidden = true;
        self.choiceD.hidden = true;
        labelResult.hidden = true;
        position.hidden = true;
    }
    else
    {
        self.current = [self getRandomNumber];
        [self update];
        next.hidden = true;
        position.text = [NSString stringWithFormat:@"%d／20",count+1];
    }
}



- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    WAcount = count = 0;
    finish.hidden = true;
    next.hidden = true;
    buttonToResult.hidden = true;
    textToDisplay = [NSMutableString stringWithString:@"错题整理：\r\n\r\n"];
    self.current = [self getRandomNumber];
    [self update];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [self setLabelResult:nil];
    [self setChoiceA:nil];
    [self setChoiceB:nil];
    [self setChoiceC:nil];
    [self setChoiceD:nil];
    [self setDescriptionTextView:nil];
    [self setFinishText:nil];
    [self setNext:nil];
    [self setFinish:nil];
    [self setPosition:nil];
    [self setButtonToResult:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 6;
}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *CellIdentifier = @"Cell";
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//    }
//    
//    // Configure the cell...
//    
//    return cell;
//}

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
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *s;
    switch ([self currentKey]) {
        case 1:
            s = @"A";
            break;
        case 2:
            s = @"B";
            break;
        case 3:
            s = @"C";
            break;
        case 4:
            s = @"D";
            break;
        default:
            break;
    }
    switch (indexPath.row) {
        case 0:
            break;
        case 1:
        case 2:
        case 3:
        case 4:
            if (indexPath.row == [self currentKey]) {
                labelResult.text = @"回答正确！";WAcount++;
                }

            else {
                labelResult.text = [NSString stringWithFormat:@"正确答案为 %@",s];
                NSMutableString *textToAdd = [[NSMutableString alloc] initWithFormat:@"%d. ",count+1];
                [textToAdd appendString:descriptionTextView.text];
                [textToAdd appendString:choiceA.text];
                [textToAdd appendString:choiceB.text];
                [textToAdd appendString:choiceC.text];
                [textToAdd appendString:choiceD.text];
                [textToAdd appendString:@"\r\n\r\n"];
                [textToAdd appendString:labelResult.text];
                [textToAdd appendString:@"\r\n\r\n"];
                [textToDisplay appendString:textToAdd];
                NSLog(@"textToAdd = %@",textToAdd);
                NSLog(@"textToDisplay = %@",textToDisplay);
            }
            next.hidden = false;
        default:
            break;
    }
    //[UIView animateWithDuration:0.5 animations:^() {
      //  self.labelResult.alpha = 0;
    //}];
    // Navigation logic may go here. Create and push another view controller.
    /*
     
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end

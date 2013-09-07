//
//  TestTableViewController.m
//  Info Test
//
//  Created by apple on 12-5-12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TestTableViewController.h"


@implementation TestTableViewController

@synthesize tfButton;
@synthesize data;
@synthesize descriptionTextView;
@synthesize labelResult;
@synthesize choiceA;
@synthesize choiceB;
@synthesize choiceC;
@synthesize choiceD;
@synthesize numBar;
@synthesize current = _current;

- (NSDictionary *)dictAtIndex:(NSUInteger)index
{
    return [self.data objectAtIndex:self.current];
}

- (void) update
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
    [numBar setValue: [NSNumber numberWithInt:self.current].floatValue ];
    
    //set Label Color
    self.choiceA.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    self.choiceB.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    self.choiceC.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    self.choiceD.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    
    if(tfButton.on) {
        NSString *ans ;
        ans = [mydic objectForKey:@"k"];
        if([ans isEqualToString:@"A"]) {
            self.choiceA.textColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1];
        } else if ( [ans isEqualToString:@"B"] ){
            self.choiceB.textColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1];
        } else if ( [ans isEqualToString:@"C"] ){
            self.choiceC.textColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1];
        } else if ( [ans isEqualToString:@"D"] ){
            self.choiceD.textColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1];
        }
        
    } else {
        ;
    }
    
    return ;

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

- (IBAction)prev:(id)sender {

    if(self.current != 0) { 
        self.current = self.current - 1;
        [self update];
    }
}
- (IBAction)next:(id)sender {
 
    if(self.current < self.data.count - 1) {
        self.current = self.current + 1;
        [self update];
    }
}
- (IBAction)seek:(id)sender {
    
    self.current =[NSNumber numberWithFloat:numBar.value].integerValue;
    [self update];
    
}

- (IBAction)switch:(id)sender {
    [self update];
}



- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {

        // Custom initialization
    }
    return self;
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
    //NSLog(@"textView: %@", self.descriptionTextView.text);
    self.descriptionTextView.text = [[self dictAtIndex:self.current]objectForKey:@"q"]; 
    //NSLog(@"%@",[[self dictAtIndex:self.current]objectForKey:@"q"]);
    [numBar setMaximumValue:data.count - 1];
    [numBar setMinimumValue:0];
    self.current = 0;
    [self update];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [self setDescriptionTextView:nil];
    [self setLabelResult:nil];
    [self setChoiceA:nil];
    [self setChoiceB:nil];
    [self setChoiceC:nil];
    [self setChoiceD:nil];
    [self setNumBar:nil];
    [self setTfButton:nil];
    [self setDescriptionTextView:nil];
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
    return 6;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = nil;
    switch (indexPath.row) {
        case 0:
            CellIdentifier = @"Description Cell";
            break;
        case 1:
            CellIdentifier = @"Choice A Cell";
            break;
        case 2:
            CellIdentifier = @"Choice B Cell";
            break;
        case 3:
            CellIdentifier = @"Choice C Cell";
            break;
        case 4:
            CellIdentifier = @"Choice D Cell";
            break;
        case 5:
            CellIdentifier = @"Navigation Cell";
            break;
            
        default:
            break;
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (cell == nil) {
        NSLog(@"%d",indexPath.row);

        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSDictionary *dict = [self.data objectAtIndex:indexPath.row];
    //cell.textLabel.text = [NSString stringWithFormat:@"%d. %@",indexPath.row, CellIdentifier];
    // Configure the cell...
    
    return cell;
}*/

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
            if (indexPath.row == [self currentKey])
                labelResult.text = @"回答正确！";
            else
                labelResult.text = [NSString stringWithFormat:@"正确答案为 %@",s];
        default:
            break;
    }
    //[UIView animateWithDuration:0.5 animations:^() {
      //          self.labelResult.alpha = 0;
        //    }];
    // Navigation logic may go here. Create and push another view controller.
    /*
     
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end

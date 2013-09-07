//
//  MainViewController.m
//  Info Test
//
//  Created by apple on 12-5-12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"
#import "TestTableViewController.h"
#import "RandomTableViewController.h"

@implementation MainViewController
@synthesize timer = _timer;
@synthesize minorTimer = _minorTimer;
@synthesize timerPast = _timerPast;

@synthesize current = _current;
@synthesize modeSwitch = _modeSwitch;
@synthesize array = _array;
@synthesize tableView = _tableView;
@synthesize navigationCell = _navigationCell;
@synthesize managedObjectContext = _managedObjectContext;
@synthesize flipsidePopoverController = _flipsidePopoverController;

- (void)setCurrent:(NSInteger)current
{
    if (self.array.count > 0) {
        NSLog(@"ok");
    }else{
        return;
    }
    _current = current;
    if (current<0) {
        _current = 0;
    }
    if (current>=self.array.count) {
        _current = self.array.count -1;
    }
    
}

- (IBAction)ChageCurrent:(id)sender
{
    if ([sender isKindOfClass:[UIButton class]]) {
        UIButton *button = sender;
        if ([button.titleLabel.text isEqualToString:@"PREV"]) {
            NSLog(@"PREV");
            self.current = self.current-1;
        }
        if ([button.titleLabel.text isEqualToString:@"NEXT"]) {
            NSLog(@"NEXT");
            self.current = self.current+1;
        }
        [self.tableView reloadData];
    }
    if ([sender isKindOfClass:[UISlider class]]) {
        NSLog(@"sender slider");
        
        self.current = [NSNumber numberWithFloat:((UISlider *)sender).value].intValue;
        [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:
                                                [NSIndexPath indexPathForRow:0 inSection:0],
                                                [NSIndexPath indexPathForRow:0 inSection:1],
                                                [NSIndexPath indexPathForRow:1 inSection:1],
                                                [NSIndexPath indexPathForRow:2 inSection:1],
                                                [NSIndexPath indexPathForRow:3 inSection:1], 
                                                nil] withRowAnimation:UITableViewRowAnimationNone];
        NSLog(@"%d",self.current);
    }
    
}

- (IBAction)changeMode:(id)sender {
    [self.tableView reloadData];
}

- (NSDictionary *)currentQuestion
{
    return [self.array objectAtIndex:self.current];
}

- (NSString *)currentDescription
{
    
    return [[self currentQuestion]objectForKey:@"q"];
}

- (NSString *)currentChoiceForRow:(NSUInteger)row
{
    switch (row) {
        case 0:
            return [@"A " stringByAppendingString:[self.currentQuestion objectForKey:@"a"]];
        case 1:
            return [@"B " stringByAppendingString:[self.currentQuestion objectForKey:@"b"]];
        case 2:
            return [@"C " stringByAppendingString:[self.currentQuestion objectForKey:@"c"]];
        case 3:
            return [@"D " stringByAppendingString:[self.currentQuestion objectForKey:@"d"]];
        default:
            return @"";
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 1;
        case 1:
            return 4;
        case 2:
            return 1;
        default:
            return 0;
    }
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
            return tableView.frame.size.height - 5*70;
        case 1:
            return 70;
        case 2:
            return 70;
        default:
            return 0;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = nil;
    switch (indexPath.section) {
        case 0:
            cellIdentifier = @"Description Cell";
            break;
        case 1:
            cellIdentifier = @"Choice Cell";
            break;
        case 2:
            cellIdentifier = @"Navigation Cell";
            break;
        default:
            break;
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    NSString *key = [[self currentQuestion]objectForKey:@"k"];
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text = [self currentDescription];
            break;
        case 1:
            cell.textLabel.text = [self currentChoiceForRow:indexPath.row];
            cell.accessoryType = UITableViewCellAccessoryNone;
            if (self.modeSwitch.on) {
                switch (indexPath.row) {
                    case 0:
                        if ([key isEqualToString:@"A"]) {
                            cell.accessoryType = UITableViewCellAccessoryCheckmark;
                        }
                        break;
                    case 1:
                        if ([key isEqualToString:@"B"]) {
                            cell.accessoryType = UITableViewCellAccessoryCheckmark;
                        }
                        break;
                        
                    case 2:
                        if ([key isEqualToString:@"C"]) {
                            cell.accessoryType = UITableViewCellAccessoryCheckmark;
                        }
                        break;
                        
                    case 3:
                        if ([key isEqualToString:@"D"]) {
                            cell.accessoryType = UITableViewCellAccessoryCheckmark;
                        }
                        break;
                        
                    default:
                        break;
                }
            }

            break;
        case 2:
            self.navigationCell = (NavigationCell *)cell;
            self.navigationCell.slider.value = self.current;
            self.navigationCell.slider.maximumValue = self.array.count - 1;
            break;
        default:
            break;
    }

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *key = [[self currentQuestion]objectForKey:@"k"];
    switch (indexPath.row) {
        case 0:
            if ([key isEqualToString:@"A"]) {
                [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
            }
            break;
        case 1:
            if ([key isEqualToString:@"B"]) {
                [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
            }
            break;
        
        case 2:
            if ([key isEqualToString:@"C"]) {
                [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
            }
            break;

        case 3:
            if ([key isEqualToString:@"D"]) {
                [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
            }
            break;
            
        default:
            break;
    }
}


- (id)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        id delegate = [[UIApplication sharedApplication] delegate];
        self.managedObjectContext = [delegate managedObjectContext];
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (void)timerFireMethod:(NSTimer*)theTimer
{
    //NSDateFormatter *dateformatter = [[[NSDateFormatter alloc]init] autorelease];//定义NSDateFormatter用来显示格式
    //[dateformatter setDateFormat:@"yyyy MM dd hh mm ss"];//设定格式
    NSCalendar *cal = [NSCalendar currentCalendar];//定义一个NSCalendar对象
    NSDateComponents *testDate = [[NSDateComponents alloc] init];//初始化目标时间
    [testDate setYear:2012];
    [testDate setMonth:6];
    [testDate setDay:29];//使用NSTimer实现倒计时
    
    NSDate *todate = [cal dateFromComponents:testDate];//把目标时间装载入date
    //[testDate release];
    
    NSDate *today = [NSDate date];//得到当前时间
    unsigned int unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *d = [cal components:unitFlags fromDate:today toDate:todate options:0];
    if([d month] > 0)
        _timer.text = [NSString stringWithFormat:@"%d 个月  %d 天",[d month],[d day]];
    else if([d day] >= 0)
        _timer.text = [NSString stringWithFormat:@"%d 天",[d day]];
    else
    {
        _minorTimer.hidden = true;
        _timerPast.hidden = false;
    }
}
#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    _timerPast.hidden = true;
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerFireMethod:) userInfo:nil repeats:YES];
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"res" ofType:@"txt"];
    self.array = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:path ] options:NSJSONReadingMutableLeaves error:nil];
    self.current = 0;
    NSLog(@"%@",self.array);
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setTableView:nil];
    [self setNavigationCell:nil];
    [self setModeSwitch:nil];
    [self setTimer:nil];
    [self setMinorTimer:nil];
    [self setTimerPast:nil];
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
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

#pragma mark - Flipside View Controller

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        [self dismissModalViewControllerAnimated:YES];
    } else {
        [self.flipsidePopoverController dismissPopoverAnimated:YES];
        self.flipsidePopoverController = nil;
    }
}

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    self.flipsidePopoverController = nil;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
        
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
            UIPopoverController *popoverController = [(UIStoryboardPopoverSegue *)segue popoverController];
            self.flipsidePopoverController = popoverController;
            popoverController.delegate = self;
        }
    } else if ([segue.identifier isEqualToString:@"Test Segue"]) {
        NSLog(@"Test Segue");
        TestTableViewController *ttvc = segue.destinationViewController;
        ttvc.data = [NSArray arrayWithArray: self.array];
    } else if([segue.identifier isEqualToString:@"Random Segue"]) {
        NSLog(@"Random Segue");
        RandomTableViewController *rtvc = segue.destinationViewController;
        rtvc.data = [NSArray arrayWithArray: self.array];
    }
}

- (IBAction)togglePopover:(id)sender
{
    if (self.flipsidePopoverController) {
        [self.flipsidePopoverController dismissPopoverAnimated:YES];
        self.flipsidePopoverController = nil;
    } else {
        [self performSegueWithIdentifier:@"showAlternate" sender:sender];
    }
}


@end

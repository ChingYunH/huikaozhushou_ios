//
//  MainViewController.h
//  Info Test
//
//  Created by apple on 12-5-12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "FlipsideViewController.h"
#import "NavigationCell.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate, UIPopoverControllerDelegate, UITableViewDataSource, UITableViewDelegate> {
    UILabel *_timer;
    UILabel *_minorTimer;
    UILabel *_timerPast;
}


@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (strong, nonatomic) UIPopoverController *flipsidePopoverController;

@property (strong, nonatomic) NSArray *array;

@property (assign, nonatomic) NSInteger current;

@property (weak, nonatomic) IBOutlet UISwitch *modeSwitch;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) NavigationCell *navigationCell;

- (IBAction)ChageCurrent:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *timer;
@property (strong, nonatomic) IBOutlet UILabel *minorTimer;
@property (strong, nonatomic) IBOutlet UILabel *timerPast;

@end

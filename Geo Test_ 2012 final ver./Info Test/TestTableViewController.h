//
//  TestTableViewController.h
//  Info Test
//
//  Created by apple on 12-5-12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestTableViewController : UITableViewController {
    UILabel *labelResult;
    UILabel *choiceA;
    UILabel *choiceB;
    UILabel *choiceC;
    UILabel *choiceD;
    UISlider *numBar;
    UISwitch *tfButton;
    UILabel *descriptionTextView;
}

@property  (strong, nonatomic) NSArray *data;
@property (assign, nonatomic) NSInteger current;
@property (strong, nonatomic) IBOutlet UILabel *descriptionTextView;
@property (strong, nonatomic) IBOutlet UISwitch *tfButton;
@property (strong, nonatomic) IBOutlet UILabel *labelResult;
@property (strong, nonatomic) IBOutlet UILabel *choiceA;
@property (strong, nonatomic) IBOutlet UILabel *choiceB;
@property (strong, nonatomic) IBOutlet UILabel *choiceC;
@property (strong, nonatomic) IBOutlet UILabel *choiceD;
@property (strong, nonatomic) IBOutlet UISlider *numBar;

@end

//
//  RandomTableViewController.h
//  Info Test
//
//  Created by apple on 12-5-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RandomTableViewController : UITableViewController {
    UILabel *labelResult;
    UILabel *choiceA;
    UILabel *choiceB;
    UILabel *choiceC;
    UILabel *choiceD;
    UILabel *descriptionTextView;
    UILabel *finishText;
    UIButton *next;
    UILabel *finish;
    UILabel *position;
    NSMutableString *textToDisplay;
    UIButton *buttonToResult;
}
@property  (strong, nonatomic) NSArray *data;
@property (assign, nonatomic) NSInteger current;
@property (assign, nonatomic) NSInteger count;
@property (assign, nonatomic) NSInteger WAcount;
@property (strong, nonatomic) IBOutlet UILabel *labelResult;
@property (strong, nonatomic) IBOutlet UILabel *choiceA;
@property (strong, nonatomic) IBOutlet UILabel *choiceB;
@property (strong, nonatomic) IBOutlet UILabel *choiceC;
@property (strong, nonatomic) IBOutlet UILabel *choiceD;
@property (strong, nonatomic) IBOutlet UILabel *descriptionTextView;
@property (strong, nonatomic) IBOutlet UILabel *finishText;
@property (strong, nonatomic) IBOutlet UIButton *next;
@property (strong, nonatomic) IBOutlet UILabel *finish;
@property (strong, nonatomic) IBOutlet UILabel *position;
@property (strong, nonatomic) NSMutableString *textToDisplay;
@property (strong, nonatomic) IBOutlet UIButton *buttonToResult;

@end

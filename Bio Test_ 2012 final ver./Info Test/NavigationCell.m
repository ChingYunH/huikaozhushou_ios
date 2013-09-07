//
//  NavigationCell.m
//  Info Test
//
//  Created by jack xia on 5/14/12.
//  Copyright (c) 2012 hsefz. All rights reserved.
//

#import "NavigationCell.h"

@implementation NavigationCell

@synthesize slider;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

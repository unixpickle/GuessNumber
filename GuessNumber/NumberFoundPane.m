//
//  NumberFoundPane.m
//  GuessNumber
//
//  Created by Alex Nichol on 1/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NumberFoundPane.h"

@implementation NumberFoundPane

- (id)initWithFrame:(CGRect)frame number:(NSNumber *)number {
    if ((self = [super initWithFrame:frame])) {
        topLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 40, frame.size.width - 20, 30)];
        [topLabel setFont:[UIFont systemFontOfSize:24]];
        [topLabel setTextAlignment:UITextAlignmentCenter];
        [topLabel setText:@"Your number was"];
        
        numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width / 2 - 40, 80, 80, 80)];
        [numberLabel setBackgroundColor:[UIColor grayColor]];
        [numberLabel setTextAlignment:UITextAlignmentCenter];
        [numberLabel setText:[number stringValue]];
        [numberLabel setFont:[UIFont boldSystemFontOfSize:30]];
        
        [self addSubview:topLabel];
        [self addSubview:numberLabel];
    }
    return self;
}

@end

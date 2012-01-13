//
//  NoNumberPane.m
//  GuessNumber
//
//  Created by Alex Nichol on 1/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NoNumberPane.h"

@implementation NoNumberPane

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        woopsLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 70, frame.size.width - 20, 30)];
        [woopsLabel setTextAlignment:UITextAlignmentCenter];
        [woopsLabel setFont:[UIFont systemFontOfSize:24]];
        [woopsLabel setText:@"Woops!"];
        
        subLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 105, frame.size.width - 20, 25)];
        [subLabel setFont:[UIFont systemFontOfSize:16]];
        [subLabel setTextAlignment:UITextAlignmentCenter];
        [subLabel setText:@"Your number doesn't exist"];
        
        [self addSubview:woopsLabel];
        [self addSubview:subLabel];
    }
    return self;
}

@end

//
//  PaneView.m
//  GuessNumber
//
//  Created by Alex Nichol on 1/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PaneView.h"

@implementation PaneView

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.borderColor = [[UIColor blackColor] CGColor];
        self.layer.borderWidth = 1;
        self.layer.cornerRadius = 4;
        
        self.layer.shadowOpacity = 0.5;
        self.layer.shadowColor = [[UIColor blackColor] CGColor];
        self.layer.shadowOffset = CGSizeMake(3, 3);
        self.layer.shadowRadius = 5;
    }
    return self;
}

@end

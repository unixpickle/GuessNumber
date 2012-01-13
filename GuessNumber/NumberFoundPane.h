//
//  NumberFoundPane.h
//  GuessNumber
//
//  Created by Alex Nichol on 1/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PaneView.h"

@interface NumberFoundPane : PaneView {
    UILabel * topLabel;
    UILabel * numberLabel;
}

- (id)initWithFrame:(CGRect)frame number:(NSNumber *)number;

@end

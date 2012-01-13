//
//  NumberGridView.m
//  GuessNumber
//
//  Created by Alex Nichol on 1/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NumberGridView.h"

@implementation NumberGridView

- (id)initWithFrame:(CGRect)frame width:(NSUInteger)cols height:(NSUInteger)rows {
    if ((self = [super initWithFrame:frame])) {
        horizontalSpacing = (frame.size.width - ((CGFloat)cols * kNumberCellWidth)) / (CGFloat)cols;
        verticalSpacing = (frame.size.height - ((CGFloat)rows * kNumberCellHeight)) / (CGFloat)rows;
        numCols = cols;
        numRows = rows;
        numLabels = [[NSMutableArray alloc] init];
        for (NSUInteger y = 0; y < rows; y++) {
            for (NSUInteger x = 0; x < cols; x++) {
                CGFloat xcoord = round(horizontalSpacing / 2 + x * (kNumberCellWidth + horizontalSpacing));
                CGFloat ycoord = round(verticalSpacing / 2 + y * (kNumberCellHeight + verticalSpacing));
                UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(xcoord, ycoord, kNumberCellWidth, kNumberCellHeight)];
                [label setBackgroundColor:[UIColor clearColor]];
                [label setTextAlignment:UITextAlignmentCenter];
                [self addSubview:label];
                [numLabels addObject:label];
            }
        }
    }
    return self;
}

- (UILabel *)labelForRow:(NSUInteger)row column:(NSUInteger)col {
    NSUInteger index = row * numRows + col;
    return [numLabels objectAtIndex:index];
}

- (void)setNumbers:(NSArray *)someNumbers {
    for (NSUInteger i = 0; i < [numLabels count]; i++) {
        if (i < [someNumbers count]) {
            NSString * str = [[someNumbers objectAtIndex:i] stringValue];
            [[numLabels objectAtIndex:i] setText:str];
        } else {
            [[numLabels objectAtIndex:i] setText:@""];
        }
    }
}

@end
